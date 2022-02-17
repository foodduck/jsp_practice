package com.shop.test;
//build path
//-> ojdbc6.jar  	jar추가
//-> JUnit4		라이브러리로 추가
//
//해당 패키지에서 [New]-[Other]-[Java]-[JUnit]-[Junit Test Case]
//
//@Before Class : 클래스 로딩시 준비할 내용
//@Before : 실행 전 준비해야할 내용 
//@Test	: 실제 테스트 케이스 (단, 테스트 케이스가 여러 개 일 경우, 메서드 이름을 중복되지 않게 하면 됨)
//@After : 실행 후 해야할 내용
//@After Class : 클래스 언로딩시 해야할 내용
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.shop.biz.InformDAO;
import com.shop.model.DBConn;
import com.shop.model.InformVO;

public class UnitTest1 {
	private static InformDAO dao;
	private static InformVO vo;
	private Connection con =null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {		//1
		dao = new InformDAO();
		System.out.println("DAO 생성 성공");
	}

	@Before
	public void setUp() throws Exception {	//2
		vo = new InformVO();
		System.out.println("VO 생성 성공");
	}

	@After
	public void tearDown() throws Exception {	//5
		DBConn.close(rs, stmt, con);
		System.out.println("DB 닫기 성공");
	}

	@Test
	public void test1() {			//3 - voTest
		String title = "VO에 대한 JUnit Test";
		vo.setTitle(title);
		System.out.println(vo.getTitle());
		System.out.println("VO TEST 성공");
	}
	
	@Test
	public void test2() {		//4
		ArrayList<InformVO> informList = dao.getInformList();		//Ctrl
		for(int i=0;i<informList.size();i++) {		//jsp 파일
			vo = informList.get(i);
			System.out.println(vo.getTitle());
		}	
	}
}
