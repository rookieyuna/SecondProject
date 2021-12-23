package board2.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardDTO;
import fileupload.FileUtil;
import market.MKProductDAO;
import market.MKProductDTO;

@WebServlet("/adminpage/ad_board2Delete.do")
public class ad_board2DeleteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String[] chk = req.getParameterValues("chk");
		String cate = req.getParameter("cate");
		String num = req.getParameter("num");
		
    	BoardDAO dao = new BoardDAO();
    	BoardDTO dto = new BoardDTO();
    	String saveFileName;
    	
		int delResult = 0;
		
		//상세보기 페이지에서 삭제하는 경우
		if(num != null) {
			dto = dao.selectView(num);
			saveFileName = dto.getSfile();
			FileUtil.deleteFile(req, "/Uploads", saveFileName);
			
			//상품 데이터 삭제
			delResult = dao.deletePost(dto);
			
			if(delResult == 0) {
				System.out.println("삭제실패");
			}
		}
		//전체 리스트 목록에서 체크박스를 통해 삭제하는 경우
		else {
			for(String val : chk) {		
				//첨부 파일 먼저 삭제 후
				dto = dao.selectView(val);
				saveFileName = dto.getSfile();
				FileUtil.deleteFile(req, "/Uploads", saveFileName);
				
				//상품 데이터 삭제
				delResult = dao.deletePost(dto);
				
				if(delResult == 0) {
					System.out.println("삭제실패");
				}
			}
		}
		
		
		dao.close();
		System.out.println("삭제성공");
		
		if(cate.equals("stafB")) {
			resp.sendRedirect("../adminpage/ad_staff.do?cate=stafB");
		}
		else {
			resp.sendRedirect("../adminpage/ad_staff.do?cate=guardB");
		}
		
	}
}
