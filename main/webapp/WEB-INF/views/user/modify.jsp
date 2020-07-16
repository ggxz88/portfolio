<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="user.header.modify" /></h2>

<form action="/user/modify" method="post">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

	<div class="input_area">
		<!--<spring:message code="user.userId" /> -->
		<label for="userId"><spring:message code="user.userId" /></label>
		<input type="text" id="userId" name="userId" value="${member.userId}" required="required" readonly />
	</div>
	
	<div class="input_area">
		<label for="userName"><spring:message code="user.userName" /></label>
		<input type="text" id="userName" name="userName" value="${member.userName}" required="required"  />
	</div>
	
	<div class="input_area">
		<label for="email"><spring:message code="user.email" /></label>
		<input type="email" id="email" name="email" value="${member.email}" required="required"  />
	</div>
	
	<div class="input_area">
		<label for="phone"><spring:message code="user.phone" /></label>
		<input type="text" id="phone" name="phone" value="${member.phone}" required="required"  />
	</div>

	<div>
		<button type="submit" id="modify" name="modify"><spring:message code="action.modify" /></button>
		<a href="list"><input type="button" value="<spring:message code="action.list" />"></a>
	</div>
	
</form>