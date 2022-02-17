package com.shop.biz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.shop.model.CustomVO;
import com.shop.model.DBConn;

public class CustomDAO2 {
	private Connection con = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	private int res = 0;
	
	public int getIdCheck(CustomVO vo) {
		try {
			con = DBConn.getConnection();
			String	sql = "select * from mem where userid=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, vo.getCusid());
			rs = stmt.executeQuery();
			if(rs.next()) {				
				res = 0;
			} else {
				res = 1;
			}	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, stmt, con);
		}
		return res;
	}
}