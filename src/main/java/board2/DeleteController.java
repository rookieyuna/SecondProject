package board2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.BoardDAO;
import board.BoardDTO;
import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/board2/delete.do")
public class DeleteController extends HttpServlet{
	//패스워드 확인 후 전송했을 때 처리
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//폼값 저장
		String num = req.getParameter("num");
		String cate = req.getParameter("cate");

		BoardDAO dao = new BoardDAO();
		
		//기존의 게시물 가져오기
		BoardDTO dto = dao.selectView(num);
		//게시물 삭제
		int result = dao.deletePost(dto);
		dao.close();
		if (result == 1) { //게시물 삭제가 완료되었다면
			//서버에 저장된 파일명을 가져온 후 파일명을 삭제한다.
			String saveFileName = dto.getSfile();
			FileUtil.deleteFile(req, "/Uploads", saveFileName);
		}
		JSFunction.alertLocation(resp, "삭제되었습니다", "../board2/list.do?cate="+cate);
	}

}

