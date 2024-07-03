package com.kh.homeWork.member.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.homeWork.member.model.service.MemberService;
import com.kh.homeWork.member.model.vo.Member;

@Controller
public class MemberController {
	
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("loginView.me")
	public String loginView(@ModelAttribute Member m) {
		
		
		return "login";
	}
	
	
	@RequestMapping("loginCheck.me")
	public String loginCheck(Member m, Model model, HttpSession session) {
		
		Member loginUser = mService.loginCheck(m);
		if(bcrypt.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
			session.setAttribute("loginUser", loginUser);			
			return "../../../index";				
		}else {
			model.addAttribute("msg", "로그인에 실패하였습니다."); // request.setAttribute("msg", "~~");
			return "login";
		}
	}
	
	
	@RequestMapping("admin.me")
	public String adminPage(@ModelAttribute Member m, Model model) {
		ArrayList<Member> list = mService.adminSelectMember();
		model.addAttribute("list", list);
		return "admin";

	}
	
	@RequestMapping("logout.me")
	public String logout(HttpServletRequest request) {
	    HttpSession session = request.getSession(false);
	    if (session != null) {
	        session.invalidate(); // 세션 무효화
	    }
	    return "redirect:index.jsp";
	}
	
	@RequestMapping("signUp.me")
	public String signUp() {
		return "signUp";
	}
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return null;
	}
	
	@RequestMapping("insertMember.me")
	public String insertMember(@ModelAttribute Member m,
							  @RequestParam("emailId") String emailId,
							  @RequestParam("emailDomain") String emailDomain,
							  @RequestParam("phone") String phone) {
		
		String email = null;
		if(!emailId.equals("")) {
			email = emailId + "@" + emailDomain;
		}
		m.setEmail(email);
		m.setPhone(phone.replace(",", "-"));
		m.setMemberPwd(bcrypt.encode(m.getMemberPwd()));	//암호화 시작
		int result = mService.insertMember(m);
		
		return "redirect:index.jsp";
	}
	@RequestMapping("findId.me")
	public String findId() {
		return "findId";
	}
	
	
	@RequestMapping("selectId.me")
	public String findId(@RequestParam("findName") String findName,
						 @RequestParam("findEmail") String findEmail,
						 @RequestParam("findPhone") String findPhone,
						 Member m, Model model) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("findName", findName);
		map.put("findEmail", findEmail);
		map.put("findPhone", findPhone);
		String findId = mService.selectId(map);
		model.addAttribute("findName", findName);
		model.addAttribute("findId", findId);
		model.addAttribute("type", 1);
		return "findResult";
	}
	
	@RequestMapping("findPwd.me")
	public String findPwd() {
		return "findPwd";
	}
	
	private final char[] randomString = new char[]{
		    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
		    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
		    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
		};

	public String RandomPassword(int size) {
	    StringBuilder sb = new StringBuilder();
	    Random rnd = new Random(new Date().getTime());
	    int len = randomString.length;
	    
	    for (int i = 0; i < size; i++) {
	        sb.append(randomString[rnd.nextInt(len)]);
	    }

	    return sb.toString();
	}
	
	@RequestMapping("selectPwd.me")
	public String findId(@RequestParam("findId") String findId,
						 @RequestParam("findName") String findName,
						 @RequestParam("findEmail") String findEmail,
						 @RequestParam("findPhone") String findPhone,
						 Member m, Model model) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("findId", findId);
		map.put("findName", findName);
		map.put("findEmail", findEmail);
		map.put("findPhone", findPhone);
		
		String temp = RandomPassword(10);	// 임시 비밀번호
		
		map.put("tempPwd", bcrypt.encode(temp));
		int result = mService.updateTempPwd(map); // 현재 비밀번호 임시 비밀번호로 변경
		
		model.addAttribute("findName", findName);
		model.addAttribute("tempPwd", temp);
		model.addAttribute("type", 2);
		return "findResult";
	}
	
	@RequestMapping("adminDelete.me")
	@ResponseBody
	public String adminDelete(@RequestParam("mNo") int mNo) {
		int result = mService.adminDelete(mNo);
		return result == 1? "success" : "fail";
	}
	
	@RequestMapping("adminUpdate.me")
	@ResponseBody
	public String adminUpdate(@RequestBody Member mInfo) {
		int result = mService.adminUpdate(mInfo);
		return result == 1? "success" : "fail";
	}



	
}
