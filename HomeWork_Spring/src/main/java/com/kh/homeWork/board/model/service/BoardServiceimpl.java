package com.kh.homeWork.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.homeWork.board.model.dao.BoardDAO;
import com.kh.homeWork.board.model.vo.Board;
import com.kh.homeWork.board.model.vo.PageInfo;
import com.kh.homeWork.board.model.vo.Reply;
import com.kh.homeWork.board.model.vo.VolunteerDetail;

@Service("bService")
public class BoardServiceimpl implements BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession; // 프레임워크가 객체를 만들어준거기 떄문에 어노테이션으로 연결해준다.
	
	@Autowired
	private BoardDAO bDAO;
	
	@Override
	public int getListCount(int i) {
		return bDAO.getListCount(sqlSession,i);
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi, int boardTypeNum) {
		return bDAO.selectBoardList(sqlSession,pi,boardTypeNum);
	}

	@Override
	public Board selectBoard(int bId, int memberNo) {
		Board b = bDAO.selectBoardList(sqlSession, bId);
		
		if(b != null) {
			if(memberNo != 0 && b.getMemberNo() != memberNo) {
				int result = bDAO.updateCount(sqlSession,bId);
				if(result>0) {
					b.setBoardCount(b.getBoardCount()+1);
				}
			}
		}
		return b;
	}

	@Override
	public int insertBoard(Board b) {
		return bDAO.insertBoard(sqlSession, b);
	}

	@Override
	public int insertVolunteer(VolunteerDetail v) {
		return bDAO.insertVolunteer(sqlSession,v);
	}

	@Override
	public int selectBoardNoCheck() {
		return bDAO.selectBoardNoCheck(sqlSession);
	}

	@Override
	public VolunteerDetail selectVolunteerDetail(int bId) {
		return bDAO.selectVolunteerDetail(sqlSession,bId);
	}

	@Override
	public int updateBoard(Board b) {
		return bDAO.updateBoard(sqlSession,b);
	}

	@Override
	public int updateVolunteerDetail(VolunteerDetail v) {
		return bDAO.updateVolunteerDetail(sqlSession,v);
	}

	@Override
	public int deleteBoard(int bNo) {
		return bDAO.deleteBoard(sqlSession,bNo);
	}

	@Override
	public int insertReply(Reply r) {
		return bDAO.insertReply(sqlSession,r);
	}

	@Override
	public ArrayList<Reply> selectReply(int bId) {
		return bDAO.selectReply(sqlSession,bId);
	}

	@Override
	public int updateReply(Reply r) {
		return bDAO.updateReply(sqlSession,r);
	}

	@Override
	public Reply selectOneReply(Reply r) {
		return bDAO.selectOneReply(sqlSession,r);
	}

	@Override
	public int deleteReply(Reply r) {
		return bDAO.deleteReply(sqlSession,r);
	}
	public ArrayList<Board> regionBoardList(String region,PageInfo pi) {
		return bDAO.regionBoardList(sqlSession,region,pi);
	}


	@Override
	public int getRegionListCount(String region) {
		return bDAO.getRegionListCount(sqlSession,region);
	}

	@Override
	public ArrayList<Board> selectBoardListCheckApply(PageInfo pi, int boardTypeNum) {
		return bDAO.selectBoardListCheckApply(sqlSession,pi,boardTypeNum);
	}

	@Override
	public int getListCountCheckApply(int boardTypeNum) {
		return bDAO.getListCountCheckApply(sqlSession,boardTypeNum);
	}

	@Override
	public ArrayList<Board> regionBoardListCheckApply(String region, PageInfo pi2) {
		return bDAO.regionBoardListCheckApply(sqlSession,region,pi2);
	}

	@Override
	public int getRegionListCountCheckApply(String region) {
		return bDAO.getRegionListCountCheckApply(sqlSession,region);
	}


}
