package market;

import javax.servlet.ServletContext;

import common.DBConnPool;


public class marketApplicationDAO extends DBConnPool{

	public marketApplicationDAO() {
		super();
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
