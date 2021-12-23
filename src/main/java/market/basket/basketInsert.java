package market.basket;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("UserId") ==null){
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = resp.getWriter(); 
			writer.println("<script>alert('로그인후이용해주세요'); location.href='../member/login.jsp';</script>");
			writer.close();
		
			return;
		}
		int flag = 0;
		
		String count_num = req.getParameter("count_");
		String product_no = req.getParameter("product_");
		String price = req.getParameter("price1_");
		String product_sfile = req.getParameter("product_sfile");
		String product_name = req.getParameter("product_name");
		String Milage = req.getParameter("milage");
		
		
		 
		int total_price = (Integer.parseInt(price.replaceAll("\\,", "")) * (Integer.parseInt(count_num))); 
		/*
		 * System.out.println("asdf : "+total_price); String total_price1
		 * =String.valueOf(total_price);
		 */
	
		int count = Integer.valueOf(count_num);
		/*
		 * int price1 = Integer.parseInt(price.replaceAll("\\,", "")); int milage =
		 * Integer.valueOf(Milage);
		 */
		//System.out.println(count);
		
		CartDTO dto = new CartDTO();
		dto.setCount_num(count);
		dto.setProduct_no(product_no);  
		dto.setTotal_price(total_price);
		
		dto.setProduct_sfile(product_sfile);
		dto.setProduct_name(product_name);
		dto.setPrice(price); 
		dto.setMilage(Milage);
		
		
		String id = (String)session.getAttribute("UserId");
		dto.setId(id);
		CartDAO dao = new CartDAO();
		
		List<String> productList = dao.selectProduct(dto);
		
		for(String var : productList) { //  cart테이블에서 product_no 전부 가져와서 하나씩 비교한다.
			
			if(var.equals(product_no) == true) { //만약 같은게 있다면
				//수량과 전체금액을 기존꺼에 update한다.
				flag = 1;
				System.out.println("업데이트해야함!");
				
				//기존 수량에 + / 기존 가격에 +
				/*
				 product_no를 를 가진 select를 한줄 뽑아와서 
				 dto.setCount_num();
				 dto.setTotal_price();
				 */
				CartDTO cart1 = dao.selectView(product_no,dto);
				
				/*
				 sub01.jsp와 market_viewjsp에서 이동할떄는 그냥 더하면되는데
				 basket.jsp에서 들어온 거라면 아예 바뀌어야되는데 
				 파라미터를 두개 보내면되는거지뭐
				 */
				
				int count1 = count+ cart1.getCount_num();
				int total1 = total_price + cart1.getTotal_price();
				dto.setCount_num(count1);
				dto.setTotal_price(total1);
				
				int uResult = dao.updateCart(dto);				
				if (uResult != 0) {
					System.out.println("장바구니테이블에 데이터 수정 성공");
					// 장바구니페이지로 이동
					resp.sendRedirect("../market/basket.do");
				}
				else{
					System.out.println("실패");
					
				}
			}
			
		}
		
		if(flag == 0) {
			
			int iResult = dao.insertWrite(dto);
			dao.close();
			
			if (iResult == 1) {
				System.out.println("장바구니테이블에 데이터 넣기 성공");
				// 장바구니페이지로 이동
				resp.sendRedirect("../market/basket.do");
			}
			else
			{
				System.out.println("실패");
			}
		}
	}
	
}
