package com.min.tools;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

/**
 * 图灵机器人接口接入
 * 
 * @author ming
 * @version v1.0
 * 
 */
public class Robot {

	/**
	 * 
	 * @param info
	 * @return
	 */
	public static String info(String info) {
		StringBuffer sb = new StringBuffer();
		String question = null;
		InputStreamReader is = null;
		BufferedReader br = null;
		try {
			// 请求编码设置
			question = URLEncoder.encode(info, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		// 请求URL对接图灵机器人接口
		String url = "http://www.tuling123.com/openapi/api?key=fcdd20f0df654ddaaed94d259b7038b5&info="
				+ question;
		try {
			// 建立网络连接
			URL url2 = new URL(url);
			// 获取连接对象，打开链接
			URLConnection uc = url2.openConnection();
			// 直接连接
			uc.connect();
			// 请求结果
			is = new InputStreamReader(uc.getInputStream(), "UTF-8");
			br = new BufferedReader(is);
			String str = null;
			while ((str = br.readLine()) != null) {
				sb.append(str);
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return sb.toString();
	}
}
