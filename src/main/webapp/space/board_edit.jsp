<%@page import="utils.JSFunction"%>
<%@page import="board.BoardDTO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<% 
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.selectView(num);
	String UserId = session.getAttribute("UserId").toString();
	String UserPwd = session.getAttribute("UserPwd").toString();
	String cate = request.getParameter("cate");
	
	MemberDAO mDao = new MemberDAO();
	MemberDTO mDto = mDao.allMemberDTO(UserId, UserPwd);
	
	if(!UserId.equals(dto.getId())){
		JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
		return;
	}
	dao.close();
%>
<script type="text/javascript">
function validateForm(form){
	if(form.title.value==""){
		alert("제목을 입력하세요")
		form.title.focus();
		return false;
	}
	if(form.content.value==""){
		alert("내용을 입력하세요")
		form.content.focus();
		return false;
	}
}

$(function(){
	var fileTarget = $('.filebox .upload-hidden'); 
	fileTarget.on('change', function(){ 
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		} else { 
			var filename = $(this).val().split('/').pop().split('\\').pop();
		} 
		$(this).siblings('.upload-name').val(filename); 
	}); 
});

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
					<%
					if(cate.equals("notB") || cate.equals("freeB"))	{
					%>
					<form action="EditProcess.jsp" name="writeFrm" method="post" onsubmit="return validateForm(this);">
					<%
					}else{
					%>
					<form name="fileForm" method="post" enctype="multipart/form-data" action="FileEditProcess.jsp" onsubmit="return validateForm(this);">
					<%
					}
					%>				
					<input type="hidden" name="num" value="<%= dto.getNum() %>">
					<table class="table table-bordered">
					<colgroup>
						<col width="20%"/>
						<col width="*"/>
					</colgroup>
					<tbody>
						<tr>
							<th class="text-center" 
								style="vertical-align:middle;">작성자</th>
							<td>
								<input type="text" class="form-control" style="width:100px;" name="name" value="<%= dto.getName() %>" readonly/>
							</td>
						</tr>
						<tr>
							<th class="text-center" 
								style="vertical-align:middle;">이메일</th>
							<td>
								<input type="text" class="form-control" style="width:400px;" name="email" value="<%= dto.getEmail() %>" readonly/>
							</td>
						</tr>
						<tr>
							<th class="text-center" 
								style="vertical-align:middle;">제목</th>
							<td>
								<input type="text" class="form-control" name="title" value="<%= dto.getTitle() %>"/>
							</td>
						</tr>
						<tr>
							<th class="text-center" 
								style="vertical-align:middle;">내용</th>
							<td>
								<textarea rows="10" class="form-control" name="content"><%= dto.getContent() %></textarea>
							</td>
						</tr>
						<%
						if(cate.equals("infoB") || cate.equals("photoB")){
						%>
						<tr>
							<th class="text-center" 
								style="vertical-align:middle;">첨부파일</th>
							<td>
								<!-- <input type="file" class="form-control" /> -->
								<div class="filebox">
									<input type="file" id="ex_filename" class="form-control upload-hidden" name="attachedFile" />
									<%
									if(dto.getOfile() != null){
									%>
									<input type="text" class="upload-name" value="<%= dto.getOfile() %>" disabled />
									<label for="ex_filename">업로드</label>
									<%
									}else{
									%>
									<label for="files">첨부파일이 없습니다</label>
									<%
									}
									%>
								</div>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
					</table>
					
					<div class="row text-center" style="">
						<!-- 각종 버튼 부분 -->
						<input type="hidden" name="cate" value="<%= cate %>"/>
						<button type="submit" class="btn btn-danger">수정 완료</button>
						<button type="button" class="btn btn-warning" 
							onclick="location.href='board_list.jsp?cate=<%= cate %>';">리스트보기</button>
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