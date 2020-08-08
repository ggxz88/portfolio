<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="user.header.modifypw" /></h2>

<form id="userregister" action="/user/modifyPw" method="post" >

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

	<div class="input_area">
		<label for="newPw"><spring:message code="user.newpass" /></label>
		<input type="password" id="newPw" name="newPw" onchange="checkPw()" required="required" />
	</div>
	
	<div class="input_area">
		<label for="newPwconfirm"><spring:message code="user.userPwComfirm" /></label>
		<input type="password" id="newPwconfirm" name="newPwconfirm" onchange="checkPw()" required="required" />&nbsp;
		<br>
		<span id="newcheck"></span>
	</div>
	
	<br>
	<button type="submit" id="submit" name="register" disabled><spring:message code="action.edit" /></button>
	
</form>


<script>
	
	function checkPw() {
		var pw1 = document.getElementById('newPw').value;
		var pw2 = document.getElementById('newPwconfirm').value;
		
		if(pw1 == pw2) {
			document.getElementById('newcheck').innerHTML='비밀번호 일치';
			document.getElementById('newcheck').style.color='blue';
			document.getElementById("submit").disabled = false
		}
		else {
			document.getElementById('newcheck').innerHTML='비밀번호 불일치';
			document.getElementById('newcheck').style.color='red';
			document.getElementById("submit").disabled = true
			document.getElementById("newPwconfirm").value = '';
			document.getElementById("newPwconfirm").focus();
		}
	}
	
</script>