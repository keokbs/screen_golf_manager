package com.sgm.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sgm.common.EncryptUtils;
import com.sgm.user.bo.UserBO;
import com.sgm.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@RequestMapping("/user_db_test")
	public List<User> getUserList() {
		List<User> user = userBO.getUserList();
		return user;
	}
	
	@PostMapping("/sign_in")
	public Map<String, Object> sign_in(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request 
			) {
		
		// 비밀번호 암호화
		String EncryptPassword = EncryptUtils.md5(password);
		
		// db 검색
		User user = userBO.getUserByLoginIdPassword(loginId, EncryptPassword);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userID", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userStoreName", user.getStoreName());
			session.setAttribute("userName", user.getName());
			session.setMaxInactiveInterval(60*120) ;

		} else {
			result.put("result", "error");
			result.put("errorMessage", "존재하지 않는 사용자 입니다.");
		}
		
		return result; 
	}
}
