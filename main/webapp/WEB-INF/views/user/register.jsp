<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="user.header.register" /></h2>

<form id="register" action="/user/register" method="post" >

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

	<div class="input_area">
		<label for="userId"><spring:message code="user.userId" /></label>
		<input type="text" id="userId" name="userId" required="required" />
		<button type="button" class="idChk">아이디 확인</button>
	</div>
	
	<div class="result">
		<span class="msg"></span>
	</div>	
	
	<div class="input_area">
		<label for="userPw"><spring:message code="user.userPw" /></label>
		<input type="password" id="userPw" name="userPw" onchange="checkPw()" required="required" />
	</div>
	
	<div class="input_area">
		<label for="userPwconfirm"><spring:message code="user.userPwComfirm" /></label>
		<input type="password" id="userPwconfirm" name="userPwconfirm" onchange="checkPw()" required="required" />&nbsp;
		<br>
		<span id="check"></span>
	</div>
	
	<div class="input_area">
		<label for="userName"><spring:message code="user.userName" /></label>
		<input type="text" id="userName" name="userName" required="required" />
	</div>
	
	<div class="input_area">
		<label for="email"><spring:message code="user.email" /></label>
		<input type="email" id="email" name="email" placeholder="example@email.com" required="required" />
	</div>
	
	<div class="input_area">
		<label for="phone"><spring:message code="user.phone" /></label>
		<input type="text" id="phone" name="phone" placeholder="01X-XXXX-XXXX" required="required" />
	</div>
	
	
	<button type="submit" id="submit" name="register" disabled><spring:message code="action.signup" /></button>
	
</form>


<script>
		
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(function() {
	    $(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader(header, token);
	    });
	});
	
	$(".idChk").click(function() {
		var query = {userId : $("#userId").val()};
		
		$.ajax({
			url : "/user/idChk",
			type : "post",
			data : query,
			success : function(data) {
				
				if (data == 1) {
					$(".result .msg").text("사용 불가");
					$(".result .msg").attr("style", "color:#f00")
				} else {
					$(".result .msg").text("사용 가능");
					$(".result .msg").attr("style", "color:#00f")
				}
			}
		});
		
	});

	function checkPw() {
		var pw1 = document.getElementById('userPw').value;
		var pw2 = document.getElementById('userPwconfirm').value;
		
		if(pw1 == pw2) {
			document.getElementById('check').innerHTML='비밀번호가 일치합니다.';
			document.getElementById('check').style.color='blue';
			document.getElementById("submit").disabled = false
		}
		else {
			document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
			document.getElementById('check').style.color='red';
			document.getElementById("submit").disabled = true
		}
	}
	
</script>