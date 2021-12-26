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
			
				<div>
					<form enctype="multipart/form-data" name="writeFrm">
						<input type="hidden" name="num" value="${param.num}"/>
						<input type="hidden" name="cate" value="${param.cate}"/>
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
										${dto.name}
									</td>
									<th class="text-center" 
										style="vertical-align:middle;">작성일</th>
									<td>
										${dto.postdate} 
									</td>
								</tr>
								<tr>
									<th class="text-center" 
										style="vertical-align:middle;">이메일</th>
									<td>
										${dto.email }
									</td>
									<th class="text-center" 
										style="vertical-align:middle;">조회수</th>
									<td>
										${dto.visitcount }
									</td>
								</tr>
								<tr>
									<th class="text-center" 
										style="vertical-align:middle;">제목</th>
									<td colspan="3">
										${dto.title }
									</td>
								</tr>
								<tr>
									<th class="text-center" 
										style="vertical-align:middle;">내용</th>
									<td colspan="3">
										${dto.content }
									</td>
								</tr>
								<tr>
									<th class="text-center" 
										style="vertical-align:middle;">첨부파일</th>
									<td colspan="3">
										<c:if test="${not empty dto.ofile }">
										${dto.ofile }
										<a href="../board2/download.do?ofile=${dto.ofile }&sfile=${dto.sfile}&num=${dto.num}">[다운로드]</a>
										</c:if>
									</td>
								</tr>
								
							</tbody>
						</table>
						<div class="row text-center" style="">
						
						<c:if test="${UserId eq dto.id }">
							<button type="button" class="btn btn-primary" onclick="location.href='../board2/edit.do?num=${dto.num}&cate=${param.cate}';">수정하기</button>
							<button type="button" class="btn btn-success" onclick="location.href='../board2/delete.do?num=${dto.num}&cate=${param.cate}';">삭제하기</button>
							<!-- <button type="button" class="btn btn-success" onclick="deletePost();">삭제하기</button>	 -->
						</c:if>
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