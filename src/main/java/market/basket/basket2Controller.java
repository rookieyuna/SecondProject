package market.basket;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import market.MKProductDAO;
import market.MKProductDTO;
import membership.MemberDAO;
import membership.MemberDTO;

@WebServlet("/market/basket2.do") 
public class basket2Controller extends HttpServlet{
	
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
		MKProductDAO dao = new MKProductDAO();
		
		String product = req.getParameter("zlag");
		String quantity = req.getParameter("count_"+product);
		String price = req.getParameter("price1_"+product);
		String product_no = req.getParameter("product_"+product);
		int total_price = (Integer.parseInt(price) * (Integer.parseInt(quantity))); 
        //현재 페이지에 출력할 게시물을 얻어옴.
		MKProductDTO dto = dao.selectView(product_no);
        //커넥션풀에 자원 반납
        dao.close();  
        
        MemberDAO Mdao  = new MemberDAO();
        String id = (String)session.getAttribute("UserId");
        MemberDTO Mdto = Mdao.memberInfo(id); 

        
        //View로 전달할 객체 request영역에 저장
        req.setAttribute("quantity", quantity);
        req.setAttribute("dto", dto);
        req.setAttribute("total_price", total_price);
        req.setAttribute("member_info", Mdto);

        //View로 포워드를 걸어준다. 
        req.getRequestDispatcher("/market/basket2.jsp").forward(req, resp);
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
