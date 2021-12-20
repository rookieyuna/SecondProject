package market;

import common.DBConnPool;


public class marketApplicationDAO extends DBConnPool{

	public marketApplicationDAO() {
		super();
	}
	
	public int insertClean(marketApplicationDTO dto) {
//		others입력하는거 해야되는데... 
        int result = 0;
        try {
            String query = "INSERT INTO market_application ( "
                         + " idx, name, address, phone1, phone2, email, date, submit_type, app_type"
                         + ", clean_type, clean_area) "
                         + " VALUES ( "
                         + " seq_board_num.NEXTVAL,?,?,?,?,?,?,?,'cleaning',?,?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getName());
            psmt.setString(2, dto.getAddress());
            psmt.setString(3, dto.getPhone1());
            psmt.setString(4, dto.getPhone2());
            psmt.setString(5, dto.getEmail());
            psmt.setDate(6, dto.getDate());
            psmt.setString(7, dto.getSubmit_type());
            psmt.setString(9, dto.getClean_type());
            psmt.setString(10, dto.getClean_area());
            result = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }
	
}
