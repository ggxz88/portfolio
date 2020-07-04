<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2></h2>

<form action="/user/read">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

	<div class="input_area">
		<!--<spring:message code="user.userId" /> -->
		<label for="userId">아이디</label>
		<input type="text" id="userId" name="userId" required="required" readonly/>
	</div>
	
	<div class="input_area">
		<label for="userName">닉네임</label>
		<input type="text" id="userName" name="userName" required="required" readonly/>
	</div>
	
	<div class="input_area">
		<label for="email">이메일</label>
		<input type="email" id="email" name="email" required="required" readonly />
	</div>
	
	<div class="input_area">
		<label for="phone">연락처</label>
		<input type="text" id="phone" name="phone" required="required" readonly />
	</div>
	
	<div>
		<select name="authList[0].auth" disabled>
			<option value="" label="=== 선택해 주세요 ===" />
			<option value="ROLE_USER" label="사용자" />
			<option value="ROLE_MEMBER" label="회원" />
			<option value="ROLE_ADMIN" label="관리자" />
		</select>
		
		<select name="authList[1].auth" disabled>
			<option value="" label="=== 선택해 주세요 ===" />
			<option value="ROLE_USER" label="사용자" />
			<option value="ROLE_MEMBER" label="회원" />
			<option value="ROLE_ADMIN" label="관리자" />
		</select>
		
		<select name="authList[2].auth" disabled>
			<option value="" label="=== 선택해 주세요 ===" />
			<option value="ROLE_USER" label="사용자" />
			<option value="ROLE_MEMBER" label="회원" />
			<option value="ROLE_ADMIN" label="관리자" />
		</select>
		
	
	</div>
	
	<button type="submit" id="register" name="register">회원가입</button>
</form>