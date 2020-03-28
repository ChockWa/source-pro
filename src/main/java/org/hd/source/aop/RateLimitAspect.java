package org.hd.source.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.hd.source.ratelimit.RateLimit;
import org.hd.source.ratelimit.RateLimiter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

import java.lang.reflect.InvocationTargetException;

/**
 * @auther: zhuohuahe
 * @date: 2019/6/3 14:45
 * @description:
 */
@Aspect
@Component
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class RateLimitAspect {

    @Autowired
    private RateLimiter rateLimiter;

    @Before(value = "@annotation(rateLimit)")
    public void doBeforeMethod(JoinPoint joinPoint, RateLimit rateLimit) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        rateLimiter.check(joinPoint.getThis(), rateLimit.fallback());
    }
}
