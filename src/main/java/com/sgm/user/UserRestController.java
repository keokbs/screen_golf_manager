package com.sgm.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
			session.setMaxInactiveInterval(60*120);

		} else {
			result.put("result", "error");
			result.put("errorMessage", "존재하지 않는 사용자 입니다.");
		}
		
		return result; 
	}
	
	@GetMapping("/is_duplicated_id")
	public Map<String, Object> is_duplicated_id(
			@RequestParam String loginId) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		User user = userBO.getUserByLoginId(loginId);
		
		if (user == null) { // 중복이 없다면
			result.put("result", "error");
		}
		
		return result;
	}
	
	@PostMapping("/sign_up")
	public Map<String, Object> sign_up(
			@RequestParam("loginId") String loginId,
			@RequestParam("name") String name,
			@RequestParam("password") String password,
			@RequestParam("phoneNumber") int phoneNumber,
			@RequestParam("storeName") String storeName
			) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// 비밀번호 암호화
		String EncryptPassword = EncryptUtils.md5(password);
		
		// 정보 db에 담기
		int rowCount = userBO.addUser(loginId, name, EncryptPassword, phoneNumber, storeName); // bo
		
		// DB에 insert 안댈 시 countRow = 0
		if (rowCount == 0) {
			result.put("result", "error");
		}
		
		return result;
	}
	
}
