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

@WebServlet("/market/basket3.do") 
public class basket3Controller extends HttpServlet{
	
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
		
		String[] chk = req.getParameterValues("chk");
		 
		CartDAO dao = new CartDAO();
		List<CartDTO> board = new Vector<CartDTO>();
		
		for(String val : chk) {		
			
			board.add( dao.selectCartView(val));
			
		}
		
        //커넥션풀에 자원 반납
        dao.close();  
        
        MemberDAO Mdao  = new MemberDAO();
        String id = (String)session.getAttribute("UserId");
        MemberDTO Mdto = Mdao.memberInfo(id); 

        //View로 전달할 객체 request영역에 저장
        req.setAttribute("dto", board);
        req.setAttribute("member_info", Mdto);

        //View로 포워드를 걸어준다. 
        req.getRequestDispatcher("/market/basket3.jsp").forward(req, resp);
	}

	
}
