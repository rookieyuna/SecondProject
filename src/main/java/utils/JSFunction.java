package utils;

import javax.servlet.jsp.JspWriter;

public class JSFunction {
	//Javascript 함수를 통해 경고창을 띄우고 원하는 페이지로 이동한다.
	public static void alertLocation(String msg, String url, JspWriter out) {
		/*
		 Java 클래스에서는 JSP의 내장객체를 사용할 수 없으므로 반드시
		 매개변수로 전달받은 뒤 사용해야 한다.
		 여기서는 화면에 분자열을 출력하기 위한 out 내장객체를 JspWriter 타입으로
		 받은 후 사용하고 있다.
		 */
		try {
			String script = ""
					+ "<script>"
					+ "	   alert('" + msg + "');"
					+ "	   location.href='" + url + "';"
					+ "</script>";
			out.println(script); //스크립트 문자열을 웹브라우저에 출력한다.
		}
		catch(Exception e) {}
	}
	
	//JS를 통해 경고창을 띄우고 뒤로 이동한다.
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = ""
					+ "<script>"
					+ "	   alert('" + msg + "');"
					+ "	   history.back();"
					+ "</script>";
			out.println(script);
		}
		catch(Exception e) {}
	}
}


