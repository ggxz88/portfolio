<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2><spring:message code="auth.header.login" /></h2>
<h2>
	<c:out value="${error}" />
</h2>
<h2>
	<c:out value="${logout}" />
</h2>

<form method="post" action="/login">
	<table>
		<tr>
			<td><spring:message code="input.id" /></td>
			<td><input type="text" name="username" value="admin"></td>
			
		</tr>
		<tr>
			<td><spring:message code="input.password" /></td>
			<td><input type="password" name="password" value="admin"></td>
			
		</tr>
		<tr>
			<td></td>
			<td><input type="checkbox" name="remember-me"><spring:message code="auth.rememberMe" /></td>
		</tr>
		
	</table>
	<div>
		<button><spring:message code="action.login" /></button>
	</div>
	<br>
	<div>
		<a href="/user/findId"><input type="button" value="<spring:message code="user.findid"/>"></a>
		<a href="/user/findPass"><input type="button" value="<spring:message code="user.findpw"/>"></a>
	</div>
		
	<sec:csrfInput />
</form>
