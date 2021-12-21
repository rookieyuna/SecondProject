package market.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileUtil;
import market.MKProductDAO;
import market.MKProductDTO;
import market.marketApplicationDAO;
import utils.JSFunction;

@WebServlet("/adminpage/ad_suaDelete.do")
public class ad_suaDeleteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String[] chk = req.getParameterValues("chk");
		String product_no = req.getParameter("product_no");
		
    	MKProductDAO dao = new MKProductDAO();
		
		int delResult = 0;
		
		for(String val : chk) {		
			
			delResult = dao.deleteProduct(val);
			
			if(delResult == 0) {
				System.out.println("삭제실패");
			}
		}
		
		
		MKProductDTO dto = dao.selectView(product_no);
		dao.close();
		
		String saveFileName = dto.getProduct_sfile();
		
		FileUtil.deleteFile(req, "/adminpage/Uploads", saveFileName);
		
		resp.sendRedirect("../adminpage/ad_suaDelete.do");
		
	}
	
}
