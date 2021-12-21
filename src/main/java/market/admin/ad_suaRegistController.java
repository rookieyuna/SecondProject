package market.admin;

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

import market.MKProductDAO;
import market.MKProductDTO;
import utils.BoardPage;

@WebServlet("/adminpage/ad_suaRegist.do")
public class ad_suaRegistController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		//커넥션풀을 이용한 DB연결
		MKProductDAO dao = new MKProductDAO();

		//파라미터 및 View로 전달할 데이터 저장용 Map컬렉션 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		//검색 파라미터를 request 내장객체를 통해 얻어온다.
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");

		//검색어 관련 파라미터
		if(searchWord != null){
			//검색어를 입력한 경우 Model로 전달하기 위해 저장
			map.put("searchField", searchField); //검색필드명(title, content등)
			map.put("searchWord", searchWord); //검색어
		}

		//게시물의 갯수 카운트
		int totalCount = dao.selectCount(map);


		/***********페이지 처리 start************/
		//web.xml에 접근하기 위해 서블릿에서 application 내장객체를 얻어옴
		ServletContext application = getServletContext();
		//컨텍스트 초기화 파라미터를 얻어온 후 사칙연산을 위해 정수로 변경한다.
		int pageSize = Integer.parseInt(
				application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(
				application.getInitParameter("PAGES_PER_BLOCK"));
		
		/*
		목록에 첫 진입시에는 페이지 관련 파라미터가 없으므로 무조건 1page로 지정한다.
		만약 pageNum이 있다면 파라미터를 받아와서 정수로 변경한 후 페이지수로 지정한다.
		*/
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if(pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp); //정수로 변경한 후 저장

		//게시물의 구간을 계산한다.
		int start = (pageNum -1) * pageSize +1; //구간의 시작
		int end = pageNum * pageSize; //구간의 끝
		map.put("start", start); //Map 컬렉션에 저장 후 DAO로 전달함
		map.put("end", end);
		/***********페이지 처리 end************/


		//출력할 레코드 추출
		List<MKProductDTO> productLists = dao.selectListPage(map);
		//자원 반납
		dao.close();
		
		//페이지 번호를 생성하기 위해 메서드 호출
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize,
				blockPage, pageNum, "../adminpage/ad_suaRegist.do");
		//View로 전달할 데이터를 Map컬렉션에 저장
		map.put("pagingImg", pagingImg); //페이지 번호
		map.put("totalCount", totalCount); //전체 게시물의 갯수
		map.put("pageSize", pageSize); //한페이지에 출력한 게시물의 갯수
		map.put("pageNum", pageNum); //페이지 번호
		
		//View로 전달할 객체들을 request 영역에 저장
		req.setAttribute("productLists", productLists);
		req.setAttribute("map", map);
		//View로 포워드를 걸어준다.
		req.getRequestDispatcher("/adminpage/ad_suaRegist.jsp").forward(req, resp);
	}
}
