package utils;

public class BoardPage {
	/*
	totalCount : 전체 게시물의 갯수
	pageSize : 한 페이지에 출력할 게시물의 갯수
	blockPage : 한 블럭당 출력할 페이지번호의 갯수
	pageNum : 현재 진입한 목록의 페이지 번호
	reqUrl : 현재 목록을 실행한 JSP 파일의 경로 혹은 요청명
*/
	public static String pagingStr(int totalCount, int pageSize, int blockPage,
        int pageNum, String reqUrl) {
	    String pagingStr = "";
	
	    // 단계 3 : 전체 페이지 수 계산
	    int totalPages = (int) (Math.ceil(((double) totalCount / pageSize)));
	
	    // 단계 4 : '이전 페이지 블록 바로가기' 출력
	    int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
	    if (pageTemp != 1) {
	        pagingStr += "<li><a href='" + reqUrl + "?pageNum=1'>"
	        		+ "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-chevron-double-left\" viewBox=\"0 0 16 16\">\r\n"
	        		+ "  <path fill-rule=\"evenodd\" d=\"M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z\"/>\r\n"
	        		+ "  <path fill-rule=\"evenodd\" d=\"M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z\"/>\r\n"
	        		+ "</svg></a></li>";
	        pagingStr += "<li><a href='" + reqUrl + "?pageNum=" + (pageTemp - 1)
	                     + "'>"
	                     + "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-chevron-left\" viewBox=\"0 0 16 16\">\r\n"
	                     + "  <path fill-rule=\"evenodd\" d=\"M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z\"/>\r\n"
	                     + "</svg></a></li>";
	    }
	
	    // 단계 5 : 각 페이지 번호 출력
	    int blockCount = 1;
	    while (blockCount <= blockPage && pageTemp <= totalPages) {
	        if (pageTemp == pageNum) {
	            // 현재 페이지는 링크를 걸지 않음
	            pagingStr += "<li class='nowPage'>" + pageTemp + "</li>";
	        } else {
	            pagingStr += "<li><a href='" + reqUrl + "?pageNum=" + pageTemp
	                         + "'>" + pageTemp + "</a></li>";
	        }
	        pageTemp++;
	        blockCount++;
	    }
	
	    // 단계 6 : '다음 페이지 블록 바로가기' 출력
	    if (pageTemp <= totalPages) {
	        pagingStr += "<li><a href='" + reqUrl + "?pageNum=" + pageTemp
	                     + "'>"
	                     + "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-chevron-right\" viewBox=\"0 0 16 16\">\r\n"
	                     + "  <path fill-rule=\"evenodd\" d=\"M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z\"/>\r\n"
	                     + "</svg>\r\n"
	                     + "</a></li>";
	        pagingStr += "<li><a href='" + reqUrl + "?pageNum=" + totalPages
	                     + "'>"
	                     + "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-chevron-double-right\" viewBox=\"0 0 16 16\">\r\n"
	                     + "  <path fill-rule=\"evenodd\" d=\"M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z\"/>\r\n"
	                     + "  <path fill-rule=\"evenodd\" d=\"M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z\"/>\r\n"
	                     + "</svg></a></li>";
	    }
	
	    return pagingStr;
	}
	 public static String pagingStr(int totalCount, int pageSize, int blockPage,
	        int pageNum, String reqUrl, String searchField, String searchWord) {
	        String pagingStr = "";

	        // 단계 3 : 전체 페이지 수 계산
	        int totalPages = (int) (Math.ceil(((double) totalCount / pageSize)));

	        // 단계 4 : '이전 페이지 블록 바로가기' 출력
	        int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
	        if (pageTemp != 1) {
	            pagingStr += "<li><a href='" + reqUrl + "&pageNum=1'>"
	            		+ "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-chevron-double-left\" viewBox=\"0 0 16 16\">\r\n"
	            		+ "  <path fill-rule=\"evenodd\" d=\"M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z\"/>\r\n"
	            		+ "  <path fill-rule=\"evenodd\" d=\"M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z\"/>\r\n"
	            		+ "</svg></a></li>";
	            pagingStr += "<li><a href='" + reqUrl + "&pageNum=" + (pageTemp - 1)
	                         + "'>"
	                         + "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-chevron-left\" viewBox=\"0 0 16 16\">\r\n"
	                         + "  <path fill-rule=\"evenodd\" d=\"M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z\"/>\r\n"
	                         + "</svg></a></li>";
	        }

	        // 단계 5 : 각 페이지 번호 출력
	        int blockCount = 1;
	        while (blockCount <= blockPage && pageTemp <= totalPages) {
	            if (pageTemp == pageNum) {
	                // 현재 페이지는 링크를 걸지 않음
	                pagingStr += "<li class='nowPage'>" + pageTemp + "</li>";
	            } else {
	                pagingStr += "<li><a href='" + reqUrl; 
	                		if(searchField != null && searchWord != null){
	                			pagingStr += "&searchField=" + searchField + "&searchWord=" + searchWord;
	                		}
	                pagingStr += "&pageNum=" + pageTemp + "'>" + pageTemp + "</a></li>";
	            }
	            pageTemp++;
	            blockCount++;
	        }

	        // 단계 6 : '다음 페이지 블록 바로가기' 출력
	        if (pageTemp <= totalPages) {
	            pagingStr += "<li><a href='" + reqUrl + "&pageNum=" + pageTemp
	                         + "'>"
	                         + "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-chevron-right\" viewBox=\"0 0 16 16\">\r\n"
	                         + "  <path fill-rule=\"evenodd\" d=\"M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z\"/>\r\n"
	                         + "</svg></a></li>";
	            pagingStr += "<li><a href='" + reqUrl + "&pageNum=" + totalPages
	                         + "'>"
	                         + "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-chevron-double-right\" viewBox=\"0 0 16 16\">\r\n"
	                         + "  <path fill-rule=\"evenodd\" d=\"M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z\"/>\r\n"
	                         + "  <path fill-rule=\"evenodd\" d=\"M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z\"/>\r\n"
	                         + "</svg></a></li>";
	        }

	        return pagingStr;
	 }
	 
	 
}
