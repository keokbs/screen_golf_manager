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
	<div class="d-flex justify-content-center align-items-center">
		<div class="d-flex justify-content-center align-items-center sign-in-box">
			<div class="small-box"><img src="/static/images/golf_640.png" alt="golfers" width="500px" height="500px"></div>
			<div class="small-box w-50 d-flex justify-content-center">
				<div class="sign-box bg-white">
					<div class="logo-font-style font-weight-bold d-flex justify-content-center"><div class="m-4">Screen Golf Manager</div></div>
					<div class="d-flex justify-content-center"><img src="/static/images/user.png" alt="profileImage" width="80px"></div>
					<div><input type="text" class="form-control mb-3"></div>
					<div><input type="text" class="form-control mb-1"></div>
					<div class="wraning-coment text-danger"><small>일치하는 정보가 없습니다. 다시 한번 입력해주세요.</small></div>
					<div><button class="btn btn-success w-100">로그인</button></div>
					<div class="d-flex justify-content-around">
						<div><a href="#">아이디/비밀번호 찾기</a></div>
						<div><a href="#">회원가입하기</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>