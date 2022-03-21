package com.work.ty.common;

public class tyUtils {

	
	public static String pageBar(int cPage, int startNo, int endNo, int contentCount, String url) {
		
		StringBuilder sb = new StringBuilder();
		
		sb.append(
					"<ul id=\"pageUl\">\r\n");
						
		sb.append("<li><a href=\""+url+"\">1</a></li> ");
		
		
		
		sb.append(" </ul>"
				+ ""
				);
		String pageBar = sb.toString();
		
		return pageBar; 			
	}
}
