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
	if(form.pass.value==""){
		alert("패스워드을 입력하세요")
		form.pass.focus();
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
	
}
</script>

 <body>
	<!--  <center> -->
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
				
				<div>
					<form action="EditProcess.jsp" name="writeFrm" method="post" onsubmit="return validateForm(this);">
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
								<input type="text" class="form-control" style="width:100px;" name="name" value="<%= dto.getName() %>"/>
							</td>
						</tr>
						<tr>
							<th class="text-center" 
								style="vertical-align:middle;">이메일</th>
							<td>
								<input type="text" class="form-control" style="width:400px;" name="email" value="<%= dto.getEmail() %>"/>
							</td>
						</tr>
						<tr>
							<th class="text-center" 
								style="vertical-align:middle;">패스워드</th>
							<td>
								<input type="text" class="form-control" style="width:200px;" name="pass"/>
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
						<tr>
							<th class="text-center" 
								style="vertical-align:middle;">첨부파일</th>
							<td>
								<input type="file" class="form-control" />
							</td>
						</tr>
					</tbody>
					</table>
					
					<div class="row text-center" style="">
						<!-- 각종 버튼 부분 -->
						<input type="hidden" name="cate" value="<%= cate %>"/>
						<button type="submit" class="btn btn-danger">수정 완료</button>
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
	<!--  </center> -->
 </body>
</html>