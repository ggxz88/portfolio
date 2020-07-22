<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="banner.header.list" /></h2>

<table id="list" border="1">
	<tr>
		<th align="center" width="80"><spring:message code="banner.bannerNo" /></th>
		<th align="center" width="320"><spring:message code="banner.bannerName" /></th>
		<th align="center" width="180"><spring:message code="banner.itemId" /></th>
		<th align="center" width="180"><spring:message code="banner.itemName" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="4">
					<spring:message code="common.listEmpty" />
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="banner">
				<tr>
					<td align="center">${banner.bannerNo}</td>
					<td align="center"><a href="/banner/read?bannerNo=${banner.bannerNo}">${banner.bannerName}</a></td>
					<td align="center">${banner.itemId}</td>
					<td align="center">${banner.itemName}</td>
				</tr>	
			</c:forEach>
		</c:otherwise>			
	</c:choose>
</table>

<sec:authorize access="hasRole('ROLE_ADMIN')">
	<div id="newmake" align="center">
		<a href="register"><spring:message code="action.new" /></a>
	</div>
</sec:authorize>

<script>
	var result = "${msg}";
	
	if(result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
</script>
