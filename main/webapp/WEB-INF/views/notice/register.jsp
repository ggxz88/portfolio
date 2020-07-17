<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="notice.header.register" /></h2>

<form id="register" action="/notice/register" method="post" >

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

	<div class="input_area">
		<label for="title"><spring:message code="notice.title" /></label>
		<input type="text" id="title" name="title" required="required" />
	</div>
	
	<div class="input_area">
		<label for="content"><spring:message code="notice.content" /></label>
		<textarea id="content" name="content" required="required" ></textarea>
	</div>
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<button type="submit" id="register" name="register"><spring:message code="action.register" /></button>
	</sec:authorize>
</form>