<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="user.header.list" /></h2>
<a href="register"><spring:message code="action.new" /></a>

<table border="1">
	<tr>
		<th align="center" width="80"><spring:message code="user.userId" /></th>
		<th align="center" width="300"><spring:message code="user.userPw" /></th>
		<th align="center" width="100"><spring:message code="user.userName" /></th>
		<th align="center" width="100"><spring:message code="user.coin" /></th>
		<th align="center" width="100"><spring:message code="user.email" /></th>
		<th align="center" width="100"><spring:message code="user.phone" /></th>
		<th align="center" width="180"><spring:message code="user.regdate" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="7">
					<spring:message code="common.listEmpty" />
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="member">
				<tr>
					<td align="center"><a href='/user/read?userId=${member.userId}'>${member.userId}</a></td>
					<td align="center">${member.userPw}</td>
					<td align="center">${member.userName}</td>
					<td align="center">${member.coin}</td>
					<td align="center">${member.email}</td>
					<td align="center">${member.phone}</td>
					<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${member.regDate}" /></td>
				</tr>	
			</c:forEach>
		</c:otherwise>			
	</c:choose>
</table>

<script>
	var result = "${msg}";
	
	if(result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
</script>
