package model2.mvcboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class MVCBoardDAO extends DBConnPool {
	public MVCBoardDAO() {
		super();
}
	//검색
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM mvcboard";
		if (map.get("searchWord") != null) {
			query += "  WHERE " + map.get("searchField") + ""
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
	
	//리스트(페이징 기능)
	public List<MVCBoardDTO> selectListPage(Map<String, Object> map) {
		
		List<MVCBoardDTO> board = new Vector<MVCBoardDTO>();
		String query = " "
				+ "SELECT * FROM ( "
					+ "		SELECT Tb.*, ROWNUM rNum FROM ( "
					+ "			SELECT * FROM mvcboard	";		
		if (map.get("searchWord") != null) 
		{
			query += " WHERE " + map.get("searchField")
					+ " LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += " 			ORDER BY idx DESC "
				+ " 	) Tb "
				+ " )"
				+ " WHERE rNum BETWEEN ? AND ?";
				
		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			//추출된 결과에 따라 반복한다.
			while (rs.next()) {
				//하나의 레코드를 읽어서 DTO객체에 저장한다.
				MVCBoardDTO dto = new MVCBoardDTO();
				//System.out.println("번호:"+rs.getString(1));
				dto.setNum(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setTitle(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setPostdate(rs.getDate(6));
				dto.setOfile(rs.getString(7));
				dto.setSfile(rs.getString(8));
				dto.setDowncount(rs.getString(9));
				dto.setPass(rs.getString(10));
				dto.setVisitcount(rs.getInt(11));
				dto.setCategory(rs.getString(12));
				
			//리스트 컬렉션에 DTO객체를 추가한다.
			board.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("게시물 조회중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}
	
	//새로운 게시물에 대한 입력처리
	public int insertWrite(MVCBoardDTO dto) {
		int result =0;
		try {
			String query = "INSERT INTO mvcboard ( "
						+ " num, name, title, content, ofile, sfile, pass) "
						+ " VALUES ( "
						+ " seq_board_num.NEXTVAL,?,?,?,?,?,?)";
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPass());
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 입력중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	//주어진 일련번호에 해당하는 게시i물을 DTO에 담아 반환한다.
	public MVCBoardDTO selectView(String num) {
		
		MVCBoardDTO dto = new MVCBoardDTO();//DTO 객체 생성
		String query = "SELECT * FROM mvcboard WHERE idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {//결과에 DTO 
				dto.setNum(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setTitle(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setPostdate(rs.getDate(6));
				dto.setOfile(rs.getString(7));
				dto.setSfile(rs.getString(8));
				dto.setDowncount(rs.getString(9));
				dto.setPass(rs.getString(10));
				dto.setVisitcount(rs.getInt(11));
				dto.setCategory(rs.getString(12));
			}
		}
		catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	//게시물조회수
	public void updateVisitCount(String num) {
		String query = "UPDATE mvcboard SET "
					+ " visitcount=visitcount+1 "
					+ " WHERE num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
		}
		catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	//주어진 다운로드수 증가
	public void downCountPlus(String num) {
		String sql = "UPDATE mvcboard SET "
					+ " downcount=downcount+1 "
					+ " WHERE num=? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, num);
			psmt.executeQuery();
		}
		catch (Exception e) {
		}
	}
	//패스워드 검증을 위해 해당 게시물이 존재하는지 확인
	public boolean confirmPassword(String pass, String num) {
		boolean isCorr = true;
		try {
			//패스워드와 일련번호를 통해 조건에 맞는 게시물이 있는지 확인.
			String sql = "SELECT COUNT(*) FROM mvcboard WHERE pass=? AND idx=?";
			psmt = con.prepareStatement(sql);
			//인파라미터 설정
			psmt.setString(1, pass);
			psmt.setString(2, num);
			rs = psmt.executeQuery();
			rs.next();
			//커서 이동을 위한 next() 호출. count()함수는 항상 결과를 반환하므로
			//if문은 별도로 필요하지 않다.
			if (rs.getInt(1) == 0) {//결과가 없을때 false로 처리
				isCorr = false;
			}
		}
		catch (Exception e) {
			isCorr = false;//예외가 발생하면 확인이 안되므로 false로 처리
			e.printStackTrace();
		}
		return isCorr;
	}
	//일련번호에 해당하는 게시물 삭제
	public int deletePost(String num) {
		int result = 0;
		try {
			String query = "DELETE FROM mvcboard WHERE num=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	//일련번호와 패스워드가 일치할때만 수정
	public int updatePost(MVCBoardDTO dto) {
		int result = 0;
		try {
			String query = "UPDATE mvcboard"
						+ "SET title=?, name=?, content=?, ofile=? sfile=?"
						+ " WHERE idx=? and pass=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getNum());
			psmt.setString(7, dto.getPass());
			
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}
	
		
	
