package org.hd.source.disruptor;

import com.google.common.util.concurrent.ThreadFactoryBuilder;
import com.lmax.disruptor.RingBuffer;
import com.lmax.disruptor.TimeoutException;
import com.lmax.disruptor.dsl.Disruptor;
import lombok.extern.slf4j.Slf4j;
import org.hd.source.mapper.GroupLogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;

/**
 * @auther: zhuohuahe
 * @date: 2019/7/10 18:24
 * @description:
 */
@Component
@Slf4j
public class LogEventDisruptor {

    private static final int bufferSize = 1024;

    private volatile Disruptor<LogEvent> disruptor;

    private RingBuffer<LogEvent> ringBuffer;

    private final GroupLogMapper groupLogMapper;

    @PostConstruct
    public synchronized void init(){
        if(disruptor == null){
            disruptor = new Disruptor<>(new LogEventFactory(), bufferSize,
                    new ThreadFactoryBuilder().setNameFormat("LogEventDisruptor-Thread").build());
            disruptor.handleEventsWithWorkerPool(new LogEventHandler(groupLogMapper));
            disruptor.setDefaultExceptionHandler(new LogEventExceptionHandler());
            ringBuffer = disruptor.start();
        }
    }

    public RingBuffer<LogEvent> getRingBuffer(){
        return ringBuffer;
    }

    @PreDestroy
    public void destory(){
        try {
            disruptor.shutdown(5, TimeUnit.SECONDS);
        } catch (TimeoutException e) {
            log.error("LogEventDisruptor close time out", e);
        }
    }

    public LogEventDisruptor(GroupLogMapper groupLogMapper){
        this.groupLogMapper = groupLogMapper;
    }
}
