package board;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;

public class BoardDAO extends JDBConnect{
	public BoardDAO() {
		// TODO Auto-generated constructor stub
	}
	
	// 게시판의 게시글DB들의 갯수 및 순번
	public int selectCount(Map<String, Object> map, String cate) {
		String category = cate;
		int totalCount = 0;
		System.out.println("category : " + category);
		String query = " SELECT COUNT(*) FROM board ";
			if(category == "notB") {
				query += " WHERE CATEGORY LIKE 'notB' ";  
			}else if(category == "proB") {
				query += " WHERE CATEGORY LIKE 'proB' ";
			}else if(category == "freeB") {
				query += " WHERE CATEGORY LIKE 'freeB' ";
			}else if(category == "photoB") {
				query += " WHERE CATEGORY LIKE 'photoB' ";
			}else if(category == "infoB") {
				query += " WHERE CATEGORY LIKE 'infoB' ";
			}else if(category == "stafB") {
				query += " WHERE CATEGORY LIKE 'stafB' ";
			}else if(category == "guardB") {
				query += " WHERE CATEGORY LIKE 'guardB' ";
			}else { }
			System.out.println(query);
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
			String query = " SELECT * FROM board ";
				if(category == "notB") {
				  
				}else if(category == "proB") {
				  
				}else if(category == "freeB") {
				   query += " where category like 'freeB' ";
				}else if(category == "photoB") {
				   
				}else if(category == "infoB") {
				   
				}else if(category == "stafB") {
				  
				}else if(category == "guardB") {
				   
				}
				query += " ORDER BY num DESC ";
				
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
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
}
