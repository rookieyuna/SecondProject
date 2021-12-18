<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>

 <body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/volunteer/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				
				<%@ include file = "../include/volunteer_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/volunteer/sub02_title.gif" alt="자원봉사 신청" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;자원봉사/후원&nbsp;>&nbsp;자원봉사 신청<p>
				</div>
				<img src="../images/volunteer/sub02_img01.jpg" />
				<img src="../images/volunteer/sub02_tit01.gif" style="margin:30px 0px 10px 0px;"/>
				<table cellpadding="0" cellspacing="0" border="0" class="con_table" style="width:100%;">
					<colgroup>
						<col width="15%" />
						<col width="35%" />
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th>성명</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" /></td>
							<th>주민등록번호</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" style="width:100px;" /> - <input type="text" name=""  value="" class="join_input" style="width:100px;" /></td>
						</tr>
						<tr>
							<th>성별</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 남&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 여</td>
							<th>생년월일</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" style="width:50px;" /> 년 <input type="text" name=""  value="" class="join_input" style="width:50px;" /> 월 <input type="text" name=""  value="" class="join_input" style="width:50px;" /> 일</td>
						</tr>
						<tr>
							<th>이메일주소</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" style="width:100px;" /> @ <input type="text" name=""  value="" class="join_input" style="width:100px;" /></td>
							<th>휴대폰</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" style="width:50px;" /> - <input type="text" name=""  value="" class="join_input" style="width:50px;" /> - <input type="text" name=""  value="" class="join_input" style="width:50px;" /></td>
						</tr>
						<tr>
							<th rowspan="2">주소</th>
							<td style="text-align:left;" colspan="3"><input type="text" name=""  value="" class="join_input" style="width:300px;" /></td>
						</tr>
					</tbody>
				</table>

				<table cellpadding="0" cellspacing="0" border="0" class="con_table" style="width:100%;">
					<colgroup>
						<col width="15%" />
						<col width="35%" />
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th rowspan="2">학교</th>
							<td rowspan="2" style="text-align:left;"><input type="text" name=""  value="" class="join_input" /></td>
							<th>전공</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" style="width:50px;" />&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 재학&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 휴학&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 졸업</td>
						</tr>
						<tr>
							<th>학번</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" style="width:50px;" /> 학년&nbsp;&nbsp;&nbsp;<input type="text" name=""  value="" class="join_input" style="width:50px;" /> 반&nbsp;&nbsp;&nbsp;<input type="text" name=""  value="" class="join_input" style="width:50px;" /> 번</td>
						</tr>
						<tr>
							<th>직업</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" /></td>
							<th>건강상태</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" /></td>
						</tr>
						<tr>
							<th>특기사항 및 관심영역</th>
							<td colspan="3" style="text-align:left;">※ 자신 있게 할 수 있는 분야 / 현재 활동 중인 분야 / 관심 활동 분야<br />
						<input type="text" name=""  value="" class="join_input"  style="width:300px;" /></td>
						</tr>
						<tr>
							<th rowspan="2">주소</th>
							<td style="text-align:left;" colspan="3"><input type="text" name=""  value="" class="join_input" style="width:300px;" /></td>
						</tr>
					</tbody>
				</table>

				<table cellpadding="0" cellspacing="0" border="0" class="con_table" style="width:100%;">
					<colgroup>
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th>봉사활동 가능시간</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" /></td>
						</tr>
						<tr>
							<th>봉사 시작일</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" /></td>
						</tr>
						<tr>
							<th>참여동기</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 이웃에 봉사하려고&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 지역사회발전을 위해&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 지식 및 기술 활용<br /><input type="radio" name=""  value="" /> 보람있는 여가활동&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 자기발전 및 가치증진&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 종교적인 신념<br /><input type="radio" name=""  value="" /> 새로운 경험과 대인관계를 넓히기 위해&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 기타<input type="text" name=""  value="" class="join_input"  style="width:100px;" /></td>
						</tr>
						<tr>
							<th>참여경로</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 자발적&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 인터넷(홈페이지 등)&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 친구나 다른 자원봉사자의 소개<br /><input type="radio" name=""  value="" /> 기관홍보물&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 신문이나 방송&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 기타<input type="text" name=""  value="" class="join_input"  style="width:100px;" /></td>
						</tr>
						<tr>
							<th>활동대상</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 여성&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 장애인&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 청소년&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 기타<input type="text" name=""  value="" class="join_input"  style="width:100px;" /></td>
						</tr>
					</tbody>
				</table>

				<p style="text-align:center; margin-bottom:40px"><a href=""><img src="../images/btn01.gif" /></a>&nbsp;&nbsp;<a href="#"><img src="../images/btn02.gif" /></a></p>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
