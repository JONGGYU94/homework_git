package com.kh.homeWork.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.homeWork.board.model.vo.Board;
import com.kh.homeWork.board.model.vo.PageInfo;
import com.kh.homeWork.board.model.vo.Reply;
import com.kh.homeWork.board.model.vo.VolunteerDetail;

@Repository("bDAO")
public class BoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("boardMapper.getListCount",i);
	}

	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int boardTypeNum) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardList",boardTypeNum,rowBounds);
	}

	public Board selectBoardList(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("boardMapper.selectBoard",bId);
	}

	public int updateCount(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("boardMapper.updateCount",bId);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard",b);
	}

	public int insertVolunteer(SqlSessionTemplate sqlSession, VolunteerDetail v) {
		return sqlSession.insert("boardMapper.insertVolunteer",v);
	}

	public int selectBoardNoCheck(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectBoardNoCheck");
	}

	public VolunteerDetail selectVolunteerDetail(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("boardMapper.selectVolunteerDetail",bId);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard",b);
	}

	public int updateVolunteerDetail(SqlSessionTemplate sqlSession, VolunteerDetail v) {
		return sqlSession.update("boardMapper.updateVolunteerDetail",v);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("boardMapper.deleteBoard",bNo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply",r);
	}

	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int bId) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReply",bId);
	}

	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("boardMapper.updateReply",r);
	}

	public Reply selectOneReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.selectOne("boardMapper.selectOneReply",r);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("boardMapper.deleteReply",r);
	}
	public ArrayList<Board> regionBoardList(SqlSessionTemplate sqlSession, String region,PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.regionBoardList",region,rowBounds);
	}

	public int getRegionListCount(SqlSessionTemplate sqlSession, String region) {
		return sqlSession.selectOne("boardMapper.getRegionListCount",region);
	}

	public ArrayList<Board> selectBoardListCheckApply(SqlSessionTemplate sqlSession, PageInfo pi, int boardTypeNum) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardListCheckApply",boardTypeNum,rowBounds);
	}

	public int getListCountCheckApply(SqlSessionTemplate sqlSession, int boardTypeNum) {
		return sqlSession.selectOne("boardMapper.getListCountCheckApply",boardTypeNum);
	}

	public ArrayList<Board> regionBoardListCheckApply(SqlSessionTemplate sqlSession, String region, PageInfo pi2) {
		int offset = (pi2.getCurrentPage() - 1) * pi2.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi2.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.regionBoardListCheckApply",region,rowBounds);
	}

	public int getRegionListCountCheckApply(SqlSessionTemplate sqlSession, String region) {
		return sqlSession.selectOne("boardMapper.getRegionListCountCheckApply",region);
	}


}
