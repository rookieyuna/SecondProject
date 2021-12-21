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
	        pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";
	        pagingStr += "&nbsp;";
	        pagingStr += "<a href='" + reqUrl + "?pageNum=" + (pageTemp - 1)
	                     + "'>[이전 블록]</a>";
	    }
	
	    // 단계 5 : 각 페이지 번호 출력
	    int blockCount = 1;
	    while (blockCount <= blockPage && pageTemp <= totalPages) {
	        if (pageTemp == pageNum) {
	            // 현재 페이지는 링크를 걸지 않음
	            pagingStr += "&nbsp;" + pageTemp + "&nbsp;";
	        } else {
	            pagingStr += "&nbsp;<a href='" + reqUrl + "?pageNum=" + pageTemp
	                         + "'>" + pageTemp + "</a>&nbsp;";
	        }
	        pageTemp++;
	        blockCount++;
	    }
	
	    // 단계 6 : '다음 페이지 블록 바로가기' 출력
	    if (pageTemp <= totalPages) {
	        pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp
	                     + "'>[다음 블록]</a>";
	        pagingStr += "&nbsp;";
	        pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages
	                     + "'>[마지막 페이지]</a>";
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
	            pagingStr += "<a href='" + reqUrl + "&pageNum=1'>[첫 페이지]</a>";
	            pagingStr += "&nbsp;";
	            pagingStr += "<a href='" + reqUrl + "&pageNum=" + (pageTemp - 1)
	                         + "'>[이전 블록]</a>";
	        }

	        // 단계 5 : 각 페이지 번호 출력
	        int blockCount = 1;
	        while (blockCount <= blockPage && pageTemp <= totalPages) {
	            if (pageTemp == pageNum) {
	                // 현재 페이지는 링크를 걸지 않음
	                pagingStr += "&nbsp;" + pageTemp + "&nbsp;";
	            } else {
	                pagingStr += "&nbsp;<a href='" + reqUrl; 
	                		if(searchField != null && searchWord != null){
	                			pagingStr += "&searchField=" + searchField + "&searchWord=" + searchWord;
	                		}
	                pagingStr += "&pageNum=" + pageTemp + "'>" + pageTemp + "</a>&nbsp;";
	            }
	            pageTemp++;
	            blockCount++;
	        }

	        // 단계 6 : '다음 페이지 블록 바로가기' 출력
	        if (pageTemp <= totalPages) {
	            pagingStr += "<a href='" + reqUrl + "&pageNum=" + pageTemp
	                         + "'>[다음 블록]</a>";
	            pagingStr += "&nbsp;";
	            pagingStr += "<a href='" + reqUrl + "&pageNum=" + totalPages
	                         + "'>[마지막 페이지]</a>";
	        }

	        return pagingStr;
	 }
	 
	 
}
