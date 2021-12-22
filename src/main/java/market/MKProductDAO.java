package market;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;


public class MKProductDAO extends DBConnPool{
	
	public MKProductDAO() {
		super();
	}
	
	//게시물의 개수를 반환합니다.
    public int selectCount(Map<String, Object> map) {
    	
        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM product";
       
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        }
        catch (Exception e) {
            System.out.println("게시물 카운트 중 예외 발생");
            e.printStackTrace();
        }

        return totalCount;
    }
    
    // 검색 조건에 맞는 게시물 목록을 반환합니다(페이징 기능 지원).
    public List<MKProductDTO> selectListPage(Map<String,Object> map) {
        List<MKProductDTO> board = new Vector<MKProductDTO>();
        String query = ""
        			 + "SELECT * FROM ( "
                     + "    SELECT Tb.*, ROWNUM rNum FROM ( "
                     + "        SELECT * FROM product ";

        if (map.get("searchWord") != null)
        {
            query += " WHERE " + map.get("searchField")
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }

        query += "        ORDER BY product_no DESC "
               + "    ) Tb "
               + " ) "
               + " WHERE (rNum BETWEEN ? AND ? )";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            rs = psmt.executeQuery();

            while (rs.next()) {
            	MKProductDTO dto = new MKProductDTO();
            	
                dto.setProduct_no(rs.getString(1));
                dto.setProduct_name(rs.getString(2));
                dto.setPrice(rs.getInt(3));
                dto.setMilage(rs.getInt(4));
                dto.setProduct_info(rs.getString(5));
                dto.setProduct_ofile(rs.getString(6));
                dto.setProduct_sfile(rs.getString(7));
                board.add(dto);
            }
        }
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        return board;
    }
    
    public MKProductDTO selectView(String idx) {

    	MKProductDTO dto = new MKProductDTO(); //DTO 객체 생성
    	String query = "SELECT * FROM product WHERE product_no=?";  
    	try {
    		psmt = con.prepareStatement(query);  
    		psmt.setString(1, idx); 
    		rs = psmt.executeQuery(); 

    		if (rs.next()) {//결과를 DTO에 저장 
    			dto.setProduct_no(rs.getString(1));
                dto.setProduct_name(rs.getString(2));
                dto.setPrice(rs.getInt(3));
                dto.setMilage(rs.getInt(4));
                dto.setProduct_info(rs.getString(5));
                dto.setProduct_ofile(rs.getString(6));
                dto.setProduct_sfile(rs.getString(7));
    		}
    	}
    	catch (Exception e) {
    		System.out.println("게시물 상세보기 중 예외 발생");
    		e.printStackTrace();
    	}
    	return dto;  
    }
    

    //상품 등록
    public int insertWrite(MKProductDTO dto) {

        int result = 0;
        try {
            String query = "INSERT INTO product ( "
                         + " product_no, product_name, product_info, price, "
                         + " milage, product_ofile, product_sfile) "
                         + " VALUES ( "
                         + " seq_board_num.NEXTVAL,?,?,?,?,?,?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getProduct_name());
            psmt.setString(2, dto.getProduct_info());
            psmt.setInt(3, dto.getPrice());
            psmt.setInt(4, dto.getMilage());
            psmt.setString(5, dto.getProduct_ofile());
            psmt.setString(6, dto.getProduct_sfile());
            result = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("상품 등록 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }

    
    //상품 삭제
    public int deleteProduct(String to) { 
        int result = 0;

        try {
        	//쿼리문 작성
            String query = "DELETE FROM product WHERE product_no=?"; 
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
 
    
    //상품 수정
  	public int updatePost(MKProductDTO dto) {
  		int result = 0;
  		
  		try{
  			//update를 위한 쿼리문
  			String query = "UPDATE product SET "
  					+ " product_name=?, product_info=?, price=?, "
  					+ " milage=?, product_ofile=?, product_sfile=? "
  					+ " WHERE product_no=? ";
  			
  			//prepared객체 생성
  			psmt = con.prepareStatement(query);
  			//인파라미터 설정
  			psmt.setString(1, dto.getProduct_name());
  			psmt.setString(2, dto.getProduct_info());
  			psmt.setInt(3, dto.getPrice());
  			psmt.setInt(4, dto.getMilage());
  			psmt.setString(5, dto.getProduct_ofile());
  			psmt.setString(6, dto.getProduct_sfile());
  			psmt.setString(7, dto.getProduct_no());
  			
  			//쿼리 실행
  			result = psmt.executeUpdate();
  		} 
  		catch (Exception e){
  			System.out.println("게시물 수정 중 예외 발생");
  			e.printStackTrace();
  		}
  		
  		return result;
  	}
  	
  	
  	//주문하려는 상품 출력
    public MKProductDTO orderList(String product_no) {
        MKProductDTO dto = new MKProductDTO();
        String query = " SELECT * FROM product WHERE product_no= ?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, product_no); 
            rs = psmt.executeQuery();
            
            if (rs.next()) {
                dto.setProduct_no(rs.getString(1));
                dto.setProduct_name(rs.getString(2));
                dto.setPrice(rs.getInt(3));
                dto.setMilage(rs.getInt(4));
                dto.setProduct_info(rs.getString(5));
                dto.setProduct_ofile(rs.getString(6));
                dto.setProduct_sfile(rs.getString(7));
            }
        }
        catch (Exception e) {
            System.out.println("상품 조회 중 예외 발생");
            e.printStackTrace();
        }
        return dto;
    }
    
}
