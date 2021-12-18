package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	//기본생성자
	public JDBConnect() {
		try {
			//오라클 드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver");
			//커넥션URL생성
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "secondpj";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("DB 연결 성공(기본생성자)");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void close() {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (con != null) con.close();
			
			System.out.println("JDBC 자원 해제");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
