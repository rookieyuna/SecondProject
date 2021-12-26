package board2.admin;

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

@WebServlet("/adminpage/ad_board2Edit.do")
public class ad_board2EditController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String num = req.getParameter("num");
		
		BoardDAO dao = new BoardDAO();

        //현재 페이지에 출력할 게시물을 얻어옴.
		BoardDTO dto = dao.selectView(num);
		
        dao.close();  
        
        //View로 전달할 객체 request영역에 저장
        req.setAttribute("dto", dto);
        //View로 포워드를 걸어준다. 
        req.getRequestDispatcher("/adminpage/ad_board2Edit.jsp").forward(req, resp);
	}
	
	//수정처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		//물리적 경로 얻어오기
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		
		//application 내장객체를 통해 web.xml에 등록된 초기화 파라미터 얻어옴
		ServletContext application = this.getServletContext();
		
		//업로드할 파일의 최대용량 설정(만약 파일이 2개라면 둘을 합친 용량으로 설정)
		int maxPostSize = Integer.parseInt(
				application.getInitParameter("maxPostSize"));

		//파일 업로드 처리
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		//업로드에 실패한 경우( 파일을 첨부하지 않더라도 객체는 생성된다)
		if(mr == null) {
			//경고창을 띄우고 쓰기 페이지로 이동
			JSFunction.alertBack(resp, "첨부 파일이 제한 용량을 초과합니다.");
			return;
		}
		
		//수정페이지에서 전송한 폼값 받기
		String num = mr.getParameter("num");
		String cate = mr.getParameter("cate");
		/* String pass = request.getParameter("pass"); */
		String name = mr.getParameter("name");
		String email = mr.getParameter("email");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		
		//새롭게 등록된 파일이 없는 경우 Query문에 사용함.
		String prevOfile = mr.getParameter("prevOfile");//기존 DB에 등록된 원본 파일명
		String prevSfile = mr.getParameter("prevSfile");//기존 DB에 등록된 저장된 파일명
		
		//DTO에 데이터 세팅
		BoardDTO dto = new BoardDTO();
		dto.setNum(num);
		/* dto.setPass(pass); */
		dto.setName(name);
		dto.setEmail(email);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setCategory(cate);
		
		//새롭게 저장된 파일이 있는지 확인하기 위해 파일명을 얻어옴
		String fileName = mr.getFilesystemName("ofile");
		//새롭게 서버에 저장된 파일이 있는 경우 아래 처리를 한다.
		if(fileName != null) {
			//현재 날짜와  시간 및 밀리세컨즈까지 이용해서 파일명으로 사용할 문자열을 만든다.
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String ext = fileName.substring(fileName.lastIndexOf("."));
			//확장자와 파일명을 합쳐서 저장할 파일명을 만들어준다.
			String newFileName = now + ext;
			
			//기존의 파일명을 새로운 파일명으로 변경한다.  
			//파일객체 생성
			//File.separator = / 또는 \ 임. 윈도우에 맞게 설정해줌
			File oldFile = new File(saveDirectory + File.separator + fileName); //사과.png
			File newFile = new File(saveDirectory + File.separator + newFileName); //20211213_123456.png
			oldFile.renameTo(newFile); //old파일이 new 파일로 이름이 바뀜
			
			//DTO객체에 원본파일명과 저장된파일명을 저장한다.
			dto.setOfile(fileName);
			dto.setSfile(newFileName);
			
			//새로운 파일이 등록되었으므로 기존에 등록한 파일은 삭제처리
			FileUtil.deleteFile(req, "/Uploads", prevSfile);
		}
		//새롭게 등록한 파일이 없는 경우
		else {
			//기존에 등록한 파일명을 유지한다.
			dto.setOfile(prevOfile);
			dto.setSfile(prevSfile);
		}
		
		//DB업데이트 처리
		BoardDAO dao = new BoardDAO();
		//수정처리
		int result =dao.updateEdit(dto);
		//자원해제
		dao.close();
		
		if(result ==1) {
			//수정이 완료되었다면
			resp.sendRedirect("../adminpage/ad_board2View.do?cate=" + cate + "&num=" + num);
		}
		else {
			//실패하면 쓰기페이지로 이동한다.
			JSFunction.alertLocation(resp, "상품 수정에 실패하였습니다.",
					"../adminpage/ad_board2Edit.do?cate=" + cate + "&num=" + num);
		}
	}
}
