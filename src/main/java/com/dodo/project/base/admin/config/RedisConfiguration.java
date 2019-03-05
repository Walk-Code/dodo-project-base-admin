package com.dodo.project.base.admin.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;

/*
 * <b>RedisConfiguration</b></br>
 *
 * <pre>
 * redis配置
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2019/1/28 19:26
 * @Since JDK 1.8
 */
@Configuration
@PropertySource("classpath:application.properties")
public class RedisConfiguration {
	private static  final Logger log = LoggerFactory.getLogger(RedisConfiguration.class);

	@Value("${spring.redis.host}")
	private String server;

	@Value("${spring.redis.port}")
	private int port;

	// @Bean
	JedisConnectionFactory jedisConnectionFactory() {
		RedisStandaloneConfiguration config = new RedisStandaloneConfiguration(server, port);

		return new JedisConnectionFactory(config);
	}
}
