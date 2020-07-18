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
	<br><br><hr><br>    
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div class="mypage" align="left">
			<div class="mybtn">
				<a href="/user/list"><br><br><spring:message code="menu.user.admin" /></a>
			</div>
			<div class="mybtn">
				<a href="/board/list"><br><br><spring:message code="menu.board.admin" /></a>
			</div>
			<div class="mybtn">
				<a href="/notice/list"><br><br><spring:message code="menu.notice.admin" /></a>
			</div>
			<div class="mybtn">
				<a href="/item/list"><br><br><spring:message code="menu.item.admin" /></a>
			</div>
		</div>
	</sec:authorize>
	            	        
</sec:authorize>
	


