package com.shop.biz;

import java.sql.*;
import java.util.ArrayList;

import com.shop.model.DBConn;
import com.shop.model.InformVO;

//배치(batch) 프로그래밍 : 한 곳에서 일을 한꺼번에 처리하기 위한 프로그래밍 
//Inform 테이블에 접근하여 데이터 처리요청되어 온 일들을 모두 한 곳에서 처리하기 위한 모듈  
public class InformDAO {
	private Connection con = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	//공지사항 리스트를 데이터베이스에 접근하여 가져와서 VO에 담은 후 Controller에 리턴해주는 역할의 메서드
	public ArrayList<InformVO> getInformList() {  //int startRow, int endRow
		ArrayList<InformVO> informList = null;
		try {
			con = DBConn.getConnection();
			String sql = "select * from inform order by regdate desc, seq asc";
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			informList = new ArrayList<InformVO>();
			while(rs.next()) {
				//데이터베이스 테이블에서 반환된 결과세트를 각 컬럼별로 지역변수에 담기 
				int seq = rs.getInt("seq");
				String nickname = rs.getString("nickname");
				String title = rs.getString("title");
				String incontent = rs.getString("incontent");
				Date regdate = rs.getDate("regdate");
				int grade = rs.getInt("grade");
				String userid = rs.getString("userid");
				int visited = rs.getInt("visited");
				
				//각 지역변수에 담긴 필드값을 VO에 담기
				InformVO inform = new InformVO();
				inform.setSeq(seq);
				inform.setNickname(nickname);
				inform.setTitle(title);
				inform.setIncontent(incontent);
				inform.setRegdate(regdate);
				inform.setGrade(grade);
				inform.setUserid(userid);
				inform.setVisited(visited);
				
				//VO에 담긴 데이터를 LIST에 담기
				informList.add(inform);
			}
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩이 되지 않았습니다.");
			e.printStackTrace();
		}  catch(SQLException e) {
			System.out.println("SQL 구문 또는 열이름, 변수명 등이 서로 맞지 않습니다.");
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, stmt, con);
		}
		//VO의 값을 LIST에 담은 결과를 반환
		return informList;
	}
	
	public InformVO getInform(InformVO vo) {
		InformVO inform = null;
		try {
			con = DBConn.getConnection();
			String sql = "update inform set visited=visited+1 where seq = ?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, vo.getSeq());
			int cnt = stmt.executeUpdate();
			stmt.close();
			if(cnt>0) {
				sql = "select * from inform where seq = ?";
				stmt = con.prepareStatement(sql);
				stmt.setInt(1, vo.getSeq());
				rs = stmt.executeQuery();
				if(rs.next()) {
					inform = new InformVO();
					inform.setSeq(rs.getInt("seq"));
					inform.setNickname(rs.getString("nickname"));
					inform.setTitle(rs.getString("title"));
					inform.setIncontent(rs.getString("incontent"));
					inform.setRegdate(rs.getDate("regdate"));
					inform.setGrade(rs.getInt("grade"));
					inform.setUserid(rs.getString("userid"));
					inform.setVisited(rs.getInt("visited"));
				}
			}	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, stmt, con);
		}
		return inform;
	}
	public int updateInform(InformVO vo) {
		int cnt = 0;
		try {
			con = DBConn.getConnection();
			String sql = "update inform set title=?, incontent=? where seq=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getIncontent());
			stmt.setInt(3, vo.getSeq());
			cnt = stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(stmt, con);
		}
		return cnt;
	}
	public int deleteInform(InformVO vo) {
		int cnt=0;
		try {
			con = DBConn.getConnection();
			String sql = "delete from inform where seq=?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, vo.getSeq());
			cnt = stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(stmt, con);
		}
		return cnt;
	}
	public int addInform(InformVO vo) {
		int cnt = 0;
		try {
			con = DBConn.getConnection();
			String sql = "insert into inform values(inform_seq.nextval, ?, ?, ?, sysdate, 2, 'admin', 0)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, vo.getNickname());
			stmt.setString(2, vo.getTitle());
			stmt.setString(3,  vo.getIncontent());
			cnt = stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(stmt, con);
		}
		return cnt;
	}
}