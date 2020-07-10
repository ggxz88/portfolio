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
			<td>
				코인 : ${mycoin}
			</td>
		</tr>
	</table>
	<br><br>    
	<sec:authorize access="hasRole('ROLE_MEMBER')">
		<div align="left">
			<a href="/coin/list"><spring:message code="menu.coin.list" /></a>
		</div>
	</sec:authorize>	        	        
</sec:authorize>
	


