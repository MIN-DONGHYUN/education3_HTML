package chap05;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PersonDAO_04 implements InterPersonDAO_03 {

	
	private Connection conn;
	private PreparedStatement pstmt;  // 위치홀더를 사용하기 위해
	private ResultSet rs;
	
	private void close() {// 자원 반납
		
		try {
			if(rs != null) {
				rs.close();
				rs=null;
			}
			if(pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
	} // end of private void close()
	
	
	// 개인성향을 입력(insert) 해주는 메소드 구현하기
	@Override
	public int personRegister(PersonDTO_02 psdto) throws SQLException {
		
		int n = 0;
		
		try {
			
			conn = MyDBConnection_05.getConn();
			
			// 위치 홀더
			String sql = "insert into tbl_person_interest(seq, name, school, color, food)"
					   + "values(person_seq.nextval, ?, ?, ?, ?)";
		
			// 우편 배달부
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, psdto.getName());
			pstmt.setString(2, psdto.getSchool());
			pstmt.setString(3, psdto.getColor());
			
			if( psdto.getFood() != null) {
				pstmt.setString(4, String.join(",", psdto.getFood()) );   // 배열을 join으로 문자열로 바꿈
			}
			else {
				pstmt.setString(4, null);
			}
			
			n = pstmt.executeUpdate();   //DML 문  리턴은 int 가 나오게 됨  
		} 
		finally {
			close();
		}
		
		
		return n;
	} // end of public int personRegister(PersonDTO_02 psdto) {

}
