package market.basket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/market/basketUpDelete.do")
public class basketUpdateDelete extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String product = req.getParameter("zlag");
		
		/* String product_no = req.getParameter("product_"+product); */
		String count_num = req.getParameter("count_"+product);
		String total = req.getParameter("total_"+product);
		String product_sfile = req.getParameter("sfile_"+product);
		String product_name = req.getParameter("name_"+product);
		String Milage = req.getParameter("milage_"+product);
		String price = req.getParameter("price1_"+product);
		
		int count = Integer.valueOf(count_num);		
		int total_price =  Integer.valueOf(total);
		
		/* System.out.println(count +"  " + total_price+ " "+product); */
		CartDTO dto = new CartDTO();

		dto.setCount_num(count);
		dto.setProduct_no(product);  
		dto.setTotal_price(total_price);
		
		dto.setProduct_sfile(product_sfile);
		dto.setProduct_name(product_name);
		dto.setPrice(price); 
		dto.setMilage(Milage);
		
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("UserId");
		dto.setId(id);
		
		CartDAO dao = new CartDAO();
		
		
		if( count_num.equals("0")) //삭제
		{
			System.out.println("count_num이 영이다");
			
			int delResult = dao.deleteProduct(product);
			
			if(delResult == 0) {
				System.out.println("삭제실패");
			}
			else
			{
				System.out.println("삭제성공");
				resp.sendRedirect("../market/basket.do");
			}
			
		}
		else {// update
			
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
}
