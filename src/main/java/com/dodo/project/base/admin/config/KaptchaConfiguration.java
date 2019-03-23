package com.dodo.project.base.admin.config;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

import java.util.Properties;

/*
 * <b>KaptchaConfiguration</b></br>
 *
 * <pre>
 * 验证码相关配置
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2019/1/28 15:50
 * @Since JDK 1.8
 */
@Configuration
public class KaptchaConfiguration {
	@Autowired
	private Environment env;
	/*
	 *
	 * <b>producer</b> <br/>
	 * <br/>
	 *
	 * 验证码默认配置 <br/>
	 *
	 * @author xqyjjq walk_code@163.com
	 * @return DefaultKaptcha
	 *
	 */
	@Bean
	public DefaultKaptcha producer() {
		Properties properties = new Properties();
		properties.put("kaptcha.border", "yes");
		properties.put("kaptcha.textproducer.font.color", "blue");
		properties.put("kaptcha.textproducer.char.space", "10");
		properties.put("kaptcha.textproducer.char.length", "4");
		properties.put("kaptcha.image.height", "30");
		properties.put("kaptcha.image.width", "112");
		properties.put("kaptcha.textproducer.font.size", "25");
		// 移除干扰线
		properties.put("kaptcha.noise.impl", "com.google.code.kaptcha.impl.NoNoise");
		properties.put("kaptcha.textproducer.font.names", "宋体,楷体,微软雅黑");
		properties.setProperty("kaptcha.noise.color", "blue");
		properties.setProperty("kaptcha.background.clear.from", "white");
		properties.setProperty("kaptcha.background.clear.to", "white");

		Config         config   = new Config(properties);
		DefaultKaptcha producer = new DefaultKaptcha();
		producer.setConfig(config);

		return producer;
	}
}
