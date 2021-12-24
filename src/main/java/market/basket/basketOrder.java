package market.basket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import market.MKOrdersDAO;
import market.MKOrdersDTO;

@WebServlet("/market/order1.do")
public class basketOrder extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		MKOrdersDAO dao = new MKOrdersDAO();
		
		String product_no = req.getParameter("product_no");
		String addr = req.getParameter("addr");
		String credit = req.getParameter("credit");
		String price = req.getParameter("total_price");
		String count = req.getParameter("total_count");
		
		int total_price = Integer.valueOf(price);
		int total_count = Integer.valueOf(count);
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("UserId");
		
		MKOrdersDTO dto = new MKOrdersDTO();
		
		dto.setProduct_no(product_no);
		dto.setAddr(addr);
		dto.setCredit(credit);
		dto.setTotal_count(total_count);
		dto.setTotal_price(total_price);
		dto.setId(id);
		dto.setOrder_state("상품준비중");
		dto.setCart_no("nocart");
		
		int iResult = dao.insertOrder(dto);
		dao.close();
		
		if (iResult == 1) {
			System.out.println("오더테이블에 데이터 넣기 성공");
			req.setAttribute("OrderSuccess", "성공");
			// 페이지로 이동
			req.getRequestDispatcher("../main/main.jsp").forward(req, resp);
		}
		else
		{
			System.out.println("실패");
		}
	}
}
