package org.just.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.springframework.core.io.ClassPathResource;

public class LoadProperties {

	public static Properties loadPro(){
			ClassPathResource cpr = new ClassPathResource("./com/winning/property/config.properties");
			InputStream inputStream;
			Properties properties=new Properties();
			try {
				inputStream = cpr.getInputStream();
				properties.load(inputStream);
			} catch (IOException e) {
				e.printStackTrace();
			}
		return properties;
	}
	
	public static String getProByName(String keyName){
		Properties pro = loadPro();
		pro.getProperty(keyName);
		return pro.getProperty(keyName)==null?"":pro.getProperty(keyName);
	}

}
