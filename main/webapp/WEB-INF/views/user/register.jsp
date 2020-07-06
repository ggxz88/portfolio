<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2></h2>

<script>
	function checkPw() {
		var pw1 = document.getElementById('userPw').value;
		var pw2 = document.getElementById('userPwconfirm').value;
		
		if(pw1 == pw2) {
			document.getElementById('check').innerHTML='비밀번호가 일치합니다.';
			document.getElementById('check').style.color='blue';
		}
		else {
			document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
			document.getElementById('check').style.color='red';
		}
	}
	
</script>

<form id="register" action="/user/register" method="post" >

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

	<div class="input_area">
		<label for="userId">아이디</label>
		<input type="text" id="userId" name="userId" required="required" />
	</div>
	
	<div class="input_area">
		<label for="userPw">비밀번호</label>
		<input type="password" id="userPw" name="userPw" onchange="checkPw()" required="required" />
	</div>
	
	<div class="input_area">
		<label for="userPwconfirm">비밀번호 확인</label>
		<input type="password" id="userPwconfirm" name="userPwconfirm" onchange="checkPw()" required="required" />&nbsp;<span id="check"></span>
	</div>
	
	<div class="input_area">
		<label for="userName">닉네임</label>
		<input type="text" id="userName" name="userName" required="required" />
	</div>
	
	<div class="input_area">
		<label for="email">이메일</label>
		<input type="email" id="email" name="email" placeholder="example@email.com" required="required" />
	</div>
	
	<div class="input_area">
		<label for="phone">연락처</label>
		<input type="text" id="phone" name="phone" placeholder="01X-XXXX-XXXX" required="required" />
	</div>
	
	<button type="submit" id="register" name="register">회원가입</button>
</form>