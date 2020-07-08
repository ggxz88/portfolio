<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2></h2>

<form id="register" action="/notice/register" method="post" >

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

	<div class="input_area">
		<label for="title">제목</label>
		<input type="text" id="title" name="title" required="required" />
	</div>
	
	<div class="input_area">
		<label for="content">내용</label>
		<input type="text" id="content" name="content" required="required" />
	</div>
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<button type="submit" id="register" name="register">등록</button>
	</sec:authorize>
</form>