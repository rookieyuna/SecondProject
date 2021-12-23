package board;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequestWrapper;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {
	public BoardDAO() {
		// TODO Auto-generated constructor stub
	}

	// 게시판의 게시글DB들의 갯수 및 순번
	public int selectCount(Map<String, Object> map, String cate) {
		String category = cate;
		int totalCount = 0;

		String query = " SELECT COUNT(*) FROM (select * from board where category like";

		query += " '" + category + "' )";

		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
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
			String query = "SELECT * FROM ( " + " SELECT Tb.*, ROWNUM rNum FROM ( ";

			if (map.get("searchWord") != null) {
				query += " select * from ( ";
			}

			query += " select * from (SELECT B.*, M.name, M.email  FROM member M INNER JOIN board B ON M.id=B.id) board where category like '"
					+ category + "'";

			if (map.get("searchWord") != null) {
				query += " ) WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
			}

			query += " 		ORDER BY num DESC " + "   ) Tb " + " ) " + " WHERE rNum BETWEEN ? AND ?";
			
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();

			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setDowncount(rs.getString("downcount"));
				dto.setPass(rs.getString("pass"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setCategory(rs.getString("category"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));

				boardBox.add(dto);
			}

		} catch (Exception e) {
			System.out.println("selectList 오류발생");
			e.printStackTrace();
		}
		return boardBox;
	}

	public BoardDTO getId(String id) {
		BoardDTO dto = new BoardDTO();
		String query = "SELECT B.*, M.name, M.email " + " FROM member M INNER JOIN board B " + " ON M.id=B.id ";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			if (rs.next()) {
				dto.setName(rs.getString("num"));
				dto.setEmail(rs.getString("email"));
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getString("postdate"));
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

	// 조회수 증가
	public void updateVisitCount(String num) {
		String query = "UPDATE board SET " + " visitcount = visitcount+1 " + " WHERE num=?";

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
		String query = "SELECT B.*, M.name, M.email " + " FROM member M INNER JOIN board B " + " ON M.id=B.id "
				+ " WHERE num=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getString("postdate"));
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
		int result = 0;
		try {
			String query = "INSERT INTO board ( " + " num, id, pass, title, content, visitcount, category) "
					+ " VALUES ( " + " seq_board_num.NEXTVAL, ?, ?, ?, ?, 0, ?)";

			psmt = con.prepareStatement(query);
			System.out.println("아이디 : " + dto.getId());
			System.out.println("비밀번호 : " + dto.getPass());
			System.out.println("제목 : " + dto.getTitle());
			System.out.println("내용 : " + dto.getContent());
			System.out.println("카테 : " + dto.getCategory());

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

	// 게시판 - 수정 기능
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		try {
			// update를 위한 쿼리문
			String query = "UPDATE board SET " + " title=?, content=? " + " WHERE num=?";
			// prepared객체 생성
			psmt = con.prepareStatement(query);
			// 인파라미터 설정
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			// 쿼리 실행
			result = psmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}

		return result;
	}

	// 게시판 - 삭제 기능
	public int deletePost(BoardDTO dto) {
		int result = 0;
		try {
			// 쿼리문 작성
			String query = "DELETE FROM board WHERE num=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

		// 게시판 - 삭제 기능
		public int deletePost(String[] bd_no) {
			int res = 0;
			int[] cnt = null;
			// 쿼리문 작성
			String query = "DELETE FROM board WHERE num=?";
			try {
				psmt = con.prepareStatement(query);
				for(int i=0; i<bd_no.length; i++) {
					psmt.setString(1, bd_no[i]);
					psmt.addBatch();
				}
				cnt = psmt.executeBatch();
				
				for(int i=0; i<cnt.length; i++) {
					if(cnt[i]==-2) {
						res++;
					}
				}
				
				if(bd_no.length==res) {
					con.commit();
				}else {
					con.rollback();
				}
			} catch (Exception e) {
				System.out.println("게시물 삭제 중 예외 발생");
				e.printStackTrace();
			}
			return res;
		}
		
	// 게시판 - 파일 첨부
	public int insertFile(BoardDTO dto) {
		int applyResult = 0;
		try {
			// 1. 쿼리문 작성
			String query = "INSERT INTO BOARD ( "
					+ " num, id, title, content, ofile, sfile, downcount, pass, category) " 
					+ " VALUES ( "
					+ " seq_board_num.nextval, ?, ?, ?, ?, ?, 0, ?, ?) ";

			// 2. prepared객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);

			System.out.println("아이디 : " + dto.getId());
			System.out.println("제목 : " + dto.getTitle());
			System.out.println("내용 : " + dto.getContent());
			System.out.println("기존 : " + dto.getOfile());
			System.out.println("변경 : " + dto.getSfile());
			System.out.println("pass : " + dto.getPass());
			System.out.println("카테 : " + dto.getCategory());

			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPass());
			psmt.setString(7, dto.getCategory());
			// 3. 쿼리실행
			applyResult = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("INSERT 중 예외 발생");
			e.printStackTrace();
		}
		return applyResult;
	}

	// 프로그램 일정 추가하기
	public int pinsertWrite(BoardDTO dto) {
		int result = 0;
		try {
			String query = "INSERT INTO board ( " 
					+ " num, id, pass, title, content, postdate, visitcount, category) "
					+ " VALUES ( " + " seq_board_num.NEXTVAL, ?, ?, ?, ?, ?, 0, ?)";

			psmt = con.prepareStatement(query);
			System.out.println("아이디 : " + dto.getId());
			System.out.println("비번 : " + dto.getPass());
			System.out.println("제목 : " + dto.getTitle());
			System.out.println("날짜 : " + dto.getPostdate());
			System.out.println("내용 : " + dto.getContent());
			System.out.println("카테 : " + dto.getCategory());

			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getPostdate());
			psmt.setString(6, dto.getCategory());

			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	// 프로그램 값 받아오기 (달력에 뿌려주기) 
	public Map<String, BoardDTO> calList(String data) { 
	
		Map<String, BoardDTO> calendar = new HashMap<String, BoardDTO>();
		
		String query = "SELECT B.*, to_char(postdate, 'yyyy-mm-dd') pdate "
		 		+ " FROM board B "
				+ " WHERE category='proB' AND to_char(postdate, 'yyyy-mm')='"+data+"' " 
				+ " ORDER BY postdate ASC";
		System.out.println("쿼리문:"+query);
		
		try { 
			psmt = con.prepareStatement(query); 
			rs = psmt.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getString("pdate")+""+rs.getString("title"));
				
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setPostdate(rs.getString("pdate"));
				
				calendar.put(rs.getString("pdate"),dto);
			}
		} 
		catch (Exception e) { 
			System.out.println("값 조회 중 예외 발생");
			e.printStackTrace(); 
		} 
		return calendar;
	}
	
}
