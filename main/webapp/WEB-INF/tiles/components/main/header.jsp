<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="Header" align="right">
<table>
	<tr>
		<!-- 로그인을 하지 않은 경우 로그인 페이지로 이동할 수 있게 한다.  -->
		<sec:authorize access="!isAuthenticated()">
				
				<td width="80"><a href="/user/register"><spring:message code="header.joinMember" /></a></td>
				
		        <td width="80"><a href="/auth/login"><spring:message code="header.login" /></a></td>
		
        </sec:authorize>
        
        <!-- 로그인을 거친 인증된 사용자인 경우 사용자명을 보여주고 로그아웃 페이지로 이동할 수 있게 한다. -->
        <sec:authorize access="isAuthenticated()">
		        <td width="180"><sec:authentication property="principal.username"/> 님 <a href="/auth/logout"><spring:message code="header.logout" /></a></td>
				
				<!-- 관리자 권한을 가진 사용자인 경우 -->
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<td width="100"><a href="/mypage/admin"><spring:message code="adminpage.header" /></a></td>
				</sec:authorize>
				
		    	<!-- 회원 권한을 가진 사용자인 경우 -->
		    	<sec:authorize access="hasRole('ROLE_MEMBER')">
			        <td width="100"><a href="/mypage/my"><spring:message code="mypage.header" /></a></td>
				</sec:authorize>
    			
        </sec:authorize>
	</tr>
</table>
</div>
<hr>
