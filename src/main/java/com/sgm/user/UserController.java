package com.sgm.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sgm.user.bo.UserBO;
import com.sgm.user.model.User;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserBO userBO;
	
	@RequestMapping("/user_db_test")
	@ResponseBody
	public List<User> getUserList() {
		List<User> user = userBO.getUserList();
		return user;
	}
	
	@RequestMapping("sign_in_view")
	public String sign_in_view() {
		
		return "user/sign_in";
	}
}
