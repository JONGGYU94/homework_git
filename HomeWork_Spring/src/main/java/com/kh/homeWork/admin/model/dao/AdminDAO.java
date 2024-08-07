package com.kh.homeWork.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.homeWork.Volunteer.model.Volunteer;
import com.kh.homeWork.board.model.vo.Board;
import com.kh.homeWork.board.model.vo.PageInfo;
import com.kh.homeWork.board.model.vo.Reply;
import com.kh.homeWork.board.model.vo.VolunteerDetail;
import com.kh.homeWork.member.model.vo.Member;
import com.kh.homeWork.surpport.model.vo.Pay;

@Repository("aDAO")
public class AdminDAO {
	
	public ArrayList<Member> adminMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.adminMemberList", null, rowBounds);
	}
	
	public ArrayList<Member> adminStatusMember(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.adminStatusMember", null, rowBounds);
	}
	
	public int adminDelete(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.update("adminMapper.adminDelete", mNo);
	}

	public int adminUpdate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("adminMapper.adminUpdate", m);
	}

	public int updateStatus(SqlSessionTemplate sqlSession, HashMap<String, String> m) {
		return sqlSession.update("adminMapper.updateStatus", m);
	}

	public int updateAdmin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("adminMapper.updateAdmin", m);
	}
	
	public ArrayList<Member> searchMember(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return (ArrayList)sqlSession.selectList("adminMapper.searchMember", map);
	}
	
	public int getListCountPay(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getListCountPay");
	}
	
	public ArrayList<Pay> adminPayList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.adminPayList", null, rowBounds);
		
	}

	public int getListCountBoard(SqlSessionTemplate sqlSession, int boardTypeNum) {
		return sqlSession.selectOne("adminMapper.getListCountBoard",boardTypeNum);
	}

	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int boardTypeNum) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectBoardList",boardTypeNum,rowBounds);
	}

	public Board selectBoardList(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("adminMapper.selectBoard",bId);
	}

	public int updateCount(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("adminMapper.updateCount",bId);
	}

	public VolunteerDetail adminBoardDetail(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("adminMapper.adminBoardDetail", bId);
	}

	public int getListCountMember(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getListCountMember");
	}

	public int adminInsertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("adminMapper.adminInsertBoard", b);
	}
	
	public int adminDeleteBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("adminMapper.adminDeleteBoard", bNo);
	}

	public Member adminSelectMember(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("adminMapper.adminSelectMember", memberNo);
	}

	public ArrayList<Pay> adminSelectPay(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.adminSelectPay", memberNo);
	}

	public int adminUpdateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("adminMapper.adminUpdateMember", m);
	}


	public ArrayList<Reply> adminSelectReply(SqlSessionTemplate sqlSession, int bId) {
		return (ArrayList)sqlSession.selectList("adminMapper.adminSelectReply", bId);
	}

	public int adminSelectBoardNoCheck(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.adminSelectBoardNoCheck");
	}

	public int adminInsertVolunteer(SqlSessionTemplate sqlSession, VolunteerDetail v) {
		return sqlSession.insert("adminMapper.adminInsertVolunteer", v);
	}

	public VolunteerDetail adminSelectVolunteerDetail(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("adminMapper.adminSelectVolunteerDetail", bId);
	}

	public int adminUpdateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("adminMapper.adminUpdateBoard", b);
	}

	public int adminUpdateVolunteerDetail(SqlSessionTemplate sqlSession, VolunteerDetail v) {
		return sqlSession.update("adminMapper.adminUpdateVolunteerDetail", v);
	}

	public int getListCountVolunteer(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getListCountVolunteer");
	}

	public int totalMember(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.totalMember");
	}

	public int activeMember(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.activeMember");
	}

	public int totalBoard(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.totalBoard");
	}

	public int domesticAmount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.domesticAmount");
	}
	
	public int globalAmount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.globalAmount");
	}

	public ArrayList<Volunteer> adminVolunteerList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.adminVolunteerList", null, rowBounds);
	}

	public int adminVolunteerUpdate(SqlSessionTemplate sqlSession, HashMap<String, Object> v) {
		return sqlSession.update("adminMapper.adminVolunteerUpdate", v);
	}

	public int volunteerApplicant(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.volunteerApplicant");
	}

	public int adminInsertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("adminMapper.adminInsertReply", r);
	}

	public int admindeleteReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("adminMapper.adminDeleteReply", r);
	}

	public int findVolunteerNo(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("adminMapper.findVolunteerNo",boardNo);
	}

	public int getListCountVolunteerY(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getListCountVolunteerY");
	}

	public ArrayList<Volunteer> adminApproveVolunteerList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.adminApproveVolunteerList", null, rowBounds);
	}

	public int getListCountVolunteerN(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getListCountVolunteerN");
	}

	public ArrayList<Volunteer> adminRafusalVolunteerList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.adminRafusalVolunteerList", null, rowBounds);
	}

	public ArrayList<Board> adminSelectVolunteer(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.adminSelectVolunteer", memberNo);
	}

	public int startVolunteer(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.startVolunteer");
	}

	public int endVolunteer(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.endVolunteer");
	}

	public int getVolunteerCount(SqlSessionTemplate sqlSession, int vNum) {
		return sqlSession.selectOne("adminGetVolunteerCount", vNum);
	}

	

	

	

	


}
