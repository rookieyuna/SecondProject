<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
         <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#a"
                    aria-expanded="true" aria-controls="a">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>회원관리</span>
                </a>
                <div id="a" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">User Management:</h6>
                        <a class="collapse-item" href="ad_member.jsp">사용자 관리</a>
                    </div>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#b"
                    aria-expanded="true" aria-controls="b">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>열린공간</span>
                </a>
                <div id="b" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Board Management:</h6>
                        <a class="collapse-item" href="ad_notice.jsp?cate=notB">공지사항 관리</a>
                        <a class="collapse-item" href="ad_program.jsp?cate=proB">프로그램일정 관리</a>
                        <a class="collapse-item" href="ad_freeboard.jsp?cate=freeB">자유게시판 관리</a>
                        <a class="collapse-item" href="ad_photo.jsp?cate=photoB">사진게시판 관리</a>
                        <a class="collapse-item" href="ad_information.jsp?cate=infoB">정보자료실 관리</a>
                    </div>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#c"
                    aria-expanded="true" aria-controls="c">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>커뮤니티</span>
                </a>
                <div id="c" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Community Management:</h6>
                        <a class="collapse-item" href="../adminpage/ad_staff.do?cate=stafB">직원자료실 관리</a>
                        <a class="collapse-item" href="../adminpage/ad_staff.do?cate=guardB">보호자게시판 관리</a>
                    </div>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#d"
                    aria-expanded="true" aria-controls="d">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>장터관리</span>
                </a>
                <div id="d" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Market Management:</h6>
                        <a class="collapse-item" href="../adminpage/ad_suaRegist.do">상품등록 관리</a>
                        <a class="collapse-item" href="../adminpage/ad_sOrder.do">주문내역 관리</a>
                        <a class="collapse-item" href="../adminpage/ad_requst.do">견적의뢰 관리</a>
                        <a class="collapse-item" href="../adminpage/ad_experience.do">체험학습 관리</a>
                    </div>
                </div>
            </li>
            
                        
            <li class="nav-item">
                <a class="nav-link" href="../main/main.jsp"  data-target="#d" 
                    aria-expanded="true" aria-controls="d">
                    <i class="bi bi-infinity" color="white"></i>
                    <span class="text-white">일하러가기</span>
                </a>
            </li>
