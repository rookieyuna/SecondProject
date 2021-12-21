package membership;

import java.util.List;
import java.util.Map;

import common.JDBConnect;

/*
DAO(Data Access Object)
*/


//DB연결을 위한 클래스 상속
public class MemberDAO extends JDBConnect {

	// BOK ADD(21.12.20) 전체 데이터를 가져오기위한 기능
	//로그인 메서드 (21.12.20) JYA 한개로 통일
	public MemberDTO allMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		//회원로그인을 위한 쿼리문 작성
		String query = "SELECT * FROM member WHERE id=? AND pass=?";
		
		try {
			psmt = con.prepareStatement(query);
			//쿼리문에 사용자가 입력한 아이디, 패스워드를 설정
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			//쿼리 실행
			rs = psmt.executeQuery();
			
			//회원정보가 존재한다면 DTO객체에 정보를 저장
			if(rs.next()) {
				
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setEmail(rs.getString(4));
				dto.setPostcode(rs.getString(5));
				dto.setAddr1(rs.getString(6));
				dto.setAddr2(rs.getString(7));
				dto.setPhone1(rs.getString(8));
				dto.setPhone2(rs.getString(9));
				dto.setIdentity(rs.getString(10));
				dto.setRegidate(rs.getString(11));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//[회원가입] 회원정보 삽입 메서드
	public int insertMember(MemberDTO dto) {
		//입력결과 확인용 변수
		int result=0;
		
		try {
			//인파라미터가 있는 쿼리문 작성(동적쿼리문)
			String query = " INSERT INTO member ( "
						+ " id, pass, name, email, postcode, addr1, addr2, phone1, phone2) "
						+ " VALUES ( "
						+ " ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				
			//동적쿼리문 실행을 위한 prepared 객체 생성
			psmt = con.prepareStatement(query);
			//순서대로 인파라미터 설정
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			psmt.setString(5, dto.getPostcode());
			psmt.setString(6, dto.getAddr1());
			psmt.setString(7, dto.getAddr2());
			psmt.setString(8, dto.getPhone1());
			psmt.setString(9, dto.getPhone2());
			//쿼리문 실행 : 입력에 성공하면 1, 실패하면 0 반환
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("회원가입 중 예외 발생");
			e.printStackTrace();
		}	
		return result;
	}
	
	
	//[회원가입] 아이디 중복확인 메서드
	public int idOverChk(String uid) {
		MemberDTO dto = new MemberDTO();
		//회원로그인을 위한 쿼리문 작성
		String query = "SELECT * FROM member WHERE id=?";
		int result=0;
		try {
			psmt = con.prepareStatement(query);
			//쿼리문에 사용자가 입력한 아이디, 패스워드를 설정
			psmt.setString(1, uid);
			//쿼리 실행
			rs = psmt.executeQuery();
			
			//회원정보가 존재한다면 결과값에 1 저장
			if(rs.next()) {
				result=1;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	//회원정보 변경 메서드
	public int modifyMember(MemberDTO dto) {
		//입력결과 확인용 변수
		int result=0;
		try {
			//인파라미터가 있는 쿼리문 작성(동적쿼리문)
			String query = " Update member SET "
						+ " pass=?, "
						+ " name=?, "
						+ " email=?, "
						+ " postcode=?, "
						+ " addr1=?, "
						+ " addr2=?, "
						+ " phone1=?, "
						+ " phone2=? "
						+ " WHERE id=? ";
				
			//동적쿼리문 실행을 위한 prepared 객체 생성
			psmt = con.prepareStatement(query);
			//순서대로 인파라미터 설정
			psmt.setString(1, dto.getPass());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getEmail());
			psmt.setString(4, dto.getPostcode());
			psmt.setString(5, dto.getAddr1());
			psmt.setString(6, dto.getAddr2());
			psmt.setString(7, dto.getPhone1());
			psmt.setString(8, dto.getPhone2());
			psmt.setString(9, dto.getId());
			//쿼리문 실행 : 입력에 성공하면 1, 실패하면 0 반환
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("회원정보 수정 중 예외 발생");
			e.printStackTrace();
		}	
		return result;
	}
}
	
/*	//이름으로 아이디/비번 찾기
	public MemberDTO findMemberDTO(String uId, String uName) {
		MemberDTO dto = new MemberDTO();
		//회원로그인을 위한 쿼리문 작성
		String query = "";
		
		try {
			if(uId == "") { //이름으로 아이디 찾기
				query = "SELECT * FROM member WHERE name=?";
				
				psmt = con.prepareStatement(query);
				//쿼리문에 사용자가 입력한 이름 삽입
				psmt.setString(1, uName);
				//쿼리 실행
				rs = psmt.executeQuery();
			}
			else { //아이디&이름으로 비번 찾기
				query = "SELECT * FROM member WHERE id=? and name=?";
				
				psmt = con.prepareStatement(query);
				//쿼리문에 사용자가 입력한 이름 삽입
				psmt.setString(1, uId);
				psmt.setString(2, uName);
				//쿼리 실행
				rs = psmt.executeQuery();
			}	
			
			//회원정보가 존재한다면 DTO객체에 정보를 저장
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}*/
