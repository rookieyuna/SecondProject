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
					<img src="../images/volunteer/sub01_title.gif" alt="후원신청" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;자원봉사/후원&nbsp;>&nbsp;후원신청<p>
				</div>
				<img src="../images/volunteer/sub01_img01.jpg" />
				<img src="../images/volunteer/sub01_tit01.gif" style="margin:30px 0px 10px 0px;"/>
				<p class="dot_tit">후원가입신청서[개인용]</p>
				<table cellpadding="0" cellspacing="0" border="0" class="con_table" style="width:100%;">
					<colgroup>
						<col width="15%" />
						<col width="35%" />
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th>접수번호</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" /></td>
							<td colspan="2"></td>
						</tr>
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
							<th>직업</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" /></td>
							<th>종교</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 기독교&nbsp;&nbsp;<input type="radio" name=""  value="" /> 불교&nbsp;&nbsp;<input type="radio" name=""  value="" /> 천주교<br /><input type="radio" name=""  value="" /> 무교&nbsp;&nbsp;<input type="radio" name=""  value="" /> 기타 <input type="text" name=""  value="" class="join_input" style="width:50px;" /></td>
						</tr>
						<tr>
							<th>이메일주소</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" style="width:100px;" /> @ <input type="text" name=""  value="" class="join_input" style="width:100px;" /></td>
							<th>휴대폰</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" style="width:50px;" /> - <input type="text" name=""  value="" class="join_input" style="width:50px;" /> - <input type="text" name=""  value="" class="join_input" style="width:50px;" /></td>
						</tr>
						<tr>
							<th rowspan="2">주소</th>
							<td style="text-align:left;" colspan="3">자택 : <input type="text" name=""  value="" class="join_input" style="width:300px;" /></td>
						</tr>
						<tr>
							<td style="text-align:left;" colspan="3">직장 : <input type="text" name=""  value="" class="join_input" style="width:300px;" /></td>
						</tr>
						<tr>
							<th>우편물 수령처</th>
							<td style="text-align:left;" colspan="3"><input type="radio" name=""  value="" /> 직장&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 자택&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 수령거부</td>
						</tr>
					</tbody>
				</table>

				<table cellpadding="0" cellspacing="0" border="0" class="con_table" style="width:100%;">
					<colgroup>
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr><th colspan="2">후 원 세 부 내 용</th></tr>
						<tr>
							<th>후원기간</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 일시후원&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 정기후원(1년, 2년, 3년, 4년, 5년)</td>
						</tr>
						<tr>
							<th>후원종류</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 결연후원&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 기금후원&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 물품후원</td>
						</tr>
						<tr>
							<th>후원방법</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 자동이체&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 직접방문&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 통장입금</td>
						</tr>
						<tr>
							<th>후원금액</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 5,000원&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 10,000원&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 20,000원&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 기타 <input type="text" name=""  value="" class="join_input" style="width:50px;" /></td>
						</tr>
						<tr>
							<th>입 금 일</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 1일&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 10일&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 20일&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 30일&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 기타  <input type="text" name=""  value="" class="join_input" style="width:50px;" /></td>
						</tr>
						<tr>
							<th>후원물품일  경우</th>
							<td style="text-align:left;">품명 : <input type="text" name=""  value="" class="join_input" />&nbsp;&nbsp;&nbsp;수량 : <input type="text" name=""  value="" class="join_input" /></td>
						</tr>
						<tr>
							<th>후원경로</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 구청/동사무소
&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 이웃/친구
&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 직원
&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 홍보물/안내문
&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 홈페이지
&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 기타 <input type="text" name=""  value="" class="join_input" style="width:50px;" />
</td>
						</tr>
						<tr>
							<th>후원동기</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 사회적 환원을 위해
&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 지역사회에 기여하기 위해
&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 어려운 이웃을 돕기 위해<br />
<input type="radio" name=""  value="" /> 보람 있는 일을 하고 싶어서
&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 종교적 신념으로
&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 기타 <input type="text" name=""  value="" class="join_input" style="width:50px;" />
</td>
						</tr>
					</tbody>
				</table>
				<p style="font-weight:bold; text-align:center; margin-bottom:20px">본인은 위와 같이 마포구립장애인직업재활센터의 후원회원으로 가입하고자 본 신청서를 제출합니다.</p>
				<p style="text-align:center; margin-bottom:40px"><a href=""><img src="../images/btn01.gif" /></a>&nbsp;&nbsp;<a href="#"><img src="../images/btn02.gif" /></a></p>

				<p class="dot_tit">후원가입신청서[단체용]</p>
				<table cellpadding="0" cellspacing="0" border="0" class="con_table" style="width:100%;">
					<colgroup>
						<col width="15%" />
						<col width="35%" />
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th>접수번호</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" /></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th>단체명</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" /></td>
							<th>사업자번호</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" /></td>
						</tr>
						<tr>
							<th>대표자명</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" /></td>
							<th>홈페이지</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" /></td>
						</tr>
						<tr>
							<th>연락처</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" style="width:50px;" /> - <input type="text" name=""  value="" class="join_input" style="width:50px;" /> - <input type="text" name=""  value="" class="join_input" style="width:50px;" /></td>
							<th>휴대폰</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" style="width:50px;" /> - <input type="text" name=""  value="" class="join_input" style="width:50px;" /> - <input type="text" name=""  value="" class="join_input" style="width:50px;" /></td>
						</tr>
						<tr>
							<th>주소</th>
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
						<tr><th colspan="2">후 원 세 부 내 용</th></tr>
						<tr>
							<th>후원기간</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 일시후원&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 정기후원(1년, 2년, 3년, 4년, 5년)</td>
						</tr>
						<tr>
							<th>후원종류</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 결연후원&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 기금후원&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 물품후원</td>
						</tr>
						<tr>
							<th>후원방법</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 자동이체&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 직접방문&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 통장입금</td>
						</tr>
						<tr>
							<th>후원금액</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 5,000원&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 10,000원&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 20,000원&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 기타 <input type="text" name=""  value="" class="join_input" style="width:50px;" /></td>
						</tr>
						<tr>
							<th>입 금 일</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 1일&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 10일&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 20일&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 30일&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 기타  <input type="text" name=""  value="" class="join_input" style="width:50px;" /></td>
						</tr>
						<tr>
							<th>후원물품일  경우</th>
							<td style="text-align:left;">품명 : <input type="text" name=""  value="" class="join_input" />&nbsp;&nbsp;&nbsp;수량 : <input type="text" name=""  value="" class="join_input" /></td>
						</tr>
						<tr>
							<th>후원경로</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 구청/동사무소
&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 이웃/친구
&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 직원
&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 홍보물/안내문
&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 홈페이지
&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 기타 <input type="text" name=""  value="" class="join_input" style="width:50px;" />
</td>
						</tr>
						<tr>
							<th>후원동기</th>
							<td style="text-align:left;"><input type="radio" name=""  value="" /> 사회적 환원을 위해
&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 지역사회에 기여하기 위해
&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 어려운 이웃을 돕기 위해<br />
<input type="radio" name=""  value="" /> 보람 있는 일을 하고 싶어서
&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 종교적 신념으로
&nbsp;&nbsp;&nbsp;<input type="radio" name=""  value="" /> 기타 <input type="text" name=""  value="" class="join_input" style="width:50px;" />
</td>
						</tr>
					</tbody>
				</table>
				<p style="font-weight:bold; text-align:center; margin-bottom:20px">본 단체는 위와 같이 마포구립장애인직업재활센터의 후원회원으로 가입하고자 본 신청서를 제출합니다.</p>
				<p style="text-align:center; margin-bottom:20px"><a href=""><img src="../images/btn01.gif" /></a>&nbsp;&nbsp;<a href="#"><img src="../images/btn02.gif" /></a></p>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
