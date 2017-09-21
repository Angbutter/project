package com.util;

import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class HashMapBinder {
	HttpServletRequest req = null;
	public HashMapBinder(HttpServletRequest req){
		this.req = req;
	}
	
	public void bind(Map<String,Object> pMap){
		pMap.clear();
		Enumeration<String> en = req.getParameterNames();
		String name = "";
		for(;en.hasMoreElements();){
			String key = en.nextElement();
			pMap.put(key,  req.getParameter(key));
		}
	}
}
