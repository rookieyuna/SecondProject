<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<!-- 네이버 클라우드 CDN -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=59ttdvp7zz"></script>
 <body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/center/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<img src="../images/center/left_title.gif" alt="센터소개 Center Introduction" class="left_title" />
				<%@ include file="../include/center_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/center/sub07_title.gif" alt="오시는길" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;센터소개&nbsp;>&nbsp;오시는길<p>
				</div>
				

				<div class="con_box">
					<p class="con_tit"><img src="../images/center/sub07_tit01.gif" alt="오시는길" /></p>
					<div id="map" style="width:100%;height:400px;"></div>
				
					<script>
					var map = new naver.maps.Map('map', {
				        center: new naver.maps.LatLng(37.47882609411556, 126.87863443156648), //지도의 초기 중심 좌표
				        zoom: 15, //지도의 초기 줌 레벨
				        minZoom: 7, //지도의 최소 줌 레벨
				        zoomControl: true, //줌 컨트롤의 표시 여부
				        zoomControlOptions: { //줌 컨트롤의 옵션
				            position: naver.maps.Position.TOP_RIGHT
				        }
				    });
					
					var marker = new naver.maps.Marker({
					    position: new naver.maps.LatLng(37.47882609411556, 126.87863443156648),
					    map: map
					});
					
					</script>
					
					<!--
					Naver 지도 API 참조 사이트
					https://navermaps.github.io/maps.js.ncp/docs/tutorial-digest.example.html
					-->
					
					
					<!-- <p class="con_tit"><img src="../images/center/sub07_tit02.gif" alt="자가용 오시는길" /></p> -->
					<div class="in_box">
						<p class="dot_tit">주소</p>
						<p style="margin-bottom:15px;">서울 금천구 가산디지털2로 123 월드메르디앙2차 4층 KOSMO</p>
						<p class="dot_tit">대중교통</p>
						<p style="margin-bottom:15px;">가산디지털단지역 5번출구 도보 5분</p>
					</div>
					<!--<p class="con_tit"><img src="../images/center/sub07_tit03.gif" alt="대중교통 이용시" /></p>
					<div class="in_box">
						<p class="dot_tit">버스</p>
						<p style="margin-bottom:15px;">172번, 271번, 470번, 6715번, 7011번, 7013번, 7016번, 7019번, 7715번 월드컵3단지 정문 앞 하차  </p>
						<p class="dot_tit">지하철</p>
						<p style="margin-bottom:15px;">2호선, 6호선 합정역 2번출구에서 271번 환승 후 월드컵파크 3단지 정문 앞 하차<br />6호선 마포구청역 1번출구에서 271번 환승 후 월드컵파크 3단지 정문 앞 하차 </p>
						<p class="dot_tit">마을버스</p>
						<p>마포8번, 마포15번</p>
					</div> -->
				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
