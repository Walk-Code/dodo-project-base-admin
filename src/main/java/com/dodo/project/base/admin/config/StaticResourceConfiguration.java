package com.dodo.project.base.admin.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.io.File;

/*
 * <b>StaticResourceConfiguration</b></br>
 *
 * <pre>
 * 静态资源访问配置
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2019/3/21 16:39
 * @Since JDK 1.8
 */
@Configuration
public class StaticResourceConfiguration extends WebMvcConfigurerAdapter {
	private static final String[] RESOURCE_LOCATIONS = {"classpath:/META-INF/resources/", "classpath:/resources/", "classpath:/static/", "classpath:/public/"};

	private static Logger log = LoggerFactory.getLogger(StaticResourceConfiguration.class);

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		try {
			File directiory = new File("");
			log.info(directiory.getCanonicalPath());
			registry.addResourceHandler("/**").addResourceLocations(RESOURCE_LOCATIONS);
		} catch (Exception e) {
			log.error("读取文件失败：{}", e);
		}
	}
}
