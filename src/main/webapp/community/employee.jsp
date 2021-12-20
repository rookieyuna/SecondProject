<%@page import="utils.BoardPage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="custom_board">
	<div class="custom_board_wrap">
			
		<table class="boardTable freeboard">
			<thead>
				<tr>
					<!-- 테이블 헤더 -->
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<!-- 테이블 헤더 -->
					<td>번호 내용</td>
					<td>제목 내용</td>
					<td>작성자 내용</td>
					<td>작성일 내용</td>
				</tr>
			</tbody>
		</table>
			
		<div class="boardTool">
			<div class="tool_Paging">
				<ul>
					<!-- 테이블 리스트 paging -->
					<%= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
				</ul>
			</div>
			
			<div class="tool_Search">
				<form action="" method="get">  
					<select class="searchField">
						<!-- 검색폼 - 셀렉트박스 -->
						<option value="title">제목</option>
						<option value="id">작성자</option>
					</select>
					<div>
						<!-- 검색폼 - 검색부분 -->
						<input type="text" name="searchWord" placeholder="검색어를 입력하세요" value=""/>								
						<button type="submit" value="">검색</button>
					</div>
				</form>							
			</div>
		</div>			
	</div>
</div>
</body>
</html>