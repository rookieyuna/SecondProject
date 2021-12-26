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
import market.MKOrdersDAO;
import market.MKOrdersDTO;
import market.MKProductDAO;
import market.MKProductDTO;
import utils.JSFunction;

@WebServlet("/adminpage/ad_sOrderEdit.do")
public class ad_sOrderEditController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String order_no = req.getParameter("order_no");
		int order_no1 = Integer.parseInt(order_no);
		MKOrdersDAO dao = new MKOrdersDAO();

        //현재 페이지에 출력할 게시물을 얻어옴.
		MKOrdersDTO dto = dao.orderView(order_no1);
        //커넥션풀에 자원 반납
        dao.close();  

        //View로 전달할 객체 request영역에 저장
        req.setAttribute("dto", dto);
        //View로 포워드를 걸어준다. 
        req.getRequestDispatcher("/adminpage/ad_sOrderEdit.jsp").forward(req, resp);
	}
	
	//수정처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		//수정페이지에서 새롭게 입력한 폼값
		String order_no = req.getParameter("order_no");
		int order_no1 = Integer.parseInt(order_no);		String product_no = req.getParameter("product_no");
		String cart_no = req.getParameter("cart_no");
		String id = req.getParameter("id");
		String addr = req.getParameter("addr");
		String credit = req.getParameter("credit");
		String order_state = req.getParameter("order_state");
		int total_count = Integer.parseInt(req.getParameter("total_count"));
		int total_price = Integer.parseInt(req.getParameter("total_price"));
		
		
		//DTO에 데이터 세팅
		MKOrdersDTO dto = new MKOrdersDTO();
		dto.setOrder_no(order_no1);
		dto.setProduct_no(product_no);
		dto.setCart_no(cart_no);
		dto.setId(id);
		dto.setAddr(addr);
		dto.setCredit(credit);
		dto.setOrder_state(order_state);
		dto.setTotal_count(total_count);
		dto.setTotal_price(total_price);
		
		MKOrdersDAO dao = new MKOrdersDAO();
		int result =dao.updateOrder(dto);
		
		dao.close();
		if(result ==1) {
			//수정이 완료되었다면
			resp.sendRedirect("../adminpage/ad_sOrderView.do?order_no="+order_no);
		}
		else {
			//실패하면 쓰기페이지로 이동한다.
			JSFunction.alertLocation(resp, "상품 수정에 실패하였습니다.",
					"../adminpage/ad_sOrderEdit.do?order_no="+order_no);
		}
	}
}
