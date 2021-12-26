<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL을 사용하기 위한 tablib 지시어 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/global_head.jsp" %>

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
</script>

 <body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/space/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/community_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					 <c:if test="${param.cate eq 'stafB'}"> <!-- if(cate.equals("stafB")) -->
						<img src="../images/community/sub01_title.gif" alt="직원자료실" class="con_title" />
						<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;커뮤니티&nbsp;>&nbsp;직원자료실<p>
					 </c:if>
					 <c:if test="${param.cate eq 'guardB'}"> <!-- if(cate.equals("guardB")) -->
						<img src="../images/community/sub02_title.gif" alt="보호자 게시판" class="con_title" />
						<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;커뮤니티&nbsp;>&nbsp;보호자 게시판<p>
					</c:if>
				</div>
			<div>

<form method="post" action="../board2/write.do" name="writeFrm"  onsubmit="return validateForm(this);" enctype="multipart/form-data" >
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
			<input type="hidden" name="id" value="${UserId }"/>
			<input type="hidden" name="name" value="${UserName }"/>
			${UserName }
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">이메일</th>
		<td>
			${UserEmail }
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
			<input type="file" name="ofile"/>
		</td>
	</tr>
</tbody>
</table>

<div class="row text-center" style="">
	<!-- 각종 버튼 부분 -->
	<input type="hidden" name="cate" value="${param.cate }"/>
	<button type="submit" class="btn btn-danger">전송하기</button>
	<button type="reset" class="btn">다시작성</button>
	<button type="button" class="btn btn-warning" 
		onclick="location.href='../board2/list.do?cate=${param.cate}';">리스트보기</button>
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