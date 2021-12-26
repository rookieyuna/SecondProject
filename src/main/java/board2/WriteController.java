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

import com.oreilly.servlet.MultipartRequest;

import board.BoardDAO;
import board.BoardDTO;
import fileupload.FileUtil;
import utils.JSFunction;

/*
 	글쓰기 페이지로 진입시에는 단순히 페이지 이동을 doGet()요청을 처리하고
 	내용을 채운 후 작성할때는 Post방식으로 전송하므로 doPost()가 요청을 처리한다.
*/
@WebServlet("/board2/write.do")
public class WriteController extends HttpServlet {
	
	//글쓰기 페이지 진입
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.getRequestDispatcher("/community/board2_write.jsp").forward(req, resp);
	}
	
	//글쓰기 처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		//디렉토리의 물리적 경로 얻어옴
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		
		//application 내장객체를 통해 web.xml에 등록된 초기화 파라미터 얻어옴
		ServletContext application = getServletContext();
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
		
		//파일 업로드 처리
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		//업로드에 실패한 경우..(파일을 첨부하지 않더라도 객체는 생성됨)
		if(mr == null) {
			//경고창을 띄우고 뒤로 이동
			JSFunction.alertBack(resp, "첨부 파일이 제한 용량을 초과합니다.");
			return;
		}

		//업로드에 성공했다면 폼값을 받아 DTO에 저장
		BoardDTO dto = new BoardDTO();
		dto.setId(mr.getParameter("id"));
		dto.setName(mr.getParameter("name"));
		dto.setTitle(mr.getParameter("title"));
		dto.setContent(mr.getParameter("content"));
		dto.setCategory(mr.getParameter("cate"));
		
		String category = mr.getParameter("cate");
		
		//업로드 된 원본파일명을 가져온다
		String fileName = mr.getFilesystemName("ofile");
		//서버에 저장된 파일이 있는 경우 아래 처리를 한다.
		if(fileName != null) {
			//날짜와 시간을 이용해서 파일명을 생성=>기존이름에서 확장자분리
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String ext = fileName.substring(fileName.lastIndexOf("."));
			//서버에 저장될 파일명 생성
			String newFileName = now + ext;
			
			//파일 객체 생성 후 기존의 파일명을 새로운 파일명으로 변경(File.separator - 경로구분기호(/혹은 \))
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);
			
			//DTO객체에 원본파일명과 저장된 파일명을 저장한다
			dto.setOfile(fileName);
			dto.setSfile(newFileName);
		}
		
		//새로운 게시물을 테이블에 저장한다.
		BoardDAO dao = new BoardDAO();
		int result = dao.insertFile(dto);
		//커넥션 풀 자원 반납
		dao.close();
		
		if(result==1) {
			//쓰기에 성공하면 리스트로 이동한다
			
			JSFunction.alertLocation(resp, "글쓰기 완료!!", "../board2/list.do?cate="+category);
			//resp.sendRedirect("../board2/list.do?cate="+category);
			
		}
		else {
			//실패하면 쓰기페이지로 이동한다.
			JSFunction.alertBack(resp, "글쓰기에 실패했습니다");
		}
	}
}
