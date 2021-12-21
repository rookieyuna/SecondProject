package market.basket;

import common.DBConnPool;


public class CartDAO extends DBConnPool{

	public CartDAO() {
		super();
	}
	
	public int insertWrite(CartDTO dto) {
        int result = 0;
        try {
            String query = "INSERT INTO cart ( "
                         + " cart_no, count_num, total_price, product_no, id) "
                         + " VALUES ( "
                         + " seq_board_num.NEXTVAL,?,?,?,?)";
            psmt = con.prepareStatement(query);
            psmt.setInt(1, dto.getCount_num());
            psmt.setInt(2, dto.getTotal_price());
            psmt.setString(3, dto.getProduct_no());
            psmt.setString(4, dto.getId());
           
            result = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }
}
