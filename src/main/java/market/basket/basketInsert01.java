package market.basket;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/market/basketIns01.do")
public class basketInsert01 extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int flag = 0;
		
		String product = req.getParameter("zlag");
		
		
		String count_num = req.getParameter("count_"+product);
		String product_no = req.getParameter("product_"+product);
		String price = req.getParameter("price1_"+product);
		String product_sfile = req.getParameter("sfile_"+product);
		
		String product_name = req.getParameter("name_"+product);
		String Milage = req.getParameter("milage_"+product);  
		
		int total_price = (Integer.parseInt(price) * (Integer.parseInt(count_num))); 
		
		int count = Integer.valueOf(count_num);
		
		CartDTO dto = new CartDTO();
		dto.setCount_num(count);
		dto.setProduct_no(product_no);  
		dto.setTotal_price(total_price);
		
		dto.setProduct_sfile(product_sfile);
		dto.setProduct_name(product_name);
		dto.setPrice(price); 
		dto.setMilage(Milage);
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("UserId");
		dto.setId(id);
		CartDAO dao = new CartDAO();
		
		List<String> productList = dao.selectProduct();
		
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
				CartDTO cart1 = dao.selectView(product_no);
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
