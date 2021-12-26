package market;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;


public class MKOrdersDAO extends DBConnPool{
	
	public MKOrdersDAO() {
		super();
	}
	
	//게시물의 개수를 반환합니다.
    public int selectCount(Map<String, Object> map) {
    	
        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM orders";
       
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        }
        catch (Exception e) {
            System.out.println("주문내역 카운트 중 예외 발생");
            e.printStackTrace();
        }

        return totalCount;
    }
    
    // 검색 조건에 맞는 게시물 목록을 반환합니다(페이징 기능 지원).
    public List<MKOrdersDTO> selectListPage(Map<String,Object> map) {
        List<MKOrdersDTO> orderlists = new Vector<MKOrdersDTO>();
        String query = ""
        			 + "SELECT * FROM ( "
                     + "    SELECT Tb.*, ROWNUM rNum FROM ( "
                     + "        SELECT * FROM orders ";

        if (map.get("searchWord") != null)
        {
            query += " WHERE " + map.get("searchField")
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }

        query += "        ORDER BY order_no DESC "
               + "    ) Tb "
               + " ) "
               + " WHERE (rNum BETWEEN ? AND ? )";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            rs = psmt.executeQuery();

            while (rs.next()) {
            	MKOrdersDTO dto = new MKOrdersDTO();
            	
                dto.setOrder_no(rs.getInt(1));
                dto.setProduct_no(rs.getString(2));
                dto.setCart_no(rs.getString(3));
                dto.setId(rs.getString(4));
                dto.setAddr(rs.getString(5));
                dto.setCredit(rs.getString(6));
                dto.setOrder_state(rs.getString(7));
                dto.setTotal_price(rs.getInt(8));
                dto.setTotal_count(rs.getInt(9));
                
                orderlists.add(dto);
            }
        }
        catch (Exception e) {
            System.out.println("주문 내역 조회 중 예외 발생");
            e.printStackTrace();
        }
        return orderlists;
    }
    
    
    public MKOrdersDTO orderView(int idx) {

    	MKOrdersDTO dto = new MKOrdersDTO(); //DTO 객체 생성
    	String query = "SELECT * FROM orders WHERE order_no=?";  
    	try {
    		psmt = con.prepareStatement(query);  
    		psmt.setInt(1, idx); 
    		rs = psmt.executeQuery(); 

    		if (rs.next()) {//결과를 DTO에 저장 
    			dto.setOrder_no(rs.getInt(1));
                dto.setProduct_no(rs.getString(2));
                dto.setCart_no(rs.getString(3));
                dto.setId(rs.getString(4));
                dto.setAddr(rs.getString(5));
                dto.setCredit(rs.getString(6));
                dto.setOrder_state(rs.getString(7));
                dto.setTotal_price(rs.getInt(8));
                dto.setTotal_count(rs.getInt(9));
    		}
    	}
    	catch (Exception e) {
    		System.out.println("주문내역 상세보기 중 예외 발생");
    		e.printStackTrace();
    	}
    	return dto;  
    }
    

    //주문 등록
    public int insertOrder(MKOrdersDTO dto) {

        int result = 0;
        try {
            String query = "INSERT INTO orders ( "
                         + " order_no, product_no, cart_no, id, "
                         + " addr, credit, order_state, total_price, total_count) "
                         + " VALUES ( "
                         + " seq_board_num.NEXTVAL,?,?,?,?,?,?,?,?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getProduct_no());
            psmt.setString(2, dto.getCart_no());
            psmt.setString(3, dto.getId());
            psmt.setString(4, dto.getAddr());
            psmt.setString(5, dto.getCredit());
            psmt.setString(6, dto.getOrder_state());
            psmt.setInt(7, dto.getTotal_price());
            psmt.setInt(8, dto.getTotal_count());
            result = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("주문 등록 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }

    
    //주문 삭제
    public int deleteOrder(int to) { 
        int result = 0;

        try {
            String query = "DELETE FROM orders WHERE order_no=?"; 
            
            psmt = con.prepareStatement(query); 
            psmt.setInt(1, to);  
             
            result = psmt.executeUpdate(); 
        } 
        catch (Exception e) {
            System.out.println("주문 삭제 중 예외 발생");
            e.printStackTrace();
        }

        return result;  
    }
 
    
    //주문 수정
  	public int updateOrder(MKOrdersDTO dto) {
  		int result = 0;
  		
  		try{
  			String query = "UPDATE orders SET "
  					+ " product_no=?, cart_no=?, id=?, addr=?, "
  					+ " credit=?, order_state=?, total_price=?, total_count=? "
  					+ " WHERE order_no=? ";
  			
  			psmt = con.prepareStatement(query);
  			
  			psmt.setString(1, dto.getProduct_no());
            psmt.setString(2, dto.getCart_no());
            psmt.setString(3, dto.getId());
            psmt.setString(4, dto.getAddr());
            psmt.setString(5, dto.getCredit());
            psmt.setString(6, dto.getOrder_state());
            psmt.setInt(7, dto.getTotal_price());
            psmt.setInt(8, dto.getTotal_count());
            psmt.setInt(9, dto.getOrder_no());
  			
  			result = psmt.executeUpdate();
  		} 
  		catch (Exception e){
  			System.out.println("주문 수정 중 예외 발생");
  			e.printStackTrace();
  		}
  		
  		return result;
  	}
  	
}
