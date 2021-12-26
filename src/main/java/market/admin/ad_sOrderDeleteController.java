package market.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileUtil;
import market.MKOrdersDAO;
import market.MKOrdersDTO;
import market.MKProductDAO;
import market.MKProductDTO;

@WebServlet("/adminpage/ad_sOrderDelete.do")
public class ad_sOrderDeleteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String[] chk = req.getParameterValues("chk");
		String order_no = req.getParameter("order_no");
		

    	MKOrdersDAO dao = new MKOrdersDAO();
    	
		int delResult = 0;
		
		//상세보기 페이지에서 삭제하는 경우
		if(order_no != null) {
			int order_no1 = Integer.parseInt(order_no);
			delResult = dao.deleteOrder(order_no1);
			
			if(delResult == 0) {
				System.out.println("주문 삭제 실패");
			}
		}
		//전체 리스트 목록에서 체크박스를 통해 삭제하는 경우
		else {
			for(String val : chk) {
				int val1 = Integer.parseInt(val);
				System.out.println(val1);
				//주문 데이터 삭제
				delResult = dao.deleteOrder(val1);
				
				if(delResult == 0) {
					System.out.println("주문 삭제 실패");
				}
			}
		}
		
		dao.close();
		System.out.println("주문 삭제 성공");
		
		resp.sendRedirect("../adminpage/ad_sOrder.do");
		
	}
}
