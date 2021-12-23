<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<!-- JSTL을 사용하기 위한 tablib 지시어 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				
				<%@ include file = "../include/community_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<%
						if(cate.equals("stafB")){
					%>
						<img src="../images/community/sub01_title.gif" alt="직원자료실" class="con_title" />
						<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;커뮤니티&nbsp;>&nbsp;직원자료실<p>
					<%		
						}else if(cate.equals("guardB")){
					%>
						<img src="../images/community/sub02_title.gif" alt="보호자 게시판" class="con_title" />
						<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;커뮤니티&nbsp;>&nbsp;보호자 게시판<p>
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
									<th>첨부파일</th>
								</tr>
							</thead>
							<tbody>
						 <c:choose>
							<c:when test="${empty boardLists }"><!-- 게시물이 없을 때 -->
								<tr>
									<td colspan="6" align="center">
										등록된 게시물이 없습니다^^*
									</td>
								</tr>
							</c:when>
							<c:otherwise>	<!-- 출력할 게시물이 있을 때 -->
								<c:forEach items="${boardLists }" var="row" varStatus="loop">
								<tr align="center">
									<td>
										<!-- 
										가상번호 계산하기
										=> 게시물 수 - (((페이지번호-1) * 페이지당 게시물수)+ 해당루프index)
											index는 0부터 시작한다
										 -->				
										${map.totalCount - (((map.pageNum-1) * map.pageSize)+loop.index) }
									</td>
									<td align="left"><!-- 제목 -->
										<a href="../mvcboard/view.do?idx=${row.idx }">${row.title }</a>
									</td>
									<td>${row.name }</td><!-- 작성자 -->
									<td>${row.visitcount }</td><!-- 조회수 -->
									<td>${row.postdate }</td><!-- 작성일 -->
									<td><!-- 첨부파일 -->
									<c:if test="${not empty row.ofile }">
										<a href="../mvcboard/download.do?ofile=${row.ofile }&sfile=${row.sfile }&idx=${row.idx }">[Down]</a>
									</c:if>
									</td>
								</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
							
							
							</tbody>
							
							
							
							
							<tbody>
								<%
								if(boardLists.isEmpty()){
								%>
								<tr>
									<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
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
					                		for(int i=1; i<totalCount-(totalCount % 4); i++){
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
								<td>
									${map.pagingImg}
								</td>
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
	<!-- </center> -->
 </body>
</html>
