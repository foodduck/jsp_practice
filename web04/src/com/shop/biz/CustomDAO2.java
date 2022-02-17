package com.shop.biz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import com.shop.model.CustomVO;
import com.shop.model.DBConn;

//배치(batch) 프로그래밍 : 한 곳에서 일을 한꺼번에 처리하기 위한 프로그래밍 
//Custom 테이블에 접근하여 데이터 처리요청되어 온 일들을 모두 한 곳에서 처리하기 위한 모듈  
//getCustom(vo) : 로그인 정보(id, pw)를 Ctrl로 부터 vo로 받아  고객(custom) 테이블에서 조회하여 조회된 결과를 Ctrl로 리턴
public class CustomDAO2 {
	private Connection con = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	public CustomVO getCustom(CustomVO vo) {
		CustomVO custom = null;
		try {
			con = DBConn.getConnection();
			String	sql = "select * from custom where cusid = ? and cuspw = ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, vo.getCusid());
			stmt.setString(2, vo.getCuspw());
			rs = stmt.executeQuery();
			custom = new CustomVO();
			if(rs.next()) {				
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
			} else {
				custom.setGrade(8);
				System.out.println("회원이 아닙니다.");
			}	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, stmt, con);
		}
		return custom;
	}
	
	public CustomVO myPage(CustomVO vo) {
		CustomVO custom = null;
		try {
			con = DBConn.getConnection();
			String sql = "select * from custom where cusid = ?";
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
			String sql = "insert into custom values (?, ?, ?, ?, ?, ?, ?, ?, 1, 0, sysdate, 4)";
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
	public int dupCheck(CustomVO vo) {
		int cnt = 0;
		try {
			con = DBConn.getConnection();
			String sql = "select * from custom where cusid = ?";
			System.out.println("입력한 아이디 : "+vo.getCusid());
			stmt = con.prepareStatement(sql);
			stmt.setString(1, vo.getCusid());
			rs = stmt.executeQuery();
			if(rs.next()) {
				cnt = 1;		//사용이 불가능한 아이디
			} else {
				cnt = 0;		//사용이 가능한 아이디
			}
		} catch(Exception e) {
			System.out.println("데이터를 비교하지 못했습니다.");
			e.printStackTrace();
		}
		return cnt;
	}
}