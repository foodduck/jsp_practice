package com.shop.test;
import java.sql.*;

import com.shop.model.DBConn;
public class DBTest1 {		//DBTestCase
	private static Connection con = null;
	private static PreparedStatement stmt = null;
	private static ResultSet rs = null;
	public static void main(String[] args) {
		try {
			con = DBConn.getConnection();
			String sql = "select * from paytype";
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				System.out.println("결제방식 코드 : "+rs.getInt("paymethod")+", 결제방식 : "+rs.getString("paytype")+", 결제 기관 : "+rs.getString("acccomp"));
			}
			DBConn.close(rs, stmt, con);
		} catch(Exception e ) {
			e.printStackTrace();
		}
	}
}