package com.winning.utils;

import java.io.DataInputStream;
import java.io.File;

import javax.xml.ws.Service;

public class WebServiceUtil
{
	public static Service getWebService(String url, String serviceClassName)
	{
		Runtime run = Runtime.getRuntime();
		try
		{
			Process ls_proc = run
					.exec("wsimport -B-XautoNameResolution -d "+new PathUtil().getRealPath()+File.separator+"WEB-INF"+File.separator+"classes"+" -keep -p com.winning.bi.service.webservice.client "
							+ url +" -extension");
			String ls_str;
			DataInputStream ls_in = new DataInputStream(
					ls_proc.getInputStream());
			while ((ls_str = ls_in.readLine()) != null)
			{
				System.out.println(ls_str);
			}
			if (ls_proc.waitFor() != 0)
			{
				if (ls_proc.exitValue() == 1)// p.exitValue()==0表示正常结束，1：非正常结束
					System.err.println("命令执行失败!");
			}

			return (Service)Class.forName(
					"com.winning.bi.service.webservice.client."
							+ serviceClassName).newInstance();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args)
	{
		getWebService("http://192.168.1.111:8080/KnowledgeBase/services/MIWebService?wsdl","KBWebService");
	}
}
