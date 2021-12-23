package board2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardDTO;

@WebServlet("/board2/view.do")
public class ViewController extends HttpServlet{
	
	/*
	service()는 get방식과 post방식의 요청을 동시에 처리할 수 있다.
	 */
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//커넥션 풀을 통해 DB연결
		BoardDAO dao = new BoardDAO();
		//일련번호를 파라미터로 받기
		String num = req.getParameter("num");
		String cate = req.getParameter("cate");
		//조회수 증가
		dao.updateVisitCount(num);
		//게시물 조회
		BoardDTO dto = dao.selectView(num);
		//자원반납
		dao.close();
		
		/*
		내용에 대한 줄바꿈 처리를 위해 <br>태그로 변환작업
		 */
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));
		
		//request영역에 DTO객체를 저장한다.
		req.setAttribute("dto", dto);
		//View로 포워드
		req.getRequestDispatcher("/community/board2_view.jsp").forward(req, resp);
	}
}
