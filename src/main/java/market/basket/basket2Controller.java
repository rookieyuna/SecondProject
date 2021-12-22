package market.basket;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import market.MKProductDAO;
import market.MKProductDTO;

@WebServlet("/market/basket2.do") 
public class basket2Controller extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MKProductDAO dao = new MKProductDAO();
		
		String quantity = req.getParameter("quantity");
		String product_no = req.getParameter("product_no");

        //현재 페이지에 출력할 게시물을 얻어옴.
		MKProductDTO dto = dao.selectView(product_no);
        //커넥션풀에 자원 반납
        dao.close();  
        
        //View로 전달할 객체 request영역에 저장
        req.setAttribute("quantity", quantity);
        req.setAttribute("dto", dto);
        //View로 포워드를 걸어준다. 
        req.getRequestDispatcher("/market/basket2.jsp").forward(req, resp);
        System.out.println(quantity);
	}
	
	
	//체크박스 선택하여 구매하는 경우 메서드 구현_KJS
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//		MKProductDAO dao = new MKProductDAO();
//		
//		String[] chk = req.getParameterValues("chk");
//		
//		//파라미터 및 View로 전달할 데이터 저장용 List컬렉션 생성
//		List<MKProductDTO> orderlists = new Vector<MKProductDTO>();
//		
//		//출력할 레코드 추출
//		//MKProductDTO orderLists = dao.orderList(map);
//		
//		for(String val : chk) {		
//			MKProductDTO dto = new MKProductDTO();
//			
//			//delResult = dao.orderList(val);
//			dto = dao.orderList(val);
//			orderlists.add(dto);
//		}
//		//자원 반납
//		dao.close();
//		
//		req.setAttribute("orderList", orderlists);
//		//View로 포워드를 걸어준다.
//		req.getRequestDispatcher("/market/basket2.jsp").forward(req, resp);
//		
//	}
	
}
