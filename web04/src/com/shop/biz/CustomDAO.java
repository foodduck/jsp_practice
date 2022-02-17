package com.shop.biz;

import java.sql.*;
import java.util.ArrayList;

import com.shop.model.*;

//배치(batch) 프로그래밍 : 한 곳에서 일을 한꺼번에 처리하기 위한 프로그래밍 
//custom 테이블에 접근하여 데이터 처리요청되어 온 일들을 모두 한 곳에서 처리하기 위한 모듈  
public class CustomDAO {
	private Connection con = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	//회원 리스트를 데이터베이스에 접근하여 가져와서 VO에 담은 후 Controller에 리턴해주는 역할의 메서드
	public ArrayList<CustomVO> getCustomList() { 
		ArrayList<CustomVO> customList = null;
		try {
			con = DBConn.getConnection();
			String sql = "select * from custom order by regdate desc";
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			customList = new ArrayList<CustomVO>();
			while(rs.next()) {
				//데이터베이스 테이블에서 반환된 결과세트를 각 컬럼별로 지역변수에 담기 
				String cusid = rs.getString("cusid");
				String cuspw = rs.getString("cuspw");
				String cusname = rs.getString("cusname");
				String cusemail = rs.getString("cusemail");
				String custel = rs.getString("custel");
				String zipcode = rs.getString("zipcode");
				String addr1 = rs.getString("addr1");
				String addr2 = rs.getString("addr2");
				int cuspoint = rs.getInt("cuspoint");
				int visited = rs.getInt("visited");
				Date regdate = rs.getDate("regdate");
				int grade = rs.getInt("grade");
				
				//각 지역변수에 담긴 필드값을 VO에 담기
				CustomVO custom = new CustomVO();
				custom.setCusid(cusid);
				custom.setCuspw(cuspw);
				custom.setCusname(cusname);
				custom.setCusemail(cusemail);
				custom.setCustel(custel);
				custom.setZipcode(zipcode);
				custom.setAddr1(addr1);
				custom.setAddr2(addr2);
				custom.setCuspoint(cuspoint);
				custom.setVisited(visited);
				custom.setRegdate(regdate);
				custom.setGrade(grade);
				
				//VO에 담긴 데이터를 LIST에 담기
				customList.add(custom);
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
		return customList;
	}
	
	public CustomVO getCustom(CustomVO vo) {
		CustomVO custom = null;
		try {
			con = DBConn.getConnection();
			String sql = "update custom set visited=visited+1 where cusid = ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, vo.getCusid());
			int cnt = stmt.executeUpdate();
			stmt.close();
			if(cnt>0) {
				sql = "select * from custom where cusid = ?";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, vo.getCusid());
				rs = stmt.executeQuery();
				if(rs.next()) {
					custom = new CustomVO();
					custom.setCusid(rs.getString("cusid"));
					custom.setCuspw(rs.getString("cuspw"));
					custom.setCusname(rs.getString("cusname"));
					custom.setCusemail(rs.getString("cusemail"));
					custom.setCustel(rs.getString("custel"));
					custom.setZipcode(rs.getString("zipcode"));
					custom.setAddr1(rs.getString("addr1"));
					custom.setAddr2(rs.getString("addr2"));
					custom.setCuspoint(rs.getInt("cuspoint"));
					custom.setVisited(rs.getInt("visited"));
					custom.setRegdate(rs.getDate("regdate"));
					custom.setGrade(rs.getInt("grade"));
				}
			}	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, stmt, con);
		}
		return custom;
	}
	public int updateCustom(CustomVO vo) {
		int cnt = 0;
		try {
			con = DBConn.getConnection();
			String sql = "update custom set cuspw=?, cusname=?, cusemail=?, custel=?, zipcode=?, addr1=?, addr2=?, grade=? where cusid=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, vo.getCuspw());
			stmt.setString(2, vo.getCusname());
			stmt.setString(3, vo.getCusemail());
			stmt.setString(4, vo.getCustel());
			stmt.setString(5, vo.getZipcode());
			stmt.setString(6, vo.getAddr1());
			stmt.setString(7, vo.getAddr2());
			stmt.setInt(8, vo.getGrade());
			stmt.setString(9, vo.getCusid());
			cnt = stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(stmt, con);
		}
		return cnt;
	}
	public int deleteCustom(CustomVO vo) {
		int cnt=0;
		try {
			con = DBConn.getConnection();
			String sql = "delete from custom where cusid=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, vo.getCusid());
			cnt = stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(stmt, con);
		}
		return cnt;
	}
	public int addCustom(CustomVO vo) {
		int cnt = 0;
		try {
			con = DBConn.getConnection();
			String sql = "insert into custom values (?, ?, ?, ?, ?, ?, ?, ?, 1, 0, sysdate, 1)";
			//insert into custom values ('kkt09072', '4321', '김기태', 'kkt09072@naver.com', '010-1234-1234','121-10', '경기도 고양시 일산동구', '도내동 20', 1, 0, sysdate, 4);
			stmt = con.prepareStatement(sql);
			stmt.setString(1, vo.getCusid());
			stmt.setString(2, vo.getCuspw());
			stmt.setString(3, vo.getCusname());
			stmt.setString(4, vo.getCusemail());
			stmt.setString(5, vo.getCustel());
			stmt.setString(6, vo.getZipcode());
			stmt.setString(7, vo.getAddr1());
			stmt.setString(8, vo.getAddr2());
			cnt = stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(stmt, con);
		}
		return cnt;
	}
}