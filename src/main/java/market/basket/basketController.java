package market.basket;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import market.MKProductDTO;
//미완성
@WebServlet("/market/basket.do") 
public class basketController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CartDAO dao = new CartDAO();
		

		List<CartDTO> carts = dao.selectList();
		dao.close();
		
		
		
		
		req.setAttribute("carts", carts);

		req.getRequestDispatcher("/market/basket.jsp").forward(req, resp);
	}
}
