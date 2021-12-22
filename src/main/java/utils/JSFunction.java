package utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

public class JSFunction {
	//Javascript 함수를 통해 경고창을 띄우고 원하는 페이지로 이동한다.
	public static void alertLocation(String msg, String url, JspWriter out) {
		
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
	
	//JS를 통해 경고창을 띄우고 뒤로 이동한다.
		public static void listBack(JspWriter out) {
			try {
				String script = ""
						+ "<script>"
						+ "	   history.back();"
						+ "</script>";
				out.println(script);
			}
			catch(Exception e) {}
		}
	
	public static void alertLocation(HttpServletResponse resp, String msg, String url) {
		try {
			//컨텐츠 타입 설정
			resp.setContentType("text/html;charset=UTF-8");
			//PrintWrite객체를 통해 스트립트를 서블릿에 직접 출력한다.
			PrintWriter writer =resp.getWriter();
			String script = ""
					+ "<script>"
					+"		alert('"+ msg +"');"
					+"		location.href='"+ url +"';"
					+"</script>";
					writer.print(script);
			}
			catch (Exception e) {}
	}		
	public static void alertBack(HttpServletResponse resp, String msg) {
		try {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter writer =resp.getWriter();
			String script = ""
					+ "<script>"
					+"		alert('"+ msg +"');"
					+"		history.back();"
					+"</script>";
			writer.print(script);
		}
		catch (Exception e) {}
	}		
}	



