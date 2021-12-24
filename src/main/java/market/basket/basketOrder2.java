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

@WebServlet("/market/order2.do")
public class basketOrder2 extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String zlag1 = req.getParameter("zlag1");
		int zlag = Integer.valueOf(zlag1);
		/* System.out.println("zlag" + zlag); */
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("UserId");
		
		for(int i=1 ; i <= zlag ; i++)
		{
			/* System.out.println("i:"+i); */
			String product_no = req.getParameter("product_no_"+i);
			String addr = req.getParameter("addr");
			String credit = req.getParameter("credit");
			String price = req.getParameter("total_price_"+i);
			String count = req.getParameter("total_count_"+i);
			String cart_no = req.getParameter("cart_no_"+i);
			
			int total_price = Integer.valueOf(price);
			int total_count = Integer.valueOf(count);
			
			MKOrdersDTO dto = new MKOrdersDTO();
			
			dto.setProduct_no(product_no);
			dto.setAddr(addr);
			dto.setCredit(credit);
			dto.setTotal_count(total_count);
			dto.setTotal_price(total_price);
			dto.setId(id);
			dto.setOrder_state("상품준비중");
			dto.setCart_no(cart_no);
			
			MKOrdersDAO dao = new MKOrdersDAO();
			CartDAO dao1 = new CartDAO();
			
			int iResult = dao.insertOrder(dto);
			int dResult = dao1.deleteCart(cart_no);
			
			dao.close();
			
			if (iResult == 0) {
				System.out.println("실패"+i);
				// 페이지로 이동
				resp.sendRedirect("../main/main.jsp");
			}
			if (dResult == 0) {
				System.out.println("삭제실패"+i);
				// 페이지로 이동
				resp.sendRedirect("../main/main.jsp");
			}
		}
		req.setAttribute("OrderSuccess", "성공");
		// 페이지로 이동
		req.getRequestDispatcher("../main/main.jsp").forward(req, resp);
		
		
		
		
		
		
	}
}
