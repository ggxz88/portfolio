<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="board.header.register" /></h2>

<form id="register" action="/board/register" method="post" >

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

	<div class="input_area">
		<label for="title"><spring:message code="board.title" /></label>
		<input type="text" id="title" name="title" required="required" />
	</div>
	
	<div class="input_area">
		<label for="writer"><spring:message code="board.writer" /></label>
		<input type="text" id="writer" name="writer" value="${board.writer}" required="required" readonly />
	</div>
	
	<div class="input_area">
		<label for="content"><spring:message code="board.content" /></label>
		<textarea id="content" name="content" required="required" ></textarea>
	</div>
	
	<sec:authorize access="isAuthenticated()">
		<button type="submit" id="register" name="register"><spring:message code="action.register" /></button>
	</sec:authorize>
</form>