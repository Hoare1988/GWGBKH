package com.winning.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.Charset;

public class UrlUtil {
	
	/**
	 * 对url进行解码
	 * @description:
	 * @author yuxiangtong
	 * @time: 上午10:39:27 2012-12-28
	 * @param url
	 * @param conding 编码名称,默认utf-8
	 * @return
	 */
	public static String decode(String url,String conding){
		try {
			if(!NewwinningUtil.isNotNull(conding)){
				conding="utf-8";
			}
			String strEncode = getEncoding(url);
			url=URLDecoder.decode(new String(url.getBytes(strEncode),conding),conding);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url;
	}
	
	/**
	 * 获取字符串的编码
	 * @description:
	 * @author yuxiangtong
	 * @time: 下午12:59:41 2013-1-5
	 * @param str
	 * @return
	 */
    public static String getEncoding(String str) { 
    	String[]codeType={"ISO-8859-1","UTF-8","GB2312","GBK"};
        for (int i = 0; i < codeType.length; i++) {
        	try {  
        		if (str.equals(new String(str.getBytes(codeType[i]), codeType[i]))) {  
        			return codeType[i];  
        		}  
        	} catch (Exception e) {  
        		e.printStackTrace();
        	}  
		}
        return "Unknow";  
    }  
	
	public static void main(String[] args) throws UnsupportedEncodingException {
		String url="http://localhost:8080/MMAP/xls/%E6%9C%88%E8%B4%AD%E8%8D%AF%E8%B6%85800%E6%88%966%E6%AC%A168491228094623.xls";
		System.out.println("解码前："+url);
		url=UrlUtil.decode(url, null);
		System.out.println("解码后："+url); //  http://localhost:8080/MMAP/xls/月购药超800或6次68491228094623.xls
		
		System.out.println("**************************");
		String temstr="This is a 中文的 String!";
		System.out.println("检测原字符串编码："+getEncoding(temstr));
		System.out.println("平台默认编码："+Charset.defaultCharset());
		String charsetstr="ISO8859-1"; //需要转换的编码格式
		System.out.println("原字符串："+temstr+"；设定的编码格式："+charsetstr);
		String utf8=new String(temstr.getBytes(),charsetstr);
		System.out.println("编码后字符串："+utf8);
		String decodechartype=getEncoding(utf8);
		System.out.println("检测到编码后的编码类型："+decodechartype);
		System.out.println("解码后1："+new String(utf8.getBytes(decodechartype),Charset.defaultCharset()));
		System.out.println("解码后2："+new String(utf8.getBytes(decodechartype),"gbk"));
		System.out.println("解码后3："+new String(utf8.getBytes(decodechartype),"utf-8"));
		System.out.println("解码后4："+new String(utf8.getBytes(decodechartype),"iso8859-1"));
		System.out.println("解码后5："+new String(utf8.getBytes(decodechartype),getEncoding(utf8)));
		System.out.println("解码后6："+new String(utf8.getBytes(decodechartype),"GB2312"));
		System.out.println(decode("http://我是谁.com","utf-8"));
		System.out.println(decode("http://我是谁.com",getEncoding("http://我是谁.com")));
	}
	
	/**
	 * 编码格式之间互转
	 * @description:
	 * @param strIn 字符串
	 * @param sourceCode 原编码格式
	 * @param targetCode 目标编码格式
	 * @return
	 */
	 public static String code2code(String strIn, String sourceCode,String targetCode) {
		String strOut = null;
		try {
			byte[] b = strIn.getBytes(sourceCode); //根据原编码进行解码
			String str=new String(b,sourceCode); //还原成 原编码 字符串
			byte[] c=str.getBytes(targetCode); //以目标编码进行解码
//			strOut = new String(c, targetCode); //改成 目标编码字符串
			strOut = new String(strIn.getBytes(sourceCode), targetCode); //改成 目标编码字符串
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return strOut;
	}
}
