# SecondProject
2차 프로젝트 - 웹페이지 구현하기

열린장터 안되시면 톰캣에서 server.xml에 resource user_name = "musthave" 이거 secondpj로 바꿔주면 돌아가요

-- BOK
게시판 CATEGORY에 들어간 값에 따라서 게시글(갯수, 목록) 가져오기 가능합니다.
  기능 : BoardDAO > selectCount,selectList
  CATEGORY : 
    공지사항 : notB
    프로그램 : proB
    자유게시판 : freeB
    사진게시판 : photoB
    정보게시판 : infoB
    직원자료실 : stafB
    보호자자료실 : guardB
※ 임시로 명칭 부여하였습니다.
