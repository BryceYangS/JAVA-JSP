package concert.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class ConcertDAO {
	private ConcertDAO() {}
	private static ConcertDAO dao =null;
	public static ConcertDAO getInstance() {
		if(dao == null) {
			dao = new ConcertDAO();
		}
		return dao;
	}
	
	//#2. 변수 선언(Connection, PreparedStatement, ResultSet)
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url="jdbc:oracle:thin:@192.168.10.11:1521/orcl.oraedu.com";
		conn = DriverManager.getConnection(url, "usera", "oracle");
		return conn;
	}
	
	//#1. 아이디 중복 체크
	public int idCheck(String id) {
		int check = -1; // 중복 X
		
		try {
			conn = getConnection();
			String sql = "SELECT id FROM concert where id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				check = 1; // 중복O
			}
			conn.commit();

		}catch(Exception e) {e.printStackTrace();
		}finally {
			close();
		}
		return check;
	}
	
	//#2. 회원가입 DB 입력
	public void insert(ConcertDTO dto) {
		try {
			conn = getConnection();
			String sql = "INSERT INTO concert(id, passwd, name, email, tel, seats)"
									+ "VALUES(?,	?,		?,	?,		?, seat_tab_type())";
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getTel());
			pstmt.executeUpdate();
			conn.commit();

		}catch(Exception e) { e.printStackTrace();
		}finally {
			if(conn != null) {try {conn.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}		
		}
	}
	
	public boolean login(String id, String passwd) {
		//필요한 logic : DB에 아이디 있나 확인 -> 있으면 passwd랑 일치하는가? 하면 login! session유지.
		boolean check = false;
		
		try {
			conn = getConnection();
			
			String sql = "SELECT id, passwd FROM concert WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeQuery();
			rs = pstmt.getResultSet();
			while(rs.next()) {
				if(id.equals(rs.getString("id")) && passwd.equals(rs.getString("passwd"))) {
					check = true;
				}
			}
			conn.commit();
		}catch(Exception e) {e.printStackTrace();
		}finally {
			close();
		}
		return check;
	}
	
	public void reserve(ConcertDTO dto, String id) {
		try {
			conn = getConnection();
			
			String sql = "INSERT INTO THE(SELECT seats FROM concert WHERE id=?)"
					+" VALUES(?, ?,?)";
					
					/*"UPDATE concert"
					+ " SET seat_tab_type(seat_type(seatclass = ? , seatno = ?)"
					+ " WHERE id=?";*/
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, dto.getSeatClass());
			pstmt.setString(3, dto.getSeatNo());
			pstmt.setString(4, dto.getPname());
			pstmt.executeUpdate();
			conn.commit();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	
	public ResultSet inquiry(String id) {
		try {
			conn = getConnection();
			
			String sql = "SELECT s.pname 예약이름, s.seatclass 좌석구분, s.seatno 좌석번호"
					+ " FROM concert c, TABLE(c.seats) s"
					+ " WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			conn.commit();

		}catch(Exception e) { e.printStackTrace();
		}
		return rs;
	}
	
	public void cancel(String id, ConcertDTO dto) {
		try {
			conn = getConnection();
			String sql = 
					"DELETE FROM THE(SELECT seats FROM concert WHERE id =?)"
					+ " WHERE pname=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, dto.getPname());
			pstmt.executeUpdate();
			conn.commit();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	//예매 좌석 확인
	public boolean checkseat(ConcertDTO dto) {
		boolean check = false;
		//false : 중복 좌석 없음.
		//true	: 중복 좌석 있음.

		try {
			conn = getConnection();
			
			String sql = "SELECT s.seatclass 좌석구분, s.seatno 좌석번호" 
					+ " FROM concert c, TABLE(c.seats) s";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(dto.getSeatClass().equals(rs.getString("좌석구분")) &&
					dto.getSeatNo().equals(rs.getString("좌석번호"))) {
						check = true;
						//true	: 중복 좌석 있음.
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return check;
	}
	
	
	
	public void close() {
		if(conn != null) { try{conn.close();}catch(SQLException e) {}}
		if(pstmt != null) { try{pstmt.close();}catch(SQLException e) {}}
		if(rs != null) { try{rs.close();}catch(SQLException e) {}}
	}
	
}