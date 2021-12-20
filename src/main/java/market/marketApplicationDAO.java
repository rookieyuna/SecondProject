package market;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.DBConnPool;



public class marketApplicationDAO extends DBConnPool{

	public marketApplicationDAO() {
		super();
	} 
	//게시물의 개수 카운트
	public int selectCount(Map<String, Object> map) {
    	
        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM marketApplication";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%'";
        }
       
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
	
	
	
	 public List<marketApplicationDTO> selectListPage(Map<String,Object> map) {
	        List<marketApplicationDTO> board = new Vector<marketApplicationDTO>();
	        String query = " "
	                     + "SELECT * FROM ( "
	                     + "    SELECT Tb.*, ROWNUM rNum FROM ( "
	                     + "        SELECT * FROM mvcboard ";

	        if (map.get("searchWord") != null)
	        {
	            query += " WHERE " + map.get("searchField")
	                   + " LIKE '%" + map.get("searchWord") + "%' ";
	        }

	        query += "        ORDER BY idx DESC "
	               + "    ) Tb "
	               + " ) "
	               + " WHERE rNum BETWEEN ? AND ?";

	        try {
	            psmt = con.prepareStatement(query);
	            psmt.setString(1, map.get("start").toString());
	            psmt.setString(2, map.get("end").toString());
	            rs = psmt.executeQuery();

	            while (rs.next()) {
	            	marketApplicationDTO dto = new marketApplicationDTO();

	                dto.setIdx(rs.getString(1));
	                dto.setName(rs.getString(2));
	                dto.setTitle(rs.getString(3));
	                dto.setContent(rs.getString(4));
	                dto.setPostdate(rs.getDate(5));
	                dto.setOfile(rs.getString(6));
	                dto.setSfile(rs.getString(7));
	                dto.setDowncount(rs.getInt(8));
	                dto.setPass(rs.getString(9));
	                dto.setVisitcount(rs.getInt(10));

	                board.add(dto);
	            }
	        }
	        catch (Exception e) {
	            System.out.println("게시물 조회 중 예외 발생");
	            e.printStackTrace();
	        }
	        return board;
	    }
	 
	 
	
	public int insertClean(marketApplicationDTO dto) {

        int result = 0;
        try {
        	//쿼리문에서 app_type 부분 cleaning 으로되어있는데 이 value바꿔야됩니다! 체험학습할때
            String query = "INSERT INTO marketApplication ( "
                         + " idx, name, address, phone1, phone2, email, date1, submit_type, app_type"
                         + ", clean_type, clean_area, others) "
                         + " VALUES ( "
                         + " seq_board_num.NEXTVAL,?,?,?,?,?,?,?,'cleaning',?,?,?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getName());
            psmt.setString(2, dto.getAddress());
            psmt.setString(3, dto.getPhone1());
            psmt.setString(4, dto.getPhone2());
            psmt.setString(5, dto.getEmail());
            psmt.setString(6, dto.getDate());
            psmt.setString(7, dto.getSubmit_type());
            psmt.setString(8, dto.getClean_type());
            psmt.setString(9, dto.getClean_area());
            psmt.setString(10, dto.getOthers());
            result = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }
	
	
	
}
