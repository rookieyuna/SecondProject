<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String cate = request.getParameter("cate");	
String cateUrl = request.getRequestURI() + "?cate=" + cate;

BoardDAO dao = new BoardDAO();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <title>마포구립 장애인직업재활센터 관리자 페이지에 오신 것을 환영합니다.</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <!-- 211218 KBS ADD -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
   		
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                <div class="sidebar-brand-icon">
                    <img src="./img/logo.gif" alt="이화여자대학교 운영 마포구립 장애인직업재활센터">
                </div>
                <div class="sidebar-brand-text mx-3">Admin</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->


            <!-- 여어어어엉어어기기기기이이이이이이가가가가가 좌측메뉴(LNB)이다라라랄라라라랄-->
            <%@ include file = "./include/ad_LNB_location.jsp" %>


            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <div>
                        <p class="welcome_text">관리자 여러분을 환영합니다.</p>
                    </div>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">7</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">사용자명</span>
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">프로그램일정 관리</h1>
                    <p class="mb-4">BOARD MANAGEMENT - PROGRAM</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">프로그램일정 정보</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                
                                <!-- 달력 -->
                                
								<%
								//현재 년/월/일을 구하기 위한 인스턴스 생성
								Calendar tDay = Calendar.getInstance();
								
								/*
								파라미터가 있는 경우 : 파라미터에 해당하는 년/월을 표현
								파라미터가 없는 경우 : 무조건 현재 년/월을 표현
								*/
								int y = (request.getParameter("y")==null) ?
								    tDay.get(Calendar.YEAR) :
								    Integer.parseInt(request.getParameter("y"));
								int m = (request.getParameter("m")==null) ?
								    tDay.get(Calendar.MONTH) :
								    Integer.parseInt(request.getParameter("m"));
								int d = tDay.get(Calendar.DATE);
								
								/*
								날자설정을 위한 객체생성 : 현재 년/월 그리고 1일로 설정
								한다. 즉 현재월의 1일로 설정한다.
								*/
								Calendar dSet = Calendar.getInstance();
								
								dSet.set(y, m, 1);//현재 년/월/1 일로 설정함
								//오늘이 어떤 요일인지 구한다.
								int yo = dSet.get(Calendar.DAY_OF_WEEK);
								//현재월의 마지막 날자를 구한다.(7월->31, 9월->30)
								int last_day = dSet.getActualMaximum(Calendar.DATE);
								
								int prevY, prevM, nextY, nextM;
								
								if(m==0) {
									prevY = y-1;
									prevM = 11;
								}
								else {
									prevY = y;
									prevM = m-1;
								}
								
								if(m==11) {
									nextY = y+1;
									nextM = 0;
								}
								else {
									nextY = y;
									nextM = m+1;
								}
								
								Map<String, Object> datap = new HashMap<String, Object>();
								
								m++;
							    String mo = (m<10) ? "0"+m : ""+m;
							    String data = y+"-"+mo;
							    Map<String, BoardDTO> calendar = dao.calList(data);
							    dao.close();
								%>
									<!-- 이전달,다음달로 넘기는 부분 -->
									<div class="text-center" >
										<a href="./ad_program.jsp?cate=proB&y=<%=prevY%>&m=<%=prevM%>">◁</a>
										&nbsp;&nbsp;&nbsp;
										<%=y %>년 <%=m %>월
										&nbsp;&nbsp;&nbsp;
										<a href="./ad_program.jsp?cate=proB&y=<%=nextY %>&m=<%=nextM%>">▷</a>									
									</div>
									<br />
									<table class="table table-borderd" style="width:100%; height: 420px; ">
									    <colgroup>
									   	 <col width="14%" />
									   	 <col width="14%" />
									   	 <col width="14%" />
									   	 <col width="14%" />
									   	 <col width="14%" />
									   	 <col width="14%" />
									   	 <col width="*" />
									    </colgroup>
									    <!-- 상단 요일 표시 -->
									    <tr>
									    <%
									    int yoill = yo;
									    String[] a = { "일", "월", "화", "수", "목", "금", "토" };
									    for (int i = 0; i < 7; i++) {
									    	if(i%7 == 0) {
									    %>
									   	 <%-- <th style="padding:5px 0;"><img src="../images/day0<%=i+1 %>.gif" alt="<%=a[i]%>" /></th> --%>
									   	 <th style="padding:5px 0; color: red;"><%=a[i]%></th>
									    <%
									    }
									    	else if(i%7 == 6) {
									    %>
									     <th style="padding:5px 0; color: #58b0d8;"><%=a[i]%></th>   	 
									    <%
									    	}
									    	else {
									    %>
									     <th style="padding:5px 0; color: black;"><%=a[i]%></th>
									    <%
									    	}
									    }
									    %>	
									    </tr>
									    <!-- 날짜 -->
									    <tr>
									    <%
									    for (int k = 1; k < yo; k++) {
									    %>
									   	 <td></td>
									    <%
									    }
									    %>
									    <%
									    String tColor;
									    for (int j = 1; j <= last_day; j++) {
									    	yoill++; //날짜가 반복될때 증가
									    	if((yo+j-1) % 7 == 0) {
									    		tColor="text-danger";
									    	}
									    	else if((yo+j-1) % 7 == 1) {
									    		tColor="text-primary";
									    	}
									    	else tColor="";
									    	
									    	// 페이지 소스에서 출력 날짜 확인하려고 만든 코드
									    	String jj = (j<10) ? "0"+j : ""+j;
									    	String key = y+"-"+mo+"-"+jj;
									    %>
									   	<!-- 날짜확인 <%=key%>-->
									   	<td style="height: 80px;'">
										   	<div><%=j%></div>
									   		<div>
									   			<% if(calendar.get(key) != null) { %>
									   				<a style="color: #skyblue;" href="./ad_boardView.jsp?y=<%=y %>&m=<%=m-1 %>&num=<%=calendar.get(key).getNum() %>&cate=proB"><%=calendar.get(key).getTitle() %></a>
									   			<% 
									   				}
									   			else {
									   			%>
									   				<div style="visibility: hidden;">center</div>
									   			<% 
									   			}
									   			%>
									   		</div>
									   	</td>
									    <%if ((yo+j-1) % 7 == 0) {%>
									    </tr>
									    <tr>
									    <%
									    	yoill = 0;
									   		}
									    }
									    /* 공백 만들어주는 부분 */
									    for(int e=1; e<(7-yo)-1; e++){
									    %>
									   	 <td></td>
									    <%
									    }
									    %>
									    </tr>
									</table>
									<%
									/*
									Calendar 클래스는 추상 클래스로 생성자를 제공하지 않는다.
									따라서, 객체를 생성하기 위해 new 연산자를 사용할 수 없다.  
									대신 getInstance() 메소드를 사용하여 현재 날짜와 시간의
									객체를 얻어올 수 있다.
									*/
									//Calendar nowDay = Calendar.getInstance();
									
									/* 년/월/일 */
									/* 월 : 0~11까지 반환하므로 +1해줘야 함 */
									/* out.println("년="+ nowDay.get(Calendar.YEAR) +"<br/>");
									out.println("월="+ (nowDay.get(Calendar.MONTH)+1) +"<br/>");
									out.println("일="+ nowDay.get(Calendar.DAY_OF_MONTH) +"<br/>");
									out.println("일="+ nowDay.get(Calendar.DATE) +"<br/>"); */
									
									//1년중 오늘이 몇번째 날인지 반환
									//out.println(nowDay.get(Calendar.DAY_OF_YEAR)+"<br/>");
									
									//오늘이 이번주의 몇번째 날인지 반환
									//일요일1, 월요일2.....
									//out.println(nowDay.get(Calendar.DAY_OF_WEEK)+"<br/>");
									%>
                                
                            </div>
                        </div>
                    </div>
	                    <!-- 버튼 -->
	                    <div class="board-btn-group01">
	                        <ul class="d-flex justify-content-end">
	                            <li><button type="button" class="btn btn-outline-primary" onclick="location.href='ad_pWrite.jsp?cate=<%= cate %>'" >등록</button></li>
	                        </ul>
	                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.jsp">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>


    <!-- BOK table first checkbox - All checked -->
    <script src="js/motion.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
    <!-- (Optional) Latest compiled and minified JavaScript translation files -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>

</body>

</html>