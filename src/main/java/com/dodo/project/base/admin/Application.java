package com.dodo.project.base.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

/*
 * <b>Application</b></br>
 *
 * <pre>
 * 项目启动类
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/11/8 16:33
 * @Since JDK 1.8
 */
@ComponentScan(basePackages = "com.dodo")
@SpringBootApplication
public class Application extends SpringBootServletInitializer {
	private final static Logger logger = LoggerFactory.getLogger(Application.class);

	public static void main(String [] agrs) {
		SpringApplication.run(Application.class, agrs);
	}
}
