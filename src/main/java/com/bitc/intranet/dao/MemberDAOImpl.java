 package com.bitc.intranet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.stereotype.Repository;

import com.bitc.intranet.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDAOImpl implements MemberDAO {
	private final DataSource ds;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	@Override
	public int insertMember(MemberVO member) {
		int result = 0;
		try {
			conn = ds.getConnection();
			String sql = "INSERT INTO member(uid,upw,uemail,uphone,uname,udep,ujob,udate) VALUES(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(2, member.getUid());
			pstmt.setString(3, member.getUpw());
			pstmt.setString(4, member.getUemail());
			pstmt.setString(5, member.getUphone());
			pstmt.setString(6, member.getUname());
			pstmt.setString(7, member.getUdep());
			pstmt.setString(8, member.getUjob());
			pstmt.setDate(9, java.sql.Date.valueOf(java.time.LocalDate.now()));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {}
			
			try {
				if(conn != null) conn.close();
			} catch (SQLException e) {}
			
		}
		return result;
	}

	@Override
	public MemberVO readMember(String userid) {
		MemberVO member = null;
		String sql = "SELECT * FROM member WHERE uid = ? ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new MemberVO();
				member.setUno(rs.getInt(1));
				member.setUid(rs.getString(2));
				member.setUpw(rs.getString(3));
				member.setUemail(rs.getString(4));
				member.setUphone(rs.getString(5));
				member.setUname(rs.getString(6));
				member.setUdep(rs.getString(7));
				member.setUjob(rs.getString(8));
				member.setUdate(rs.getTimestamp(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
			} catch (SQLException e) {}
			
			try {
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {}
			
			try {
				if(conn != null) conn.close();
			} catch (SQLException e) {}
		}
		return member;
	}

	@Override
	public MemberVO readMemberWithPass(String userid, String userpw) {
		return null;
	}

	@Override
	public List<MemberVO> readMemberList() {
		return null;
	}

	@Override
	public int updateMember(MemberVO member) {
		
//		String sql = "UPDATE member set upw = ?, uemail = ?, uphone = ?, uname = ? where uid = ?";
//		
//		try {
//			conn = ds.getConnection();
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//		} catch (SQLException e) {
//			pstmt.setString(3, member.getUpw());
//			pstmt.setString(4, member.getUemail());
//			pstmt.setString(5, member.getUphone());
//			pstmt.setString(6, member.getUname());
//		}finally {
//			try {
//				if(rs != null) rs.close();
//			} catch (SQLException e) {}
//			
//			try {
//				if(pstmt != null) pstmt.close();
//			} catch (SQLException e) {}
//			
//			try {
//				if(conn != null) conn.close();
//			} catch (SQLException e) {}
//		}
//		return member;
		return 0;
		}

	@Override
	public int removeMember(int uno) {
		return 0;
	}

}
