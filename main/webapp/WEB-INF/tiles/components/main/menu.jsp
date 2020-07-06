<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="Menu" align="center">
	<table>
		<tr>
			<td width="80"><a href="/"><spring:message code="header.home" /></a></td>
			
			<!-- 로그인을 하지 않은 경우 -->
			<sec:authorize access="!isAuthenticated()">
				<td width="120"><a href="/board/list"><spring:message code="menu.board.member" /></a></td>
			</sec:authorize>
			
			<!-- 로그인을 한 경우 -->
			<sec:authorize access="isAuthenticated()">
				<!-- 관리자 권한을 가진 사용자인 경우 -->
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<td width="120"><a href="/board/list"><spring:message code="menu.board.member" /></a></td>
				</sec:authorize>
				
				<!-- 회원 권한을 가진 사용자인 경우 -->
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<td width="120"><a href="/board/list"><spring:message code="menu.board.member" /></a></td>
				</sec:authorize>
			</sec:authorize>
			
			
		</tr>
	</table>
</div>
<hr>
