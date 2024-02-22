package com.bitc.intranet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitc.intranet.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDAOImpl implements MemberDAO {

	
	@Override
	public int insertMember(MemberVO member) {
		return 0;
	}

	@Override
	public MemberVO readMember(String uId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO readMemberWithPass(String uId, String uPw) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVO> readMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMember(MemberVO member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeMember(int uNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
