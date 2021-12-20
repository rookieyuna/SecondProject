<%@page import="javax.swing.plaf.basic.BasicInternalFrameTitlePane.SystemMenuBar"%>
<%@page import="utils.BoardPage"%>
<%@page import="javax.swing.text.View"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%
	// 각 게시판 페이지는 category를 구분하기위해
	// pageContext영역에 category를 저장하고
	// 이를 변수에 담아 dao.selectList에 전달하여 
	// if문을 통해 category를 확인하여 query를 작성하도록 구현.
	pageContext.setAttribute("cate", "freeB");
	String cate = pageContext.getAttribute("cate").toString();

	BoardDAO dao = new BoardDAO();
	Map<String, Object> param = new HashMap<String, Object>();
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	if(searchWord != null){
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	int totalCount = dao.selectCount(param, cate);
	int pageSize = 10;
	int blockPage = 5;
	int totalPage = (int)Math.ceil((double)totalCount / pageSize);
	int pageNum = 1;
	String pageTemp = request.getParameter("pageNum");
	if(pageTemp != null && !pageTemp.equals("")) pageNum = Integer.parseInt(pageTemp);
	
	int start = (pageNum - 1) * pageSize + 1;
	int end = pageNum * pageSize;
	param.put("start", start);
	param.put("end", end);
	
	List<BoardDTO> boardLists = dao.selectList(param, cate);
	dao.close();
%>

 <body>
	<!-- <center> -->
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/space/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				
				<%@ include file = "../include/space_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/space/sub03_title.gif" alt="자유게시판" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;자유게시판<p>
				</div>
				
				
				<div class="custom_board">
					<div class="custom_board_wrap">
						
						<table class="boardTable freeboard">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							
							<tbody>
								<%
								if(boardLists.isEmpty()){
								%>
								<tr>
									<td colspan="4" align="center">등록된 게시물이 없습니다.</td>
								<tr>
								<%
								}else{
									int virtualNum = 0;
									int countNum = 0;
									for(BoardDTO dto : boardLists){
										virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
								%>
								<tr onclick="location.href='sub03_view.jsp?num=<%= dto.getNum() %>'">
									<td><%= virtualNum %></td>
									<td><%= dto.getTitle() %></td>
									<td><%= dto.getId() %></td>
									<td><%= dto.getPostdate() %></td>
									<td><%= dto.getVisitcount() %></td>
								</tr>
								<%
									}
								}
								%>
							</tbody>
						</table>
						
						<div class="boardTool">
							<div class="tool_Paging">
								<ul>
									<%= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
								</ul>
							</div>
							
							<div class="tool_edit">
								<ul>
									<li><button type="button" class="btn btn-primary" onclick="location.href='sub03_write.jsp'">글쓰기</button></li>
								</ul>
							</div>
							
							<div class="tool_Search">
								<form action="" method="get">  
									<select name="searchField">
										<option value="title">제목</option>
										<option value="id">작성자</option>
									</select>
									<div>
										<input type="text" name="searchWord" placeholder="검색어를 입력하세요" value=""/>								
										<button type="submit" value="">검색</button>
									</div>
								</form>							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	<!-- </center> -->
 </body>
</html>
