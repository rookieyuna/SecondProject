<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
</head>
<body>
<h2>파일 첨부형 게시판=상세보기(View)</h2>
<table border="1" widthd="90%">
<clogroup>
	<col width="15%"/><col width="35%"/>
	<col width="15%"/><col width="*"/>
</clogroup>
<tr>
<td>번호</td><td>${ dto.idx }</td>
<td>작성자</td><td>${ dto.name }</td>
</tr>
<tr>
<td>작성일</td><td>${ dto.postdate }</td>
<td>조회수</td><td>${ dto.visitcount }</td>
</tr>
<tr>
<td>제목</td>
<td colspan="3">${ dto.title }</td>
</tr>
<tr>
<td>내용</td>
<td colspan="3" height="100">${ dto.content }</td>
</tr>
<tr>
<td>첨부파일</td>
<td>

	<c:if test="${ not empty dto.ofile }">
	${ dto.ofile }
	<a href="../mvcboard/download.do?ofile=${ dto.ofile }&sfile=${ dto.sfile }&idx=${ dto.num }"> [다운로드]</a>
	</c:if>
</td>
<tr>
<td>다운로드수</td>
<td>${ dto.downcount }</td>
</tr>

	<tr>
			<td colspan="4" align="center">
			<button type="button" onclick="location.href='../mvcboard/pass.do?mode=edit&idx=${ param.num }';" >수정하기
			</button>
			<button type="button" onclick="location.href='../mvcboard/pass.do?mode=delete&idx=${ param.num }';" >삭제하기
			</button>
			<button type="button" onclick="location.href='../mvcboard/list.do';">목록 바로가기
			</button>
		</td>
	</tr>
</table>
</body>
</html>