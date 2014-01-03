package org.just.utils;

import java.security.MessageDigest;

import org.apache.log4j.Logger;

public class Md5Util {
	private static Logger logger=Logger.getLogger(Md5Util.class);
	
	/**
	 * MD5 16,32位加密算法
	 * @description:
	 * @param arrIn 需要加密的字符串
	 * @param bit 16 或 32
	 * @return
	 * @throws Exception
	 */
	public static String getHexMD5Str(String arrIn,int bit){
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] arrB = md.digest(arrIn.getBytes());
			StringBuffer sb = new StringBuffer(32);
			for (int i = 0; i < arrB.length; i++) {
				int intTmp = arrB[i];
				while (intTmp < 0) {
					intTmp = intTmp + 256;
				}
				if (intTmp < 16) {
					sb.append('0');
				}
				sb.append(Integer.toString(intTmp, 16));
			}
			if(bit==16){
				return sb.toString().substring(8,24);
			}else{
				return sb.toString();//.toUpperCase();
			}
		} catch (Exception e) {
			logger.error("Md5加密算法失败：");
			e.printStackTrace();
			return "";
		}
	}
	
	public static void main(String[] args) {
		try {
			System.out.println(getHexMD5Str("1234",16));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
