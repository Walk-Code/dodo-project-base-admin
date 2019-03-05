package com.dodo.project.base.admin.bean;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/*
 * <b>ReCaptchaSettingBean</b></br>
 *
 * <pre>
 * recaptcha 配置bean
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2019/2/12 18:27
 * @Since JDK 1.8
 */
@Component
@ConfigurationProperties(prefix = "google.recaptcha.key")
public class ReCaptchaSettingBean {
	private String site;
	private String secret;

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}
}
