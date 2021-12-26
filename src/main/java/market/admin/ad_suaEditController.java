package market.admin;

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

import fileupload.FileUtil;
import market.MKProductDAO;
import market.MKProductDTO;
import utils.JSFunction;

@WebServlet("/adminpage/ad_suaEdit.do")
public class ad_suaEditController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String product_no = req.getParameter("product_no");
		
		MKProductDAO dao = new MKProductDAO();

        //현재 페이지에 출력할 게시물을 얻어옴.
		MKProductDTO dto = dao.selectView(product_no);
        //커넥션풀에 자원 반납
        dao.close();  

        //View로 전달할 객체 request영역에 저장
        req.setAttribute("dto", dto);
        //View로 포워드를 걸어준다. 
        req.getRequestDispatcher("/adminpage/ad_suaEdit.jsp").forward(req, resp);
	}
	
	//수정처리
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
		{
			//물리적 경로 얻어오기
			String saveDirectory = req.getServletContext().getRealPath("/images/market");
			
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
			
			//폼값 저장
			String product_no = mr.getParameter("product_no");//상품번호
			//새롭게 등록된 파일이 없는 경우 Query문에 사용함.
			String prevOfile = mr.getParameter("prevOfile");//기존 DB에 등록된 원본 파일명
			String prevSfile = mr.getParameter("prevSfile");//기존 DB에 등록된 저장된 파일명
			
			//수정페이지에서 새롭게 입력한 폼값
			String product_name = mr.getParameter("product_name");
			String product_info = mr.getParameter("product_info");
			int price = Integer.parseInt(mr.getParameter("price"));
			int milage = Integer.parseInt(mr.getParameter("milage"));
			
			
			//DTO에 데이터 세팅
			MKProductDTO dto = new MKProductDTO();
			dto.setProduct_no(product_no);
			dto.setProduct_name(product_name);
			dto.setProduct_info(product_info);
			dto.setPrice(price);
			dto.setMilage(milage);
			
			
			//새롭게 저장된 파일이 있는지 확인하기 위해 파일명을 얻어옴
			String fileName = mr.getFilesystemName("product_ofile");
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
				dto.setProduct_ofile(fileName);
				dto.setProduct_sfile(newFileName);
				
				//새로운 파일이 등록되었으므로 기존에 등록한 파일은 삭제처리
				FileUtil.deleteFile(req, "/images/market", prevSfile);
			}
			//새롭게 등록한 파일이 없는 경우
			else {
				//기존에 등록한 파일명을 유지한다.
				dto.setProduct_ofile(prevOfile);
				dto.setProduct_sfile(prevSfile);
			}
			//DB업데이트 처리
			MKProductDAO dao = new MKProductDAO();
			int result =dao.updatePost(dto);
			//System.out.println(product_name);
			//여기서는 자원 반납. pool을 쓰고 있으므로
			dao.close();
			if(result ==1) {
				//수정이 완료되었다면
				resp.sendRedirect("../adminpage/ad_suaView.do?product_no="+product_no);
			}
			else {
				//실패하면 쓰기페이지로 이동한다.
				JSFunction.alertLocation(resp, "상품 수정에 실패하였습니다.",
						"../adminpage/ad_suaEdit.do?product_no="+product_no);
			}
		}
}
