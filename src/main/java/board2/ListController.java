package board2;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.BoardDAO;
import board.BoardDTO;
import utils.BoardPage;
import utils.JSFunction;

@WebServlet("/board2/list.do")
public class ListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cate = req.getParameter("cate");
		String cateUrl = req.getRequestURI() + "?cate=" + cate;

		//커넥션풀을 이용한 DB연결
		BoardDAO dao = new BoardDAO();
		//파라미터 및 View로 전달할 데이터 저장용 Map컬렉션 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		//검색어 관련 파라미터
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		if(searchWord != null){
			//검색어를 입력한경우 Model로 전달하기 위해 저장
			map.put("searchField", searchField);//검색필드 value
			map.put("searchWord", searchWord); //검색어 value
		}
		//게시물의 개수
		int totalCount = dao.selectCount(map, cate);
		
		
		/***** 페이지 처리 start ******/
		//web.xml에 접근하기 위해 서블릿에서 application 내장객체를 얻어옴.
		ServletContext application = getServletContext();
		//컨텍스트 초기화 파라미터를 얻어옴.
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		/*
		목록에 첫 진입시에는 무조건 1페이지로 가정한 후 게시물을 얻어옴.
		특정 페이지로 진입한 경우에는 파라미터를 받아서 구간을 계산해서 얻어옴.
		 */
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if (pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);//정수로 변경한 후 저장
		
		
		//게시물의 구간을 계산한다.
		int start = (pageNum -1) * pageSize +1; //구간의 시작
		int end = pageNum * pageSize;	//구간의 끝
		map.put("start", start); //Map컬렉션에 저장후 DAO로 전달
		map.put("end", end); 
		/***** 페이지 처리 end ******/
		
		//현재 페이지에 출력할 게시물을 얻어옴
		List<BoardDTO> boardLists = dao.selectList(map, cate);
		//커넥션풀에 자원반납
		dao.close();
		
		//페이지 번호를 생성하기 위해 메서드 호출
		String pagingImg =BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, cateUrl, searchField, searchWord); 
			//[기존]BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../board2/list.do");
		//[보드1] BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, cateUrl, searchField, searchWord)
		
		//View로 전달할 데이터를 Map컬렉션에 저장
		map.put("pagingImg", pagingImg);//페이지 번호
		map.put("totalCount", totalCount);//전체 게시물의 개수
		map.put("pageSize", pageSize);//한페이지에 출력할 게시물의 개수
		map.put("pageNum", pageNum);//페이지번호

		//View로 전달할 객체들을 request영역에 저장
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		//View로 포워드를 걸어준다
	
		
		//세션정보 얻어오기
		HttpSession session = req.getSession();
		
		//직원계정 로그인시에만 접근 허용
		if(cate.equals("stafB")){
			if(session.getAttribute("UserId") != null) {
				String identity = (String) session.getAttribute("UserIdentity");
				if(identity.equals("1")) { 
					JSFunction.alertBack(resp, "직원만 접근 가능합니다");
				}
				else {
					req.getRequestDispatcher("/community/board2_list.jsp").forward(req, resp);
				}
			}
			else {
				JSFunction.alertBack(resp, "직원만 접근 가능합니다");
			}
		}
		else {
			req.getRequestDispatcher("/community/board2_list.jsp").forward(req, resp);
		}
	}
}
