package board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequestWrapper;

import common.JDBConnect;


public class BoardDAO extends JDBConnect{
	public BoardDAO() {
		// TODO Auto-generated constructor stub
	}
	
	// 게시판의 게시글DB들의 갯수 및 순번
	public int selectCount(Map<String, Object> map, String cate) {
		String category = cate;
		int totalCount = 0;

		String query = " SELECT COUNT(*) FROM (select * from board where category like";
			
			query += " '" + category + "' )";
			
			
			if(map.get("searchWord") != null) {
				query += " WHERE "+ map.get("searchField")
					+ " LIKE '%" + map.get("searchWord") + "%' ";
			}
			
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 수 구하는 중 예외 발생(selectCount)");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	// 게시판의 게시글DB의 여부에 따라 출력하는 기능
	public List<BoardDTO> selectList(Map<String, Object> map, String cate) {
		String category = cate;
		List<BoardDTO> boardBox = new Vector<BoardDTO>();
		
		try {
			String query = "SELECT * FROM ( "
					+ " SELECT Tb.*, ROWNUM rNum FROM ( ";
			
				if(map.get("searchWord") != null) {
					
					query += " select * from (";
				}
				
				query += " select * from board where category like '" + category + "'";
				
			
				if(map.get("searchWord") != null) {
					query += " ) WHERE "+ map.get("searchField")
						+ " LIKE '%" + map.get("searchWord") + "%' ";
				}
			
				query += " 		ORDER BY num DESC "
						+ "   ) Tb "
						+ " ) "
						+ " WHERE rNum BETWEEN ? AND ?";
				
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setDowncount(rs.getString("downcount"));
				dto.setPass(rs.getString("pass"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setCategory(rs.getString("category"));

				boardBox.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("selectList 오류발생");
			e.printStackTrace();
		}
			   
		return boardBox;
	}
	
	// 조회수 증가
	public void updateVisitCount(String num) {
		String query = "UPDATE board SET "
				+ " visitcount = visitcount+1 "
				+ " WHERE num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	// 글 보기
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		String query = "SELECT B.*, M.name, M.email "
				+ " FROM member M INNER JOIN board B "
				+ " ON M.id=B.id "
				+ " WHERE num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) { 
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setDowncount(rs.getString("downcount"));
				dto.setPass(rs.getString("pass"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setCategory(rs.getString("category"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	
	// 게시판 - 글쓰기 기능
	public int insertWrite(BoardDTO dto) {
		int result=0;
		try {
			String query = "INSERT INTO board ( "
					+ " num, id, pass, title, content, visitcount, category) "
					+ " VALUES ( "
					+ " seq_board_num.NEXTVAL, ?, ?, ?, ?, 0, ?)";

			psmt = con.prepareStatement(query);
			System.out.println("아이디 : "+ dto.getId());
			System.out.println("비밀번호 : "+ dto.getPass());
			System.out.println("제목 : "+ dto.getTitle());
			System.out.println("내용 : "+ dto.getContent());
			System.out.println("카테 : "+ dto.getCategory());

			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getCategory());

			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 프로그램 일정 추가하기
	public int pinsertWrite(BoardDTO dto) {
		int result=0;
		try {
			String query = "INSERT INTO board ( "
					+ " num, id, title, postdate, content, visitcount, category) "
					+ " VALUES ( "
					+ " seq_board_num.NEXTVAL, ?, ?, ?, ?, 0, ?)";

			psmt = con.prepareStatement(query);
			System.out.println("아이디 : "+ dto.getId());
			System.out.println("제목 : "+ dto.getTitle());
			System.out.println("내용 : "+ dto.getContent());
			System.out.println("카테 : "+ dto.getCategory());

			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setDate(3, dto.getPostdate());
			psmt.setString(4, dto.getTitle());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getCategory());

			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	//프로그램 일정 불러오기 
}
