package networkboard;



	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.util.ArrayList;
	import java.util.List;

	import javax.sql.DataSource;
	import javax.naming.Context;
	import javax.naming.InitialContext;

	public class networkBoardDAO {
	

		private Connection getConnection() throws Exception { // 예외처리를 해 준다.

			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysqlDB");
			Connection con = ds.getConnection();
			return con;
		}

		// ============= 게시판 글 등록 -======================
		public void finsertBoard(networkBoardBean bb) { // 파일 첨부 게시판

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				con = getConnection();
				String sql = "select max(num) from networkboard";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				int num = 0;
				if (rs.next()) {
					num = rs.getInt("max(num)") + 1;
				}
				sql = "insert into networkboard(num,name,password,subject,content,readcount,date,file) values(?,?,?,?,?,?,now(),?);";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, bb.getName());
				pstmt.setString(3,bb.getPassword());
				pstmt.setString(4, bb.getSubject());
				pstmt.setString(5, bb.getContent());
				pstmt.setInt(6, 0);
				pstmt.setString(7, bb.getFile());
				// pstmt.setDate(7,bb.getDate());
				pstmt.executeUpdate();
			} catch (Exception e) { // 오류 정보 위치 추적 출력
				e.printStackTrace();
			} finally { // 예외가 나던 상관없이 마무리 작업을 해 준다.

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

		// ================ getBoardList() 오버로딩 =======================
		public List getBoardList(int startRow, int pageSize) {
			List boardlist = new ArrayList();
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				con = getConnection();
				String sql = "select * from networkboard order by num desc limit ?,?"; // limit --> mysql에만 있는 구문.
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow - 1);
				pstmt.setInt(2, pageSize);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					networkBoardBean bb = new networkBoardBean();
					bb.setNum(rs.getInt("num"));
					bb.setName(rs.getString("name"));
					bb.setPassword(rs.getString("password"));
					bb.setSubject(rs.getString("subject"));
					bb.setContent(rs.getString("content"));
					bb.setDate(rs.getDate("date"));
					bb.setFile(rs.getString("file"));
					bb.setReadcount(rs.getInt("readcount"));
					boardlist.add(bb); // bb에 정보가 순서대로 저장됨.
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException EX) {
					}
				if (con != null)
					try {
						con.close();
					} catch (SQLException EX) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException EX) {
					}
			}
			return boardlist;
		}
		
		//------------------- 게시판 검색 구현.. getBoardList()  오버로딩 -----------------------
		public List getBoardList(int startRow,int pageSize,String search) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List boardList=new ArrayList();
			try {
				//1,2단계 디비연결
				con=getConnection();
				//3단계 sql board 모든데이터 가져오기 정렬 num 기준 내림차순
				//String sql="select * from board order by num desc limit 시작행-1,글개수";
				//String sql="select * from board where subject like '%검색어%' order by num desc limit ?,?";
				String sql="select * from  networkboard where subject like ? order by num desc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setInt(2,startRow-1);
				pstmt.setInt(3, pageSize);
				//4단계  rs = 실행 결과 저장
				rs=pstmt.executeQuery();
				//5단계 rs => 한개글 BoardBean => 배열한칸 저장
				while(rs.next()) {
					networkBoardBean bb=new networkBoardBean();
					bb.setNum(rs.getInt("num"));
					bb.setName(rs.getString("name"));
					bb.setPassword(rs.getString("password"));
					bb.setSubject(rs.getString("subject"));
					bb.setContent(rs.getString("content"));
					bb.setDate(rs.getDate("date"));
					bb.setReadcount(rs.getInt("readcount"));				
					boardList.add(bb);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				//예외상관없이 마무리(기억장소정리)
				if(rs!=null) try {rs.close();}catch(SQLException ex) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException ex) {}
				if(con!=null) try {con.close();}catch(SQLException ex) {}
			}
			return boardList;
		}
		

		// ========= 게시판 글 목록 번호 가져오는 메서드 ==================>list2.jsp
		public int getboardCount() {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int count = 0;
			try {
				con = getConnection();
				String sql = "select count(*) from networkboard";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					count = rs.getInt("count(*)");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException EX) {
					}
				if (con != null)
					try {
						con.close();
					} catch (SQLException EX) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException EX) {
					}
			}
			return count;
		}

		// =============== 게시판 글 내용 가져오는 메서드 =================
		public networkBoardBean contentboard(int num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			networkBoardBean bb = new networkBoardBean();
			try {
				con = getConnection();
				String sql = "select * from networkboard where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					bb.setNum(rs.getInt("num"));
					//System.out.println(rs.getInt("num"));
					bb.setName(rs.getString("name"));
					bb.setPassword(rs.getString("password"));
					bb.setSubject(rs.getString("subject"));
					bb.setContent(rs.getString("content"));
					bb.setDate(rs.getDate("date"));
				//	System.out.println(rs.getDate("date"));
					bb.setFile(rs.getString("file"));
					bb.setReadcount(rs.getInt("readcount"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException EX) {
					}
				if (con != null)
					try {
						con.close();
					} catch (SQLException EX) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException EX) {
					}
			}
			return bb; // bb는 주솟값이다.
		}

		
		// ========== 게시판 조회수 ===================
		public void updateReadcount(int num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			networkBoardBean bb = null;
			try {
				con = getConnection();
				String sql = "update networkboard set readcount=readcount+1 where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException EX) {
					}
				if (con != null)
					try {
						con.close();
					} catch (SQLException EX) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException EX) {
					}
			}
		}

		// ============ 게시판 비번 체크 ======================
		public int passCheck(networkBoardBean bb) {

			int check = -1;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			System.out.println(bb.getNum());
			System.out.println(bb.getPassword());
			try {
				con = getConnection();
				String sql = "select * from networkboard where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bb.getNum());
				rs = pstmt.executeQuery();

				if (rs.next()) {
					System.out.println(rs.getString("password"));
					if (bb.getPassword().equals(rs.getString("password"))) {
						check = 1;
					} else {
						
						check = 0;
					}
				} else {
					check = -1;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException EX) {
					}
				if (con != null)
					try {
						con.close();
					} catch (SQLException EX) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException EX) {
					}
			}
			return check;
		}

		// ===============게시판 글 수정 ==========================
		public int updateBoard(networkBoardBean bb) {

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int check = -2;
			try {		
				con = getConnection();		
				String sql = "select * from networkboard where num=?";
				pstmt = con.prepareStatement(sql);		
				pstmt.setInt(1, bb.getNum());
				rs = pstmt.executeQuery();		
				
				if (rs.next()) {
					if (bb.getPassword().equals(rs.getString("password"))) {
						sql = "update networkboard set subject=?, content=?, date=now(), file=? where  num =?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, bb.getSubject());
						pstmt.setString(2, bb.getContent());				
						pstmt.setString(3, bb.getFile());
						pstmt.setInt(4, bb.getNum());
						pstmt.executeUpdate();
						return check = 1;
					} else {
						return check = -1;
					}
				} else {
					return check = 0;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException EX) {
					}
				if (con != null)
					try {
						con.close();
					} catch (SQLException EX) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException EX) {
					}
			}
			return check;
		}
		//---------------------- 글 삭제 메서드 -----------------------------------
		public int deleteBoard(networkBoardBean bb) {

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int check = -2;
			//System.out.println(bb.getNum());
			try {		
				con = getConnection();		
				String sql = "select * from networkboard where num=?";
				pstmt = con.prepareStatement(sql);		
				pstmt.setInt(1, bb.getNum());
				rs = pstmt.executeQuery();		
				
				if (rs.next()) {
					if (bb.getPassword().equals(rs.getString("password"))) {
						sql = "delete from funwebboard where num=?";					
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, bb.getNum());
						pstmt.executeUpdate();
						return check = 1;
					} else {
						return check = -1;
					}
				} else {
					return check = 0;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException EX) {
					}
				if (con != null)
					try {
						con.close();
					} catch (SQLException EX) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException EX) {
					}
			}
			return check;
		}
			//----------------------------- 게시판 검색 ---------------------------------------
		   //getboardCount  메서드 오버로딩 
		public int getboardCount(String search) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int count = 0;
			try {
				con = getConnection();
				String sql = "select count(*) from funwebboard where subject like ? ";			
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,"%"+search+"%");
				rs = pstmt.executeQuery();

				if (rs.next()) {
					count = rs.getInt("count(*)");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException EX) {
					}
				if (con != null)
					try {
						con.close();
					} catch (SQLException EX) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException EX) {
					}
			}
			return count;
		}

	


}
