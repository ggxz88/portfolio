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
	<br><br><hr><br>    
	<sec:authorize access="hasRole('ROLE_MEMBER')">
		<div class="mypage" align="left">
			<div class="mybtn">
				<a href="/useritem/list"><br><br><spring:message code="menu.useritem.list" /></a>
			</div>
			<div class="mybtn">
				<a href="/cart/list"><br><br><spring:message code="menu.cart.list" /></a>
			</div>
			<div class="mybtn">
				<a href="/useritem/rank"><br><br><spring:message code="menu.item.rank" /></a>
			</div>
			<div class="mybtn">
				<a href="/board/list"><br><br><spring:message code="menu.board.member" /></a>
			</div>
			<div class="mybtn">
				<a href="/notice/list"><br><br><spring:message code="menu.notice.member" /></a>
			</div>
			<div class="mybtn">
				<a href="/coin/charge"><br><br><spring:message code="menu.coin.charge" /></a>
			</div>
			<div class="mybtn">
				<a href="/coin/listPay"><br><br><spring:message code="menu.coin.listPay" /></a>
			</div>
			<div class="mybtn">
				<a href="/coin/list"><br><br><spring:message code="menu.coin.list" /></a>
			</div>
			<div class="mybtn">
				<a href="/user/userread?userId=${member.userId}"><br><br><spring:message code="menu.user.member"/></a>
			</div>
			<div class="mybtn">
				<a href="/user/checkPw"><br><br><spring:message code="menu.user.modifypw"/></a>
			</div>
		</div>
		
		
	</sec:authorize>	        	        
</sec:authorize>
	


