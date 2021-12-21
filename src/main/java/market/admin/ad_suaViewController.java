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

@WebServlet("/adminpage/ad_suaView.do")
public class ad_suaViewController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		MKProductDAO dao = new MKProductDAO();
		
		String product_no = req.getParameter("product_no");

        //현재 페이지에 출력할 게시물을 얻어옴.
		MKProductDTO dto = dao.selectView(product_no);
        //커넥션풀에 자원 반납
        dao.close();  

        //줄바꿈 처리
        dto.setProduct_info(dto.getProduct_info().replaceAll("\r\n", "<br>"));
      
        //View로 전달할 객체 request영역에 저장
        req.setAttribute("dto", dto);
        //View로 포워드를 걸어준다. 
        req.getRequestDispatcher("/adminpage/ad_suaView.jsp").forward(req, resp);
	}
}
