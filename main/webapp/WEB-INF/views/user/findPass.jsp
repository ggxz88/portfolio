<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="user.header.findpw" /></h2>

<form id="userregister" action="/email/pass" method="post" >

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

	<div class="input_area">
		<label for="userId"><spring:message code="user.userId" /></label>
		<input type="text" id="userId" name="userId" required="required" />
	</div>
	
	<div class="input_area">
		<label for="email"><spring:message code="user.email" /></label>
		<input type="email" id="email" name="email" placeholder="example@email.com" required="required" />
	</div>
	
	<br>
	<button type="submit" id="submit" name="register"><spring:message code="action.send" /></button>
	
</form>
