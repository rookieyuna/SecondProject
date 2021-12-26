package board2;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import board.BoardDAO;
import board.BoardDTO;
import fileupload.FileUtil;
import utils.JSFunction;

/*
 	글쓰기 페이지로 진입시에는 단순히 페이지 이동을 doGet()요청을 처리하고
 	내용을 채운 후 작성할때는 Post방식으로 전송하므로 doPost()가 요청을 처리한다.
*/
@WebServlet("/board2/edit.do")
public class EditController extends HttpServlet {
	
	//글수정 페이지 진입 (View컨트롤러와 동일)
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		//커넥션 풀을 통해 DB연결
		BoardDAO dao = new BoardDAO();
		
		//일련번호 파라미터 받기
		String num = req.getParameter("num");
		//String cate = req.getParameter("cate");
		
		//게시물 가져오기
		BoardDTO dto = dao.selectView(num);
		dao.close();
		
		//DTO객체를 리퀘스트 영역에 저장
		req.setAttribute("dto", dto);
		
		req.getRequestDispatcher("/community/board2_edit2.jsp").forward(req, resp);
	}
	
	
	//글수정 처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		//디렉토리의 물리적 경로 얻어옴
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		//업로드 제한용량 얻어오기
		ServletContext application = getServletContext();
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
		
		//파일 업로드 처리를 위한 객체생성
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		if(mr == null) {//파일업로드 실패시 경고창을 띄우고 쓰기 페이지로 이동 
			JSFunction.alertBack(resp, "첨부 파일이 제한 용량을 초과합니다.");
			return;
		}
		
		//폼값저장
		String num = mr.getParameter("num");//일련번호
		//새롭게 등록된 파일이 없는경우 Query문에 사용함.
		String prevOfile = mr.getParameter("prevOfile");//기존 DB에 등록된 원본파일명
		String prevSfile = mr.getParameter("prevSfile");//기존 DB에 등록된 저장파일명
		//수정페이지에서 새롭게 입력한 폼값
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		
		String cate = mr.getParameter("cate"); 

		//DTO에 데이터 세팅
		BoardDTO dto = new BoardDTO();
		dto.setNum(num);
		dto.setName(name);
		dto.setTitle(title);
		dto.setContent(content);
		
		//새롭게 저장된 파일이 있는지 확인하기 위해 파일명을 얻어옴
		String fileName = mr.getFilesystemName("ofile");
		if(fileName != null) {//새롭게 등록된 파일이 있으면...
			//서버에 저장될 파일명 생성
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String ext = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = now + ext;
			
			//파일명 변경
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);
			
			//DTO객체에 원본파일명과 저장된 파일명을 저장한다
			dto.setOfile(fileName);
			dto.setSfile(newFileName);
			
			//새로운 파일이 등록되었으므로 기존파일 삭제처리
			FileUtil.deleteFile(req, "/Uploads", prevSfile);
		}
		else {//새롭게 등록된 파일이 없으면 기존DB에 등록된 파일명을 저장
			dto.setOfile(prevOfile);
			dto.setSfile(prevSfile);
		}
		
		//DB업데이트 처리
		BoardDAO dao = new BoardDAO();
		int result = dao.updateFileEdit(dto);
		//커넥션 풀 자원 반납
		dao.close();
		
		if(result==1) { //수정이 완료되었다면...
			resp.sendRedirect("../board2/list.do?cate="+cate);
		}
		else {//수정에 실패한 경우...
			JSFunction.alertLocation(resp, "수정실패여", "../board2/list.do?cate="+cate);
		}
	}
}
