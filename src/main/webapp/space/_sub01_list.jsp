<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>


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
					<img src="../images/space/sub01_title.gif" alt="공지사항" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;공지사항<p>
				</div>
				<div>

<div class="row text-right" style="margin-bottom:20px;
		padding-right:50px;">
<!-- 검색부분 -->
<form class="form-inline">	
	<div class="form-group">
		<select name="keyField" class="form-control">
			<option value="">제목</option>
			<option value="">작성자</option>
			<option value="">내용</option>
		</select>
	</div>
	<div class="input-group">
		<input type="text" name="keyString"  class="form-control"/>
		<div class="input-group-btn">
			<button type="submit" class="btn btn-default">
				<i class="glyphicon glyphicon-search"></i>
			</button>
		</div>
	</div>
</form>	
</div>
<div class="row">
	<!-- 게시판리스트부분 -->
	<table class="table table-bordered table-hover">
	<colgroup>
		<col width="80px"/>
		<col width="*"/>
		<col width="120px"/>
		<col width="120px"/>
		<col width="80px"/>
		<col width="50px"/>
	</colgroup>
	
	<thead>
	<tr class="success">
		<th class="text-center">번호</th>
		<th class="text-left">제목</th>
		<th class="text-center">작성자</th>
		<th class="text-center">작성일</th>
		<th class="text-center">조회수</th>
		<th class="text-center">첨부</th>
	</tr>
	</thead>
	
	<tbody>
	<!-- 리스트반복 -->
	<tr>
		<td class="text-center">번호</td>
		<td class="text-left"><a href="sub01_view.jsp">제목</a></td>
		<td class="text-center">작성자</td>
		<td class="text-center">작성일</td>
		<td class="text-center">조회수</td>
		<td class="text-center">첨부</td>
	</tr>
	</tbody>
	</table>
</div>
<div class="row text-right" style="padding-right:50px;">
	<!-- 각종 버튼 부분 -->
	<!-- <button type="reset" class="btn">Reset</button> -->
		
	<button type="button" class="btn btn-default" 
		onclick="location.href='sub01_write.jsp';">글쓰기</button>
				
	<!-- <button type="button" class="btn btn-primary">수정하기</button>
	<button type="button" class="btn btn-success">삭제하기</button>
	<button type="button" class="btn btn-info">답글쓰기</button>
	<button type="button" class="btn btn-warning">리스트보기</button>
	<button type="submit" class="btn btn-danger">전송하기</button> -->
</div>
<div class="row text-center">
	<!-- 페이지번호 부분 -->
	<ul class="pagination">
		<li><span class="glyphicon glyphicon-fast-backward"></span></li>
		<li><a href="#">1</a></li>		
		<li class="active"><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>		
		<li><a href="#">5</a></li>
		<li><span class="glyphicon glyphicon-fast-forward"></span></li>
	</ul>	
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