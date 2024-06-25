package com.kh.homeWork.boardController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	
	@RequestMapping("korMap.bo")
	public String korMap() {
		return "korMap";
	}
}
