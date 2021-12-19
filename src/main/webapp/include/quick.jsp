<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="quick" style="position: absolute; top: 60px; right:0px;">
<ul>
	<li><a href="../market/sub01.do"><img src="../images/quick01.gif" alt="열린장터" border="0" /></a></li>
	<li><a href="../center/sub05.jsp"><img src="../images/quick02.gif" alt="입소안내" border="0" /></a></li>
	<li><a href="../volunteer/sub01.jsp"><img src="../images/quick03.gif" alt="후원,자원봉사" border="0" /></a></li>
	<li><a href="../center/sub06.jsp"><img src="../images/quick04.gif" alt="오시는 길" border="0" /></a></li>
	<li><a href="http://blog.naver.com/mapowork" target="_blank"><img src="../images/quick05.gif" alt="블로그" border="0" style="margin-bottom:11px;" /></a></li>
	</ul>
	<a href="#top"><img alt="top" src="../images/top_btn.gif" /></a>
</div>
<script type="text/javascript" language="javascript">
function initMoving(target, position, topLimit, btmLimit) {
	if (!target)
	return false;
	
	var obj = target;
	obj.initTop = position;
	obj.topLimit = topLimit;
	obj.bottomLimit = document.documentElement.scrollHeight - btmLimit;
	
	 obj.style.position = "absolute";
	 obj.top = obj.initTop;
	 obj.left = obj.initLeft;
	
	 if (typeof(window.pageYOffset) == "number") {
	 obj.getTop = function() {
	 return window.pageYOffset;
	 }
	 } else if (typeof(document.documentElement.scrollTop) == "number") {
	 obj.getTop = function() {
	 return document.documentElement.scrollTop;
	 }
	 } else {
	 obj.getTop = function() {
	 return 0;
	 }
	 }
	
	 if (self.innerHeight) {
	 obj.getHeight = function() {
	 return self.innerHeight;
	 }
	 } else if(document.documentElement.clientHeight) {
	 obj.getHeight = function() {
	 return document.documentElement.clientHeight;
	 }
	 } else {
	 obj.getHeight = function() {
	 return 500;
	 }
	 }
	
	 obj.move = setInterval(function() {
	 if (obj.initTop > 0) {
	 pos = obj.getTop() + obj.initTop;
	 } else {
	 pos = obj.getTop() + obj.getHeight() + obj.initTop;
	 //pos = obj.getTop() + obj.getHeight() / 2 - 15;
	 }
	
	 if (pos > obj.bottomLimit)
	 pos = obj.bottomLimit;
	 if (pos < obj.topLimit)
	 pos = obj.topLimit;
	
	 interval = obj.top - pos;
	 obj.top = obj.top - interval / 3;
	 obj.style.top = obj.top + "px";
	 }, 30)
	}
	
	initMoving(document.getElementById("quick"), 170,0);
	/* function initMoving(target, position, topLimit, btmLimit) */ 
</script>
