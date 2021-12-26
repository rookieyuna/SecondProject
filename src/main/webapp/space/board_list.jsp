<%@page import="membership.MemberDTO"%>
<%@page import="java.net.URLEncoder"%>
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
	
	String cate = request.getParameter("cate");	
	String cateUrl = request.getRequestURI() + "?cate=" + cate;
	
	BoardDAO dao = new BoardDAO();
	Map<String, Object> param = new HashMap<String, Object>();
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	if(searchWord != null){
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
		param.put("cate", cate);
	}
	
	int totalCount = dao.selectCount(param, cate);
	int pageSize = 10;
	int blockPage = 5;
	int totalPage = (int)Math.ceil((double)totalCount / pageSize);
	int pageNum = 1;
	
	String pageTemp = request.getParameter("pageNum");
	
	if(pageTemp != null && !pageTemp.equals("")) pageNum = Integer.parseInt(pageTemp);
	
	if(!cate.equals("photoB")){
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		param.put("start", start);
		param.put("end", end);	
	}else{
		pageSize = 9;
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		param.put("start", start);
		param.put("end", end);
	}
	
	List<BoardDTO> boardLists = dao.selectList(param, cate);
	dao.close();
%>

 <body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/space/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				
				<%@ include file = "../include/space_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<%
						if(cate.equals("notB")){
					%>
						<img src="../images/space/sub01_title.gif" alt="공지사항" class="con_title" />
						<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;공지사항<p>
					<%		
						}else if(cate.equals("freeB")){
					%>
						<img src="../images/space/sub03_title.gif" alt="자유게시판" class="con_title" />
						<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;자유게시판<p>
					<%		
						}else if(cate.equals("photoB")){
					%>
						<img src="../images/space/sub04_title.gif" alt="사진게시판" class="con_title" />
						<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;사진게시판<p>
					<%
						}else if(cate.equals("infoB")){
					%>
						<img src="../images/space/sub05_title.gif" alt="정보자료실" class="con_title" />
						<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;정보자료실<p>
					<%
						}
					%>
					
				</div>
				
				
				<div class="custom_board">
					<div class="custom_board_wrap">
						<% 
						if(!cate.equals("photoB")){
						 %>
						<table class="boardTable freeboard">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
									<%
									if(cate.equals("infoB")) {
									%>
									<th>첨부파일</th>
									<%
									}
									%>
								</tr>
							</thead>
							
							<tbody>
								<%
								if(boardLists.isEmpty()){
								%>
								<tr>
									<td colspan="6" align="center">등록된 게시물이 없습니다.</td>
								<tr>
								<%
								}else{
									int virtualNum = 0;
									int countNum = 0;
									for(BoardDTO dto : boardLists){
										virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
								%>
								<tr onclick="location.href='board_view.jsp?cate=<%= cate %>&num=<%= dto.getNum() %>'">
									<td><%= virtualNum %></td>
									<td><%= dto.getTitle() %></td>
									<td><%= dto.getName() %></td>
									<td><%= dto.getPostdate() %></td>
									<td><%= dto.getVisitcount() %></td>
									<%
									if(cate.equals("infoB")) {
									%>
									<td><a href="#">
										<%
											if(dto.getOfile() != null){
												%>
												<i class="bi bi-file-check upfile fa-lg" style="color: #0fc73d;"></i>
												<%
											}else{
												%>
												<i class="bi bi-file-check upfile fa-lg" style="color: #dddddd;"></i>
												<%
											}
										%>	
									</a></td>
									<%
									}
									%>
								</tr>
								<%
									}
								}
								%>
							</tbody>
						</table>
						<%
						}else{
						%>
						<div class="photoBoard">
				            <div class="photoBoard_wrap">
				
				              	<ul>
				              	<%
								if(boardLists.isEmpty()){
								%>
									<li>
										<p>등록된 게시물이 없습니다.</p>
									</li>
								<%
								}else{
									int virtualNum = 0;
									int countNum = 0;
									for(BoardDTO dto : boardLists){
										virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
								%>
					                <li class="photoB_list" onclick="location.href='board_view.jsp?cate=<%= cate %>&num=<%= dto.getNum() %>'">
					                    <div class="photoB_posi">
					                    	<div class="photoB_detail over-ray">
					                    		<p class="pic_label pic_title"><%= dto.getTitle() %></p>
					                    		<p class="pic_label pic_name"><%= dto.getName() %></p>
					                    		<p class="pic_label pic_post"><%= dto.getPostdate() %></p>
					                    	</div>
					                    	<div class="photoB_detail pic"><img src="../Uploads/<%= dto.getSfile() %>" alt=""></div>
					                  	</div>
					                </li>
					            <%
									}
									%>
									
									<%
					                	if(totalCount % 4 != 0){
					                		for(int i=0; i<3-(totalCount % 3); i++){
					                		%>
					                		<li class="photoB_list empty"></li>	
					                		<%
					                		}
					                	}else{
					                		
					                	}
					                %>
									
									<%
								}
					            %>
				              	</ul>
				
				            </div>
				          </div>
						<%
						}
						%>
						<div class="boardTool">
							<div class="tool_Paging">
								<ul>
									<%= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, cateUrl, searchField, searchWord) %>
								</ul>
							</div>
							
							<div class="tool_edit">
								<ul>
									<%
									if(session.getAttribute("UserId") != null){
										
										if(cate.equals("freeB")) {
										%>
											<li><button type="button" class="btn btn-primary" onclick="location.href='board_write.jsp?cate=<%= cate %>'">글쓰기</button></li>
										<%
										}else if(cate.equals("infoB") || cate.equals("photoB")){
										%>
											<li><button type="button" class="btn btn-primary" onclick="location.href='board_fileWrite.jsp?cate=<%= cate %>'">글쓰기</button></li>
										<% 	
										}
									}else{
										
									}
									%>
								</ul>
							</div>

							<div class="tool_Search">
								<form method="get">  
									<input type="hidden" name="cate" value="<%= cate %>"/>
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
	</center>
 </body>
</html>
