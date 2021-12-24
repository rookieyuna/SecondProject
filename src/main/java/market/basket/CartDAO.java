package market.basket;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import market.MKProductDTO;


public class CartDAO extends DBConnPool{

	public CartDAO() {
		super();
	}
	// 카트 테이블에 데이터 삽입
	public int insertWrite(CartDTO dto) {
		int result = 0; 
		try { 
			String query = "INSERT INTO cart ( "
					+ " cart_no, count_num, total_price, product_no, id"
					+ ", product_name, price, milage, product_sfile) "
					+ " VALUES ( "
					+ " seq_board_num.NEXTVAL,?,?,?,?,?,?,?,?)";
			psmt = con.prepareStatement(query);
			psmt.setInt(1, dto.getCount_num());
			psmt.setInt(2, dto.getTotal_price());
			psmt.setString(3, dto.getProduct_no());
			psmt.setString(4, dto.getId());
			psmt.setString(5, dto.getProduct_name());
			psmt.setString(6, dto.getPrice());
			psmt.setString(7, dto.getMilage());
			psmt.setString(8, dto.getProduct_sfile());
			

			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace(); 
		}
		return result;
	}
	//카트테이블 전체 리스트 불러오기
	public List<CartDTO> selectList(CartDTO dto1) {
		int result = 0; 
		List<CartDTO> board = new Vector<CartDTO>();

		String query = "SELECT count_num, total_price, product_no, "
				+ " product_name, price, milage, product_sfile, cart_no FROM cart"
				+ " WHERE id=?"; 	       


		try {
			psmt = con.prepareStatement(query);   
			psmt.setString(1, dto1.getId());
			rs = psmt.executeQuery();

			while (rs.next()) {
				CartDTO dto = new CartDTO();

				dto.setCount_num(rs.getInt(1));
				dto.setTotal_price(rs.getInt(2)); 
				dto.setProduct_no(rs.getString(3));
				/* dto.setId(rs.getString(4)); */
				dto.setProduct_name(rs.getString(4));
				dto.setPrice(rs.getString(5));
				dto.setMilage(rs.getString(6));
				dto.setProduct_sfile(rs.getString(7));
				dto.setCart_no(rs.getString(8)); 

				board.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return board;
	}
	
	//cart테이블의 product_no만 뽑아오기 (distinct)
	public List<String> selectProduct(CartDTO dto1){
		
		List<String> productList = new ArrayList<>();
		
		String query = "SELECT DISTINCT product_no FROM cart"
		+ " WHERE id=?";
				
		try {
			psmt = con.prepareStatement(query);   
			psmt.setString(1, dto1.getId());
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				productList.add(rs.getString(1));
			}
			
		}
		catch (Exception e) {
			System.out.println("product_no 조회 중 예외 발생");
			e.printStackTrace();
		}
		return productList;
	}
	//특정행 하나 뽑아오기
	 public CartDTO selectView(String idx, CartDTO dto1) {
	    	
		 CartDTO dto = new CartDTO(); //DTO 객체 생성
	        String query = "SELECT count_num, total_price FROM cart WHERE product_no=?"
	        		+ " AND id=?";  
	        try {
	            psmt = con.prepareStatement(query);  
	            psmt.setString(1, idx); 
	            psmt.setString(2,dto1.getId());
	            rs = psmt.executeQuery(); 

	            if (rs.next()) {//결과를 DTO에 저장 
	                dto.setCount_num(rs.getInt(1));
	                dto.setTotal_price(rs.getInt(2));
	               
	            }
	        }
	        catch (Exception e) {
	            System.out.println("게시물 상세보기 중 예외 발생");
	            e.printStackTrace();
	        }
	        return dto;  
	    }
	
	//cart테이블에서 count_num이랑 total_price update 
	// where product_no = 'A'

	public int updateCart(CartDTO dto) {
		int result = 0;
		
		try {
			String query = "UPDATE cart SET"
					+ " count_num=?, total_price=?"
					+ " WHERE product_no=?"
					+ " AND id=?";
			
			psmt = con.prepareStatement(query);
			
			psmt.setInt(1, dto.getCount_num());
            psmt.setInt(2, dto.getTotal_price());
            psmt.setString(3, dto.getProduct_no());
            psmt.setString(4,dto.getId());
            
            result = psmt.executeUpdate();
            System.out.println("result:"+result);
			
		}catch (Exception e) {
            System.out.println("게시물 수정 중 예외 발생");
            e.printStackTrace();
        }
        
        return result;		
	}
	
	
	/// product테이블에서 값 가져오기!
	/*
	 cart테이블에 저장된 product_no를 보고 중복되는 제품들에 
	 대한 정보 뽑아내기
	 */
	
	public List<MKProductDTO> selectPList() {
        List<MKProductDTO> board = new Vector<MKProductDTO>();
        
        String query = "SELECT product.product_sfile, product.product_name, price, milage"
        		+ " FROM product INNER JOIN cart "
        		+ "ON product.product_no = cart.product_no;";

        try {
            psmt = con.prepareStatement(query);
            rs = psmt.executeQuery();

            while (rs.next()) {
            	MKProductDTO dto = new MKProductDTO();
            	                
                dto.setProduct_name(rs.getString(2));
                dto.setPrice(rs.getInt(3));
                dto.setMilage(rs.getInt(4));
                dto.setProduct_sfile(rs.getString(1));
                board.add(dto);
            }
        }
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        return board;
    }
	
	public int deleteProduct(String to) { 
        int result = 0;

        try {
        	//쿼리문 작성
            String query = "DELETE FROM cart WHERE product_no=?"; 
            //prepared객체 생성 및 인파라미터 설정
            psmt = con.prepareStatement(query); 
            psmt.setString(1, to);  
            //쿼리실행
            result = psmt.executeUpdate(); 
        } 
        catch (Exception e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        }

        return result;  
    }
	//cartno 기준 하나 뽑아오기 
	 public CartDTO selectCartView(String idx) {
	    	
		 CartDTO dto = new CartDTO(); //DTO 객체 생성
	        String query = "SELECT count_num, total_price, product_no, "
	        		+ " product_name, price, milage, product_sfile "
	        		+ ", cart_no FROM cart WHERE cart_no=?";  
	        try {
	            psmt = con.prepareStatement(query);  
	            psmt.setString(1, idx); 
	            rs = psmt.executeQuery(); 

	            if (rs.next()) {//결과를 DTO에 저장 
	    			dto.setCount_num(rs.getInt(1));
					dto.setTotal_price(rs.getInt(2)); 
					dto.setProduct_no(rs.getString(3));
					/* dto.setId(rs.getString(4)); */
					dto.setProduct_name(rs.getString(4));
					dto.setPrice(rs.getString(5));
					dto.setMilage(rs.getString(6));
					dto.setProduct_sfile(rs.getString(7));
					dto.setCart_no(rs.getString(8));
	               
	            }
	        }
	        catch (Exception e) {
	            System.out.println("게시물 상세보기 중 예외 발생");
	            e.printStackTrace();
	        }
	        return dto;  
	    }
	 
	 public int deleteCart(String to) { 
	        int result = 0;

	        try {
	            String query = "DELETE FROM cart WHERE cart_no=?"; 
	            
	            psmt = con.prepareStatement(query); 
	            psmt.setString(1, to);  
	            
	            result = psmt.executeUpdate(); 
	        } 
	        catch (Exception e) {
	            System.out.println("장바구니 삭제 중 예외 발생");
	            e.printStackTrace();
	        }

	        return result;  
	    }
	 
	 
	
}
