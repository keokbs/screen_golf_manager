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
	<div id="sign-up-bg" class="d-flex justify-content-center align-items-center">
		<div class="sign-up-box bg-white">
			<div class="sign-up-head-font font-weight-bold d-flex justify-content-center align-items-center mb-2 mt-1">
				<div>회원가입</div>
			</div>
			<div class="d-flex justify-content-center align-items-center">
				<div class="input-box input-box-font">
			<!-- form -->		
					<form method="post" action="/user/sign_up" id="signUpForm">
						<!-- 아이디 -->
						<div class="mb-2 d-flex justify-content-between">
							<div>아이디*</div>
							<div class="small text-danger d-none" id="duplicateLoginId">중복된 아이디입니다.</div>
							<div class="small text-danger d-none" id="loginIdLengthCheck">4~20자만 가능합니다.</div>
							<div class="small text-success d-none" id="availableLoginId">사용 가능한 아이디 입니다.</div>
						</div>
						<div class="d-flex justify-content-between">
							<input type="text" class="form-control col-9" placeholder="4~20자만 가능합니다." name="loginId" id="loginId">
							<button type="button" class="btn" id="duplicateBtn">중복확인</button>
						</div>
						
						<!-- 이름 -->
						<div class="my-2">이름*</div>
						<input type="text" class="form-control" name="name" id="name">
						
						<!-- 비번 -->
						<div class="my-2 d-flex justify-content-between">
							<div>비밀번호*</div>
							<div class="small text-danger d-none" id="passwordLengthCheck">4~20자만 가능합니다.</div>
						</div>
						<div class="d-flex justify-content-between">
							<input type="password" class="form-control" placeholder="비밀번호는 4자 이상만 가능합니다." name="password" id="password">
						</div>
						
						<!-- 비번확인 -->
						<div class="my-2 d-flex justify-content-between">
							<div>비밀번호 확인*</div>
							<div class="small text-danger d-none" id="doNotMatch">일치하지 않습니다.</div>
						</div>
						<div class="d-flex justify-content-between">
							<input type="password" class="form-control" name="passwordCheck" id="passwordCheck">
						</div>
						
						<!-- 핸드폰 번호 -->
						<div class="my-2 d-flex justify-content-between">
							<div>핸드폰 번호* <small>(-)을 제외하고 적어주세요.</small></div>
						</div>
						<div class="d-flex justify-content-between">
							<input type="text" class="form-control" placeholder="예시) 01012345678" name="phoneNumber" id="phoneNumber"  maxlength="11">
						</div>
						
						<!-- 골프장 이름 -->
						<div class="my-2">
							<div>스크린 골프장 이름*</div>
						</div>
						<div class="d-flex justify-content-between">
							<input type="text" class="form-control" name="storeName" id="storeName">
						</div>
						<div class="invisible-box">
						</div>
						<hr>
						<!-- 로그인, 회원가입 버튼 -->
						<div class="d-flex justify-content-between align-items-center pb-2">
							<button type="button" class="btn btn-white font-weight-bold" id="sign-in-btn">로그인 화면</button>
							<button type="submit" class="btn btn-white font-weight-bold" id="sign-up-btn">회원가입</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script>

$(document).ready(function(e) {
	
	// 중복확인 버튼
	$('#duplicateBtn').on('click', function(e) {
		
		let loginId = $('#loginId').val().trim();
		// alert(loginId);
		
		$('#duplicateLoginId').addClass('d-none');
		$('#loginIdLengthCheck').addClass('d-none');
		$('#availableLoginId').addClass('d-none');
		
		if (loginId == "") {
			alert("아이디를 입력해주세요.");
			return;
		}
		
		$.ajax ({
			type : 'GET'
			, url: "/user/is_duplicated_id"
			, data: {"loginId": loginId}
			, success: function(data) {
				if (data.result == "success") {
					// 중복
					$('#duplicateLoginId').removeClass('d-none');
				} else {
					// 중복 X -> 사용가능
					$('#availableLoginId').removeClass('d-none');
				}
			}
			, error: function(e) {
				// 에러
				alert("중복확인에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
	
	// 비밀번호 확인 
	
	$('#password').on('keyup', function(e) {
		
		let password = $('#password').val().trim();
		let passwordCheck = $('#passwordCheck').val().trim();
		
		$('#passwordLengthCheck').addClass('d-none');
		$('#doNotMatch').addClass('d-none');
		
		if (password.length>20 || password.length<4) {
			$('#passwordLengthCheck').removeClass('d-none');
			return;
		}
		
		if (password != passwordCheck && passwordCheck != '') {
			$('#doNotMatch').removeClass('d-none');
			return;
		}

	});
	
	// 비밀번호 확인
	$('#passwordCheck').on('keyup', function(e) {
		
		let password = $('#password').val().trim();
		let passwordCheck = $('#passwordCheck').val().trim();
		
		$('#passwordLengthCheck').addClass('d-none');
		$('#doNotMatch').addClass('d-none');

		if (password != passwordCheck && passwordCheck != '') {
			$('#doNotMatch').removeClass('d-none');
			return;
		}

	});
	
	// 전화번호 양식 - 숫자만 나오게하기
	$('#phoneNumber').on('keyup', function () {
	    $(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
	
	// 회원가입 
	$('#signUpForm').on('submit', function(e) {
		e.preventDefault();
		
		let loginId = $('#loginId').val().trim();
		let name = $('#name').val().trim();
		let password = $('#password').val().trim();
		let passwordCheck = $('#passwordCheck').val().trim();
		let phoneNumber = $('#phoneNumber').val().trim();
		let storeName = $('#storeName').val();
		
		// 경고 멘트 가리기
		$('#phoneNumberCheck').addClass('d-none');
		$('#signUpCheck').addClass('d-none');
		
		// 유효성 검사
		if (loginId == "") {
			alert("아이디를 입력해주세요.");
			return;
		}
		
		if ($('#availableLoginId').hasClass('d-none')) { // 사용가능한 아이디라고 떠있지 않았을 때
			alert("아이디 중복확인이 필요합니다.");
			return;
		}
		
		if (name == "") {
			alert("이름을 입력해주세요.");
			return;
		}
		
		if (password == "" || passwordCheck == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		if (!$('#passwordLengthCheck').hasClass('d-none')) { // 비밀번호 길이 경고문구가 떠있을 때
			alert("비밀번호의 양식이 올바르지 않습니다.");
			return;
		}
		
		if (!$('#doNotMatch').hasClass('d-none')) { // 비밀번호가 일치하지 않는다고 떠있을 때
			alert("비밀번호가 일치하지않습니다.");
			return;
		}
		
		if (phoneNumber == "") {
			alert("핸드폰 번호를 입력해주세요.");
			return;
		}
		
		if (storeName == "") {
			alert("가게 이름을 입력해주세요.");
			return;
		}
		
		let url = $(this).attr('action');
		let params = $(this).serialize();
		console.log(params);
		
		$.post(url, params)
		.done(function(data) {
			if(data.result == "success") {
				alert(name + "님의 회원가입을 환영합니다.");
				location.href="/user/sign_in_view";
			} else {
				alert("회원가입에 실패했습니다. 관리자에게 문의해주세요.");
				return;
			}
		});
		
	});
	
	// 로그인 화면
	$('#sign-in-btn').on('click', function(e) {
		location.href = "/user/sign_in_view";
	});
	
});

</script>



</html>