<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>


 <body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/center/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<img src="../images/center/left_title.gif" alt="센터소개 Center Introduction" class="left_title" />
				<%@	include file="../include/center_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/center/sub03_title.gif" alt="기관현황" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;센터소개&nbsp;>&nbsp;기관현황<p>
				</div>
				<div class="con_box">
					<p class="con_tit"><img src="../images/center/sub03_tit01.gif" /></p>
					<img src="../images/center/sub03_img01.gif" class="con_img"/>
					<p class="con_tit"><img src="../images/center/sub03_tit02.gif" /></p>
					<img src="../images/center/sub03_img02.gif" class="con_img"/>
					<p class="con_tit"><img src="../images/center/sub03_tit03.gif" /></p>
					<img src="../images/center/sub03_img03.gif" class="con_img"/>
					<p class="con_tit"><img src="../images/center/sub03_tit04.gif" /></p>
					<p class="con_tit"><img src="../images/center/sub03_tit04_01.gif" style="margin-left:10px;"/></p>
					<div style="padding:0px 10px;">
						<table cellpadding="0" cellspacing="0" border="0" class="con_table">
							<colgroup>
								<col width="20%" />
								<col width="20%" />
								<col width="20%" />
								<col width="20%" />
								<col width="*" />
							</colgroup>
							<tr>
								<th rowspan="2">직원현황</th>
								<th rowspan="2">원장</th>
								<th colspan="3">담당</th>
							</tr>
							<tr>
								<th>직업훈련교사</th>
								<th>직업훈련교사</th>
								<th>직업훈련교사</th>
							</tr>
							<tr>
								<td>총 4명</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
							</tr>
						</table>
					</div>
					<p class="con_tit"><img src="../images/center/sub03_tit04_02.gif" style="margin-left:10px;"/></p>
					<div style="padding:0px 10px;">
						<table cellpadding="0" cellspacing="0" border="0" class="con_table">
							<colgroup>
								<col width="20%" />
								<col width="20%" />
								<col width="20%" />
								<col width="20%" />
								<col width="*" />
							</colgroup>
							<tr>
								<th>근로자 현황</th>
								<th>수아밀(제과제빵)</th>
								<th>임가공</th>
								<th>블루크리닝(청소사업)</th>
								<th>비고</th>
							</tr>
							<tr>
								<td>총 21명</td>
								<td>7</td>
								<td>8</td>
								<td>6</td>
								<td>주요장애유형<br /> : 지적장애</td>
							</tr>
						</table>
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
