package org.hd.source.service;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.hd.source.entity.SourceType;
import org.hd.source.mapper.SourceTypeMapper;
import org.hd.source.util.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SourceTypeService {

    @Autowired
    private SourceTypeMapper sourceTypeMapper;

    public List<SourceType> getSourceTypes(){
        return sourceTypeMapper
                .selectList(Wrappers.<SourceType>lambdaQuery().ge(SourceType::getStatus, 0));
    }

    public void add(SourceType sourceType){
        sourceTypeMapper.insert(sourceType);
    }
}
