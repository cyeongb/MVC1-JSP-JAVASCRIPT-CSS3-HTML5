package funwebmember;

import funwebmember.MemberBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {

	private Connection getConnection() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String dbUrl = "jdbc:mysql://localhost:3306/funwebdb";
		String dbUser = "root";
		String dbPass = "chldud0102";
		Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
		return con;
	}

	//------------------- insertMember() ---------------------------
	public void insertMember(MemberBean mb) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = getConnection();
			String sql = "insert into funwebmember(UserID,password,name,email,address,phonenum,mobilenum,postcode,reg_date) values(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getUserID());
			pstmt.setString(2, mb.getPassword());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getEmail());
			pstmt.setString(5, mb.getAddress());
			pstmt.setString(6, mb.getPhonenum());
			pstmt.setString(7, mb.getMobilenum());
			pstmt.setString(8, mb.getPostcode());
			pstmt.setTimestamp(9, mb.getReg_date());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException EX) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException EX) {
				}
		}
	}
	
	//------------------------userCheck() ----------------------------
 	public int userCheck(String id, String pass) {

		int check = 0;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		try {			
			con = getConnection();
			String sql = "select * from funwebmember where UserID=?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			 rs = pstmt.executeQuery();
			if (rs.next()) {
				if (pass.equals(rs.getString("password"))) {
					check = 1;
				} else {
					check = 0;
				}
			} else {
				check = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try {rs.close();}catch(SQLException EX) {}
			if(con!=null)try {con.close();}catch(SQLException EX) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException EX) {}
		}
		return check;
	}
	
	//----------------- idcheck() -------------------------------
	public int idCheck(String id) {

		int check = 0;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		try {			
			con = getConnection();
			String sql = "select * from funwebmember where UserID=?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			 rs = pstmt.executeQuery();

			if(rs.next()==true) {
				 check=1; //아이디 괜춘
			}else {
				 check=0; //아이디 중복
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try {rs.close();}catch(SQLException EX) {}
			if(con!=null)try {con.close();}catch(SQLException EX) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException EX) {}
		}
		return check;
	}
	
	//---------------- getMember() --------------------------------
	public MemberBean getMember(String id) {
		MemberBean mb = null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {			
			con = getConnection();
			String sql = "select * from funwebmember where UserID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				mb = new MemberBean();
				mb.setUserID(rs.getString("userid"));
				mb.setPassword(rs.getString("password"));
				mb.setName(rs.getString("name"));
				mb.setEmail(rs.getString("email"));
				mb.setPostcode(rs.getString("postcode"));
				mb.setAddress(rs.getString("address"));
				mb.setPhonenum(rs.getString("phonenum"));
				mb.setMobilenum(rs.getString("mobilenum"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
			}

		} catch (Exception e) {
			e.printStackTrace();

		}finally{
			if(rs!=null)try {rs.close();}catch(SQLException EX) {}
			if(con!=null)try {con.close();}catch(SQLException EX) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException EX) {}
		}
		return mb;
}
	//------------------ updateMember 회원정보수정 -----------------------
	public  int updateMember(MemberBean mb) {
		System.out.println(mb.getUserID());
		int check=-2;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {		
		
			      	con=getConnection();
				    String sql="update funwebmember set name=?, email=?,postcode=?,address=?,phonenum=?,mobilenum=? where UserID=?";						
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,mb.getName());
					pstmt.setString(2,mb.getEmail());
					pstmt.setString(3,mb.getPostcode());
					pstmt.setString(4,mb.getAddress());
					pstmt.setString(5,mb.getPhonenum());
					pstmt.setString(6,mb.getMobilenum());
					pstmt.setString(7,mb.getUserID());
					pstmt.executeUpdate();
					check=1;
			   
				
		} catch (Exception e) {
			System.out.println("오류발생: "+e.getMessage());
			e.printStackTrace();	
			 check=-1;
	    }finally{
			if(rs!=null)try {rs.close();}catch(SQLException EX) {}
			if(con!=null)try {con.close();}catch(SQLException EX) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException EX) {}
		}
		return check;				
}	
	//------------------ deleteMember 회원정보삭제 -----------------------
		public void deleteMember(String id) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con=getConnection();			
				String sql="delete from funwebmember where UserID=?"; 
		        pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);			
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) try {rs.close();}catch(SQLException ex) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException ex) {}
				if(con!=null) try {con.close();}catch(SQLException ex) {}
			}
		}	
}
