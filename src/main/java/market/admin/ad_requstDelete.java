package market.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import market.marketApplicationDAO;

@WebServlet("/adminpage/ad_requstDelete.do")
public class ad_requstDelete extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String[] chk = req.getParameterValues("chk");
    	marketApplicationDAO dao = new marketApplicationDAO();
		
		int delResult = 0;
		
		for(String val : chk) {		
			
			delResult = dao.deleteClean(val);
			
			if(delResult == 0) {
				System.out.println("삭제실패");
			}
		}
		resp.sendRedirect("../adminpage/ad_requst.do");
	}
	
}
