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

import market.MKOrdersDAO;
import market.MKOrdersDTO;
import market.MKProductDAO;
import market.MKProductDTO;
import utils.BoardPage;

@WebServlet("/adminpage/ad_sOrderView.do")
public class ad_sOrderViewController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		MKOrdersDAO dao = new MKOrdersDAO();
		
		String order_no = req.getParameter("order_no");
		int order_no1 = Integer.parseInt(order_no);

        //현재 페이지에 출력할 게시물을 얻어옴.
		MKOrdersDTO dto = dao.orderView(order_no1);
        //커넥션풀에 자원 반납
        dao.close();  

        //View로 전달할 객체 request영역에 저장
        req.setAttribute("dto", dto);
        //View로 포워드를 걸어준다. 
        req.getRequestDispatcher("/adminpage/ad_sOrderView.jsp").forward(req, resp);
	}
}
