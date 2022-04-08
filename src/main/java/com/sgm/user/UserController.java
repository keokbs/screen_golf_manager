package com.sgm.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping("/sign_in_view")
	public String sign_in_view() {
		
		return "user/sign_in";
	}
	
	@RequestMapping("/find_id_password_view")
	public String find_id_password_view() {
		
		return "user/find_id_password";
	}
	
	@RequestMapping("/sign_up_view")
	public String sign_up_view() {
		
		return "user/sign_up";
	}
	
}
