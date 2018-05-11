package cn.mdx.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



/**
 * 处理和包装异常
 * 
 *
 */
public class ControllerAOP {
	private static final Logger logger = LoggerFactory.getLogger(ControllerAOP.class);

	public Object handlerControllerMethod(ProceedingJoinPoint pjp) throws Throwable {
		long startTime = System.currentTimeMillis();
		Object result;
		result = pjp.proceed();
		// 如果需要打印入参，
		Object[] args = pjp.getArgs();
		// 本次操作用时（毫秒）
		long elapsedTime = System.currentTimeMillis() - startTime;
		logger.info("[{}]use time: {}", pjp.getSignature(), elapsedTime);
		return result;
	}

}