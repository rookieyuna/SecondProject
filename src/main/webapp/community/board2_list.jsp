<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL을 사용하기 위한 tablib 지시어 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/global_head.jsp" %>
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
										<a href="../board2/view.do?num=${row.num}&cate=${param.cate}">${row.title }</a>
									</td>
									<td>${row.name }</td><!-- 작성자 -->
									<td>${row.postdate }</td><!-- 작성일 -->
									<td>${row.visitcount }</td><!-- 조회수 -->
									<td><!-- 첨부파일 -->
										<c:if test="${not empty row.ofile }">
											<a href="../board2/download.do?ofile=${row.ofile }&sfile=${row.sfile }&num=${row.num }"><i class="bi bi-file-check upfile fa-lg" style="color: #0fc73d;"></i></a>
										</c:if>
									</td>
								</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
							</tbody>
						</table>
						
						<div class="boardTool">
							<div class="tool_Paging">
								<ul>
									${map.pagingImg}
								</ul>
							</div>
							
							<c:if test="${UserId ne null }">
							<div class="tool_edit">
								<ul>
								<li><button type="button" class="btn btn-primary" onclick="location.href='../board2/write.do?cate=${param.cate}';">글쓰기</button></li>
								<ul>
							</div>
							
							</c:if>	
								
							<div class="tool_Search">
								<form method="get">  
									<select name="searchField">
										<option value="title">제목</option>
										<option value="content">내용</option>
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
