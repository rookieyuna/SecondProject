package market.basket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import market.marketApplicationDTO;

@WebServlet("/market/basketIns.do")
public class basketInsert extends HttpServlet{
// sub01.jsp나 market_view.jsp에서 장바구니 버튼을 누르면 
	// 해당하는 product_no를 파라미터로 받아와서 그 데이터를 cart 테이블에 insert
	
	
	/*
	 cart_no:
	 count_num: 파라미터로 받아왔음 물품갯수
	 total_price: 파라미터로 받아왔음 물품개당가격을 / 곱해야댐 갯수랑
	 product_no: 파라미터로 받아왔음 제품번호
	 id:
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("asdf");
		String count_num = req.getParameter("count_num");
		String product_no = req.getParameter("product_no");
		String price = req.getParameter("price");
		
		
		int total_price = (Integer.parseInt(price.replaceAll("\\,", "")) * (Integer.parseInt(count_num))); 
		int count = Integer.parseInt(count_num);
		
		System.out.println("count: "+ count_num);
		System.out.println("가격 : "+total_price);
		
		CartDTO dto = new CartDTO();
		dto.setCount_num(count);
		dto.setProduct_no(product_no);
		dto.setTotal_price(total_price);
		String user = session.getAttribute("UserId");
		dto.setId(price);
		
		
	}
	
}
