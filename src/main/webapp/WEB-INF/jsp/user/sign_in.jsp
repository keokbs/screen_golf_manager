<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScreenGolfManager</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<%-- AJAX를 사용하려면 더 많은 함수가 있는 js를 포함해야 한다. --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/static/css/userStyle.css">
</head>
<body>
	<div id="sign-in-bg">
		<div class="d-flex justify-content-center align-items-center">
			<div class="d-flex justify-content-center align-items-center sign-box">
				<div class="small-box"><img src="/static/images/golf_640.png" alt="golfers" width="500px" height="500px"></div>
				<div class="small-box w-50 d-flex justify-content-center">
					<div class="sign-in-box bg-white d-flex align-items-center justify-content-center">
						<div class="pb-5">
							<form id="loginForm" method="post" action="/user/sign_in">
								<div class="logo-font-style font-weight-bold d-flex justify-content-center"><div class="mb-3">Screen Golf Manager</div></div>
								<div class="d-flex justify-content-center"><img src="/static/images/user.png" alt="profileImage" width="80px"></div>
								<div class="d-flex justify-content-center">
									<div class="mt-3 login-box">
										<div class="d-flex justify-content-center"><input type="text" class="form-control mb-2 input-size-id" placeholder="아이디" name="loginId" id="loginId"></div>
										<div class="d-flex justify-content-center"><input type="password" class="form-control input-size-id" placeholder="비밀번호" name="password" id="password"></div>
									</div>
								</div>
								<div class="d-flex justify-content-center mt-2">
									<div class="invisible-box d-flex align-items-center">
										<div class="text-danger wraning-coment d-none" id="checkID">아이디를 입력해주세요.</div>
										<div class="text-danger wraning-coment d-none" id="checkIDLength">아이디는 4 ~ 20자만 가능합니다.</div>
										<div class="text-danger wraning-coment d-none" id="checkPassword">비밀번호를 입력해주세요.</div>
										<div class="text-danger wraning-coment d-none" id="noInfomation">일치하는 아이디 또는 비밀번호가 없습니다.</div>
									</div>
								</div>
								<div class="d-flex justify-content-center">
									<div class="login-btn-size">
										<button class="btn btn-success w-100" id="login-btn">로그인</button>
									</div>
								</div>
							</form>
							<div class="d-flex justify-content-center mt-2">
								<div class="d-flex justify-content-between input-size-id">
									<div><a href="/user/find_id_password_view" class="sign-a-font-size">아이디/비밀번호 찾기</a></div>
									<div><a href="/user/sign_up_view" class="sign-a-font-size">회원가입하기</a></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
$(document).ready(function() {
	// alert("ok?");
	
	$("#loginForm").on('submit', function(e) {
		e.preventDefault();
		
		let loginId = $("#loginId").val().trim();
		let password = $("#password").val().trim();
		
		$('#checkID').addClass("d-none");
		$('#checkIDLength').addClass("d-none");
		$('#checkPassword').addClass("d-none");
		$('#noInfomation').addClass("d-none");
		
		// 아이디 빈칸 확인
		if (loginId == '') {
			$('#checkID').removeClass("d-none");
			return;
		}
		
		// 아이디 길이 확인 (4자에서 20자)
		if (loginId.length < 4 || loginId.length >20) {
			$('#checkIDLength').removeClass("d-none");
			return;
		}
		
		// 비밀번호 빈칸 확인
		if (password == '') {
			$('#checkPassword').removeClass("d-none");
			return;
		}
		
		// 받은 아이디와 비밀번호를 대조해서 없는 정보일 경우 아이디와 비번의 값을 빈칸으로 만든다.
		let url = $(this).attr("action");
		// ajax에서 각각의 name을 쓰지않고 묶어서 전송
		let params = $(this).serialize();
		
		$.post(url, params)
		.done(function(data) {
			if(data.result == "success") {
				location.href="/booking/main_view"
			}
			
			if(data.result == "error") {
				$('#noInfomation').removeClass("d-none");
				loginId = $("#loginId").val("");
				password = $("#password").val("");
				return;
			}
		});
		
		
	});
	
});
</script>



</html>