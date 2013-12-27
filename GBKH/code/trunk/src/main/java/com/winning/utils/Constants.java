package com.winning.utils;

import org.springframework.context.ApplicationContext;

/**
 * 
 */
public final class Constants
{

	public static final int TRUE = 1;
	public static final int FALSE = 0;
	public static final int NOT = -1;
	public static final int ZERO = 0;
	public static final int FIRST = 1;
	public static final int TWO = 2;
	public static final int HUNRED = 100;
	public static final String STRING_INIT = "";
	public static final String XML_FILE_SUFFIX = ".xml";
	public static final int MAX_POST_SIZE = 100 * 1024 * 1024;
	public static final int UPLOAD_BUFFER_SIZE = 4096;
	public static final String APPLICATION_CONTEXT_PATH = "/net/newwinning/cp/property/applicationContext.xml";
	public static final String PERSISTENCE_DOMAIN_PACKAGE_PATH = "net.newwinning.cp.persistence.domain";
	public static ApplicationContext SPRING_CONTAINER = null;

	public static final String SESSION_ADMIN = "admin";
	public static final String SESSION_PATHWAY_PERMISSION = "pathwayPermission";
	public static final String SESSION_ID = "sessionID";
	public static final String LOGIN_PERSON = "loginPerson";
	
	public static final String DOSAGEUNIT_TYPE="dosageUnit";
	public static final String USEWAY_TYPE="useWay";
	public static final String FRENQUENCY_TYPE="frenquency";

	public static String WEBAPP_REAL_PATH = "";

	public static final int PATHWAY_CHANGESTATUS_SUCCESS = 1;
	public static final int PATHWAY_CHANGESTATUS_FAIL_USING = 2;
	public static final int PATHWAY_CHANGESTATUS_FAIL_EXAM = 3;
	public static final int PATHWAY_CHANGESTATUS_FAIL_SAME = 4;

	public static final int PATHWAY_CHANGETYPE_NORMAIL = 1;
	public static final int PATHWAY_CHANGETYPE_GREAT = 2;

	public static final int SESSION_DURATION = 720;

	public static final String DATE_PATTERN = "yyyy-MM-dd";
	public static final String DATE_PATTERN_TWO = "yyyy-MM-dd HH:mm:SS";
	public static final String DATE_PATTERN_THREE = "MM/dd HH/mm";
	public static final String WS_DATE_PATTERN = "yyyyMMddHHmmSS";
	public static final String WS_DATE_PATTERN_TWO = "yyyyMMdd";

	public static final int NO_OFFSET = 0;
	public static final int RESULT_SIZE = 100;
	public static final int RESULT_MAX_SIZE = 1000;

	public static final String SPLIT_SIGN = " ~ ";
	public static final int TYPE_COST = 1;
	public static final int TYPE_DAYS = 2;

	public static final int TOKEN_PATHWAY = 1;
	public static final int TOKEN_STEP = 2;
	public static final int TOKEN_ITEM = 3;

	public static final int ENABLE = 1;
	public static final int NO_ENABLE = 0;

	public static final int NO_FLAG = 0;
	public static final int ADD_FLAG = 1;
	public static final int UPDATE_FLAG = 2;
	public static final int DELETE_FLAG = 3;

	public static final String ON = "on";
	public static final String OFF = "off";

	public static final String SESSION_EXPIRED_EXCEPTION = "session has expired";

	public static final int MAX_NUM_FOR_PATIENT_LIST = 300;

	public static final String CENTER_SERVICES = "center_services";
	public static final String SERVICES_LEVEL_ZERO = "0";
	public static final String SERVICES_LEVEL_ONE = "1";
	public static final String SERVICES_LEVEL_TWO = "2";
	public static final String SERVICES_LEVEL_THREE = "3";
	
	
	public static final String INTERFACELOG_FAILCODE_INVALIDPARAMTER="1001";
	public static final String INTERFACELOG_FAILCODE_SESSIONEXPRIED="1002";
	public static final String INTERFACELOG_FAILCODE_SAMEVERSIONPATHWAYEXIST="1003";
	public static final String INTERFACELOG_FAILCODE_PATHWAYNOTEXIST="1004";
	public static final String INTERFACELOG_FAILCODE_PHASENOTEXIST="1005";
	public static final String INTERFACELOG_FAILCODE_UNITITEMNOTEXIST="1006";
	public static final String INTERFACELOG_FAILCODE_ITEMISNULL="1007";
	public static final String INTERFACELOG_FAILCODE_WSITEMORITEMUUIDISNULL="1008";
	public static final String INTERFACELOG_FAILCODE_CENTERCONNECTEDTOFRONTMCHFAILD="1009";
	

}
