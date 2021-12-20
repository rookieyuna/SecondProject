package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;


@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {
	
	/*
	service()는 get방식과 post방식의 요청을 동시에 처리할 수 있다.
	 */
	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		
		//커넥션풀을 통해 DB연결
		MVCBoardDAO dao = new MVCBoardDAO();
		//일련번호를 파라미터로 받기
		String num = req.getParameter("num");
		//조회수 증가
		dao.updateVisitCount(num);
		//게시물 조회
		MVCBoardDTO dto = dao.selectView(num);
		//자원 반납
		dao.close();
		
		
		/*
		내용에 대해 줄바꿈 처리를 위해 <br>태그로 변환한다.
		 */
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));
		
		//request영역에 DTO객체를 저장한다.
		req.setAttribute("dto", dto);
		//View로 포워드
		req.getRequestDispatcher("/community/View.jsp").forward(req, resp);
	}
}

