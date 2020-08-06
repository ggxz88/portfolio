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
			document.getElementById('admincheck').innerHTML='비밀번호 일치';
			document.getElementById('admincheck').style.color='blue';
			document.getElementById("submit").disabled = false
		}
		else {
			document.getElementById('admincheck').innerHTML='비밀번호 불일치';
			document.getElementById('admincheck').style.color='red';
			document.getElementById("submit").disabled = true
			document.getElementById("userPwconfirm").value = '';
			document.getElementById("userPwconfirm").focus();
		}
	}
	
</script>

<form id="userregister" action="/user/setup" method="post" >

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
		<span id="admincheck"></span>
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
	
	<button type="submit" id="submit" name="register" disabled><spring:message code="action.register" /></button>
</form>