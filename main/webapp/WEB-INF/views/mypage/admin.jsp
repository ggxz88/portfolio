<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<h2 align="left"><spring:message code="mypage.header" /></h2>

<sec:authorize access="!isAuthenticated()">
	<table>
		<tr>
			<td align="center"><a href="/auth/login"><spring:message code="mypage.login" /></a></td>
		</tr>
	</table>					
</sec:authorize>
        
<sec:authorize access="isAuthenticated()">
	<table align="left">
		<tr>
			<td>
		        <sec:authentication property="principal.username"/> 님 
		    </td>
		</tr>
	</table>    
	<br><br>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div align="left">
			<a href="/user/list"><spring:message code="menu.user.admin" /></a>
			<br><br>
			<a href="/board/list"><spring:message code="menu.board.admin" /></a>
			<br><br>
			<a href="/notice/list"><spring:message code="menu.notice.admin" /></a>
			<br>
		</div>
	</sec:authorize>
	            	        
</sec:authorize>
	


