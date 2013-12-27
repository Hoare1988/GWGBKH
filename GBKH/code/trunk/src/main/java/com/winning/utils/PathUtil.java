package com.winning.utils;

public class PathUtil
{
    public String getRealPath()
    {
    	String prefix = null;
    	 
    	if (!NewwinningUtil.isNotNull(prefix)) {
    	  // deployment in weblogic through ear file does not deploy
    	  // phisically
    	  // the files,
    	  // so we need to obtain the path through getClass method
    	  java.net.URL url = getClass().getResource("/");
    	  String mSchemaPath = url.getFile();
    	  if (NewwinningUtil.isNotNull(mSchemaPath)) {
    	    String separator = "/";
    	    int lastSlash = mSchemaPath.lastIndexOf(separator);
    	    if (lastSlash == -1) {
    	      separator = "\\";
    	      lastSlash = mSchemaPath.lastIndexOf(separator);
    	    }
    	    prefix = mSchemaPath.substring(0, lastSlash);
    	    prefix = prefix.substring(0, prefix.lastIndexOf(separator));
    	    prefix = prefix.substring(0, prefix.lastIndexOf(separator) + 1);
    	    prefix = prefix.substring(1);
    	    //prefix = prefix.substring(0, prefix.lastIndexOf("MMAP/"));
    	  }
    	}
    	return prefix;
    }
    
    public static void main(String[] args)
    {
    	System.out.println(new PathUtil().getRealPath());
    }
}
