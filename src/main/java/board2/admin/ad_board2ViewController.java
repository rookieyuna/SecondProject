package board2.admin;

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

import board.BoardDAO;
import board.BoardDTO;
import market.MKProductDAO;
import market.MKProductDTO;
import utils.BoardPage;

@WebServlet("/adminpage/ad_board2View.do")
public class ad_board2ViewController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String cate = req.getParameter("cate");	
        String num = req.getParameter("num");
        
		BoardDAO dao = new BoardDAO();

		dao.updateVisitCount(num);
		BoardDTO dto = dao.selectView(num);
        //커넥션풀에 자원 반납
        dao.close();  

        //줄바꿈 처리
        dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));
      
        //View로 전달할 객체 request영역에 저장
        req.setAttribute("dto", dto);
        //View로 포워드를 걸어준다. 
        req.getRequestDispatcher("/adminpage/ad_board2View.jsp").forward(req, resp);
        
        
	}
}
