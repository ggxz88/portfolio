<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2></h2>

<form action="/user/modify" method="post">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

	<div class="input_area">
		<!--<spring:message code="user.userId" /> -->
		<label for="userId">아이디</label>
		<input type="text" id="userId" name="userId" value="${member.userId}" required="required" readonly />
	</div>
	
	<div class="input_area">
		<label for="userName">닉네임</label>
		<input type="text" id="userName" name="userName" value="${member.userName}" required="required"  />
	</div>
	
	<div class="input_area">
		<label for="email">이메일</label>
		<input type="email" id="email" name="email" value="${member.email}" required="required"  />
	</div>
	
	<div class="input_area">
		<label for="phone">연락처</label>
		<input type="text" id="phone" name="phone" value="${member.phone}" required="required"  />
	</div>

	<div>
		<button type="submit" id="modify" name="modify"><spring:message code="action.modify" /></button>
		<a href="list"><input type="button" value="<spring:message code="action.list" />"></a>
	</div>
	
</form>