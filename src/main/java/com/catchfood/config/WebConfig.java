package com.catchfood.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	 @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
		 	registry.addResourceHandler("/**")
               .addResourceLocations("classpath:/static/");
       
		    registry.addResourceHandler("/css/**").addResourceLocations("classpath:/static/css/");
		    registry.addResourceHandler("/JS/**").addResourceLocations("classpath:/static/JS/");
		    registry.addResourceHandler("/images/**").addResourceLocations("classpath:/static/images/");
	 }
}