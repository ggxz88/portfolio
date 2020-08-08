<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="user.header.read" /></h2>

<form id="userread" action="/user/read">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

	<div class="input_area">
		<label for="userId"><spring:message code="user.userId" /></label>
		<input type="text" id="userId" name="userId" value="${member.userId}" required="required" readonly />
	</div>
	
	<div class="input_area">
		<label for="userName"><spring:message code="user.userName" /></label>
		<input type="text" id="userName" name="userName" value="${member.userName}" required="required" readonly />
	</div>
	
	<div class="input_area">
		<label for="email"><spring:message code="user.email" /></label>
		<input type="email" id="email" name="email" value="${member.email}" required="required" readonly />
	</div>
	
	<div class="input_area">
		<label for="phone"><spring:message code="user.phone" /></label>
		<input type="text" id="phone" name="phone" value="${member.phone}" required="required" readonly />
	</div>
	
	<div>
		<a id="modifybtn" href="usermodify?userId=${member.userId}"><input type="button" value="<spring:message code="action.edit" />"></a>
		<span id="removebtn"><input type="submit" value="<spring:message code="action.remove" />" onclick="javascript: action='/user/userremove'; " /></span>
		<a id="modifybtn" href="/"><input type="button" value="<spring:message code="action.home" />"></a>
		
	</div>
	<br/><br/>
	
</form>