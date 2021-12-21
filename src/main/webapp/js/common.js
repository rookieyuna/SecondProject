/*
// 공지사항 글쓰기 버튼 숨김
function currentLS(){
	var cls;
	
	if(location.search.indexOf("&") == -1){
		cls = location.search.substring(location.search.indexOf("=")+1);
	}else{
		cls = location.search.substring(location.search.indexOf("=")+1, location.search.indexOf("&"));
	}
		
	console.log(cls)
	
	if(cls == "notB"){
		var toolEdit = document.getElementsByClassName("tool_edit");
		for(var i=0; i<cls.length; i++){
			toolEdit[i].style.visibility = "hidden";
		}
	}
}
currentLS();
*/