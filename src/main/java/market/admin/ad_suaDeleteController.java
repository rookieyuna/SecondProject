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

@WebServlet("/adminpage/ad_suaDelete.do")
public class ad_suaDeleteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String[] chk = req.getParameterValues("chk");
		
    	MKProductDAO dao = new MKProductDAO();
    	MKProductDTO dto = new MKProductDTO();
    	String saveFileName;
    	
    	
		int delResult = 0;
		
		for(String val : chk) {		
			//첨부 파일 먼저 삭제 후
			dto = dao.selectView(val);
			saveFileName = dto.getProduct_sfile();
			FileUtil.deleteFile(req, "/adminpage/Uploads", saveFileName);
			
			//상품 데이터 삭제
			delResult = dao.deleteProduct(val);
			
			if(delResult == 0) {
				System.out.println("삭제실패");
			}
		}
		
		dao.close();
		System.out.println("삭제성공");
		
		resp.sendRedirect("../adminpage/ad_suaRegist.do");
		
	}
}
