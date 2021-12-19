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
        String query = "SELECT * FROM ( "
                     + "    SELECT Tb.*, ROWNUM rNum FROM ( "
                     + "        SELECT * FROM product ";

        query += "        ORDER BY product_no DESC "
               + "    ) Tb "
               + " ) "
               + " WHERE rNum BETWEEN ? AND ?";

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
                System.out.println(dto.getPrice());
    		}
    	}
    	catch (Exception e) {
    		System.out.println("게시물 상세보기 중 예외 발생");
    		e.printStackTrace();
    	}
    	return dto;  
    }
    
}
