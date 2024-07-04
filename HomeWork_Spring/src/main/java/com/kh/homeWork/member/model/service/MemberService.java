package com.kh.homeWork.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.homeWork.member.model.vo.Member;

public interface MemberService{

	Member loginCheck(Member m);

	int insertMember(Member m);

	String selectId(HashMap<String, String> map);

	int updateTempPwd(HashMap<String, String> map);

	ArrayList<Member> adminSelectMember();

	int adminDelete(int mNo);

	int adminUpdate(Member m);

	ArrayList<Member> searchMember(HashMap<String, String> map);

	int updateStatus(Member m);



}
