package com.sgm.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	
	@RequestMapping("/test1")
	@ResponseBody
	public String helloworld() {
		return "Hello world!";
	}
	
}