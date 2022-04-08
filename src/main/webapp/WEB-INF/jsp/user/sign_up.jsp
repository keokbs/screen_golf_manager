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
					<form method="post" action="/user/sign_up" id="signUpForm">
						<!-- 아이디 -->
						<div class="mb-2 d-flex justify-content-between">
							<div>아이디*</div>
							<div class="small text-danger d-none" id="duplicateLoginId">중복된 아이디입니다.</div>
							<div class="small text-danger d-none" id="loginIdLengthCheck">4~20자만 가능합니다.</div>
							<div class="small text-success d-none" id="availableLoginId">사용 가능한 아이디 입니다.</div>
						</div>
						<div class="d-flex justify-content-between">
							<input type="text" class="form-control col-9" placeholder="4~20자만 가능합니다." name="loginId">
							<button type="button" class="btn">중복확인</button>
						</div>
						<!-- 이름 -->
						<div class="my-2">이름*</div>
						<input type="text" class="form-control" name="name">
						<!-- 비번 -->
						<div class="my-2 d-flex justify-content-between">
							<div>비밀번호*</div>
							<div class="small text-danger d-none" id="passwordLengthCheck">4~20자만 가능합니다.</div>
						</div>
						<div class="d-flex justify-content-between">
							<input type="text" class="form-control" placeholder="비밀번호는 4자 이상만 가능합니다." name="password">
						</div>
						<!-- 비번확인 -->
						<div class="my-2 d-flex justify-content-between">
							<div>비밀번호 확인*</div>
							<div class="small text-danger d-none" id="passwordLengthCheck">일치하지 않습니다.</div>
						</div>
						<div class="d-flex justify-content-between">
							<input type="text" class="form-control" name="passwordCheck">
						</div>
						<!-- 전화번호 -->
						<div class="my-2 d-flex justify-content-between">
							<div>전화번호* (-)을 제외하고 적어주세요.</div>
							<div class="small text-danger d-none" id="passwordLengthCheck">일치하지 않습니다.</div>
						</div>
						<div class="d-flex justify-content-between">
							<input type="text" class="form-control" placeholder="예시) 01012345678" name="phoneNumber">
						</div>
						<!-- 골프장 이름 -->
						<div class="my-2">
							<div>스크린 골프장 이름*</div>
						</div>
						<div class="d-flex justify-content-between">
							<input type="text" class="form-control" name="storeName">
						</div>
						<div class="invisible-box">
							<div class="small text-danger mt-1 d-none" id="signUpCheck">양식에 맞게 작성해주세요.</div>
						</div>
						<hr>
						<div class="d-flex justify-content-between align-items-center pb-2">
							<button type="button" class="btn btn-white font-weight-bold" id="sign-in-btn">로그인 화면</button>
							<button type="button" class="btn btn-white font-weight-bold" id="sign-up-btn">회원가입</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>