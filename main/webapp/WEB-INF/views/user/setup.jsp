<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="user.header.setup" /></h2>

<script>

	function checkPw() {
		var pw1 = document.getElementById('userPw').value;
		var pw2 = document.getElementById('userPwconfirm').value;
		
		if(pw1 == pw2) {
			document.getElementById('check').innerHTML='비밀번호가 일치합니다.';
			document.getElementById('check').style.color='blue';
			document.getElementById("submit").disabled = false
		}
		else {
			document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
			document.getElementById('check').style.color='red';
			document.getElementById("submit").disabled = true
		}
	}
	
</script>

<form action="/user/setup" method="post" >

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

	<div class="input_area">
		<label for="userId"><spring:message code="user.userId" /></label>
		<input type="text" id="userId" name="userId" required="required" value="admin"/>
	</div>
	
	<div class="input_area">
		<label for="userPw"><spring:message code="user.userPw" /></label>
		<input type="password" id="userPw" name="userPw" onchange="checkPw()" required="required" />
	</div>
	
	<div class="input_area">
		<label for="userPwconfirm"><spring:message code="user.userPwComfirm" /></label>
		<input type="password" id="userPwconfirm" name="userPwconfirm" onchange="checkPw()" required="required" />&nbsp;
		<br>
		<span id="check"></span>
	</div>
	
	<div class="input_area">
		<label for="userName"><spring:message code="user.userName" /></label>
		<input type="text" id="userName" name="userName" required="required" />
	</div>
	
	<div class="email_area">
		<label for="email"><spring:message code="user.email" /></label>
		<input type="email" id="email" name="email" placeholder="example@email.com" required="required" />
	</div>
	
	<div class="phone_area">
		<label for="phone"><spring:message code="user.phone" /></label>
		<input type="text" id="phone" name="phone" placeholder="01X-XXXX-XXXX" required="required" />
	</div>
	
	<button type="submit" id="register" name="register"><spring:message code="action.register" /></button>
</form>