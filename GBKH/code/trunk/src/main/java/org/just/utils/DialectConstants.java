package org.just.utils;

import java.util.HashMap;
import java.util.Map;

public class DialectConstants {

	public static Map<String, String> productMap = new HashMap<String, String>();

	static {
		productMap.put("microsoft sql server", "mssql");
		productMap.put("oracle", "oracle");
		productMap.put("mysql", "mysql");
	}

	public static String getLengthMethod(String fieldName) {
		return "len(" + fieldName + ")";
	}

}
