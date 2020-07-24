<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="user.header.register" /></h2>

<form id="userread" action="/user/userremove" method="post" >

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

	<div class="input_area">
		<label for="userId"><spring:message code="user.userId" /></label>
		<input type="text" id="userId" name="userId" required="required" />
	</div>
	
	<div class="input_area">
		<label for="userPw"><spring:message code="user.userPw" /></label>
		<input type="password" id="userPw" name="userPw" required="required" />
	</div>
	<div>
		<button type="submit" id="submit"><spring:message code="user.withdraw" /></button>
	</div>
	
</form>

<c:if test="${msg == false}">
	<p>
		비밀번호를 다시 입력해주세요.
	</p>
</c:if>