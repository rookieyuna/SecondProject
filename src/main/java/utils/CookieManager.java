package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//쿠키 생성, 삭제, 읽기를 위한 유틸리티 클래스
public class CookieManager {
	
	//쿠키생성 : 생성시 response 내장객체가 있어야 하므로 매개변수로 받아야함.
	public static void makeCookie(HttpServletResponse response, String cName,
				String cValue, int cTime) {
		Cookie cookie = new Cookie(cName, cValue);	//생성자를 통해 쿠키생성
		cookie.setPath("/");						//경로설정
		cookie.setMaxAge(cTime);					//유효기간
		response.addCookie(cookie);					//응답헤더에 추가하여 전송
	}
	
	//쿠키값 읽기 : request 내장객체가 필요하므로 매개변수로 받아야 함.
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue ="";
		//웹브라우저에 생성된 모든 쿠키를 얻어옴
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {//쿠키의 갯수만큼 반복
				String cookieName = c.getName();//쿠키명을 얻어옴
				if(cookieName.equals(cName)) {//일치하는 쿠키명에서
					cookieValue = c.getValue();//쿠키값 얻어옴
				}
			}
		}
		return cookieValue;//쿠키값 반환 (쿠키 없으면 그냥 빈값이겠죠!)
	}

	//쿠키삭제
	public static void deleteCookie(HttpServletResponse response, String cName) {
		/*
		쿠키는 삭제를 위한 메서드가 별도로 없고, 빈값과 유효기간이 0으로 설정되면
		삭제된다. 따라서 앞에서 생성한 makeCookie메서드를 재활용한다.
		 */
		makeCookie(response, cName, "", 0);
	}
}
