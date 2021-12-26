<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<% 
	String UserId = session.getAttribute("UserId").toString();
	String UserPwd = session.getAttribute("UserPwd").toString();
	
	String cate = request.getParameter("cate");
	
	MemberDAO mDao = new MemberDAO();
	MemberDTO mDto = mDao.allMemberDTO(UserId, UserPwd);
%>
<script type="text/javascript">
function validateForm(form){
	if(form.email.value==""){
		alert("이메일을 입력하세요")
		form.email.focus();
		return false;
	}
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
	if(form.attachedFile.value ==""){
		alert("첨부파일은 필수 입력입니다.")
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
					<form name="fileForm" method="post" enctype="multipart/form-data" action="UploadProcess.jsp" onsubmit="return validateForm(this);">
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
									<input type="text" class="form-control" style="width:100px;" name="name" value="<%= mDto.getName() %>" readonly/>
								</td>
							</tr>
							<tr>
								<th class="text-center" 
									style="vertical-align:middle;">이메일</th>
								<td>
									<input type="text" class="form-control" style="width:400px;" name="email" value="<%= mDto.getEmail() %>" readonly/>
								</td>
							</tr>
							<tr>
								<th class="text-center" 
									style="vertical-align:middle;">제목</th>
								<td>
									<input type="text" class="form-control" name="title"/>
								</td>
							</tr>
							<tr>
								<th class="text-center" 
									style="vertical-align:middle;">내용</th>
								<td>
									<textarea rows="10" class="form-control" name="content"></textarea>
								</td>
							</tr>
							<tr>
								<th class="text-center" 
									style="vertical-align:middle;">첨부파일</th>
								<td>
									<div class="filebox">
										<input type="text" class="upload-name" value="파일선택" disabled />
										<label for="ex_filename">업로드</label>
										<input type="file" id="ex_filename" class="form-control upload-hidden" name="attachedFile" />
									</div>								
								</td>
							</tr>
						</tbody>
						</table>
					
						<div class="row text-center" style="">
							<!-- 각종 버튼 부분 -->
							<input type="hidden" name="cate" value="<%= cate %>"/>
							<button type="submit" class="btn btn-danger">전송하기</button>
							<button type="reset" class="btn">다시작성</button>
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