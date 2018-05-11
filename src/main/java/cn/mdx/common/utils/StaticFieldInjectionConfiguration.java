package cn.mdx.common.utils;

import static cn.mdx.common.utils.StringUtil.isEmpty;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;


import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

/**
 * 工具类的注入
 *
 *
 */
@Component
public class StaticFieldInjectionConfiguration {

    @Resource(name = "messageSource")
    MessageSource resources;

    @PostConstruct
    private void init() {
    	System.out.println("\n\n-----Static Field Injection Configuration----");
		CheckUtil.setResources(resources);
    }
}