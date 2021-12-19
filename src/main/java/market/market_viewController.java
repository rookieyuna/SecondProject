package market;

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

import utils.BoardPage;

@WebServlet("/market/market_view.do")
public class market_viewController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MKProductDAO dao = new MKProductDAO();
		
		String product_no = req.getParameter("product_no");

        //현재 페이지에 출력할 게시물을 얻어옴.
		MKProductDTO boardList = dao.selectView(product_no);
        //커넥션풀에 자원 반납
        dao.close();  

      
        //View로 전달할 객체 request영역에 저장
        req.setAttribute("boardList", boardList);
        //View로 포워드를 걸어준다. 
        req.getRequestDispatcher("/market/market_view.jsp").forward(req, resp);
	}
}
