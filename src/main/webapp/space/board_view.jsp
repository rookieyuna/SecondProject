<%@page import="java.net.URLEncoder"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%
	String cate = request.getParameter("cate");	

    String num = request.getParameter("num");
    BoardDAO dao = new BoardDAO();
    dao.updateVisitCount(num);
    BoardDTO dto = dao.selectView(num);
	
    dao.close();
%>
 <script type="text/javascript">
	 function deletePost(){
		var confirmed = confirm("정말로 삭제하시겠습니까?");
		if(confirmed){
			var form = document.writeFrm;
			form.method = "get"; // 전송방식을 post로 설정
			form.action = "DeleteProcess.jsp"; // 전송할 URL
			form.submit(); // form값 전송
		}
	}
</script>
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
						}else if(cate.equals("proB")){
					%>
						<img src="../images/space/sub02_title.gif" alt="프로그램 일정" class="con_title" />
						<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;프로그램 일정<p>
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
			
				<div>
					<form enctype="multipart/form-data" name="writeFrm">
						<input type="hidden" name="num" value="<%= num %>"/>
						<input type="hidden" name="cate" value="<%= cate %>"/>
						<table class="table table-bordered">
							<colgroup>
								<col width="20%"/>
								<col width="30%"/>
								<col width="20%"/>
								<col width="*"/>
							</colgroup>
							<tbody>
								<tr>
									<th class="text-center" 
										style="vertical-align:middle;">작성자</th>
									<td>
										<%= dto.getName() %>
									</td>
									<th class="text-center" 
										style="vertical-align:middle;">작성일</th>
									<td>
										<%= dto.getPostdate() %>
									</td>
								</tr>
								<tr>
									<th class="text-center" 
										style="vertical-align:middle;">이메일</th>
									<td>
										<%= dto.getEmail() %>
									</td>
									<th class="text-center" 
										style="vertical-align:middle;">조회수</th>
									<td>
										<%= dto.getVisitcount() %>
									</td>
								</tr>
								<tr>
									<th class="text-center" 
										style="vertical-align:middle;">제목</th>
									<td colspan="3">
										<%= dto.getTitle() %>
									</td>
								</tr>
								<tr>
									<th class="text-center" 
										style="vertical-align:middle;">내용</th>
									<td colspan="3">
										<%= dto.getContent().replace("\r\n", "<br/>") %>
										<%
											if(cate.equals("photoB")){
											%>
												<img style="display:block;" src="../Uploads/<%= dto.getSfile() %>" alt="" width=400>
											<%
											}
										%>
									</td>
								</tr>
								<%
								if(cate.equals("infoB")) {
								%>
								<tr>
									<th class="text-center" 
										style="vertical-align:middle;">첨부파일</th>
									<td colspan="3">
										<%
										if(dto.getOfile() != null){
										%>
										<a class="fileOk" href="Download.jsp?oFile=<%= URLEncoder.encode(dto.getOfile(), "UTF-8") %>&sFile=<%= URLEncoder.encode(dto.getSfile(),"UTF-8")%>"><span class="down-icon"></span><%= dto.getOfile() %></a></td>
										<%
										}else{
										%>
										<span>첨부파일이 없습니다.</span>
										<%
										}
										%>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
						
						<div class="row text-center" style="">
						<%
						if(session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(dto.getId())){
			            %>	
							<!-- 각종 버튼 부분 -->
							<button type="button" class="btn btn-primary" onclick="location.href='board_edit.jsp?cate=<%= cate %>&num=<%= dto.getNum() %>'">수정하기</button>
							<button type="button" class="btn btn-success" onclick="deletePost();">삭제하기</button>	
						<%
		            	}
        				%>
							<button type="button" class="btn btn-warning" 
								onclick="location.href='board_list.jsp?cate=<%= cate %>';">리스트보기</button>
						<%
						if(cate.equals("proB")) {
						%>
							<button type="button" class="btn btn-warning" 
								onclick="location.href='calendar.jsp?cate=<%= cate %>';">달력보기</button>
						<%
						}
						%>
						</div>
					</form> 
				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>


	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>