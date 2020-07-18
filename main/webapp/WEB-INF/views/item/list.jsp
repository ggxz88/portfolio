<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="item.header.list" /></h2>

<form:form modelAttribute="pgrq" method="get" action="list${pgrq.toItemUriStringByPage(1)}">		
	<form:input path="keyword" />
	<button id='searchBtn'><spring:message code="action.search" /></button>
</form:form>

<table id="list" border="1">
	<tr>
		<th align="center" width="80"><spring:message code="item.itemId" /></th>
		<th align="center" width="320"><spring:message code="item.itemName" /></th>
		<th align="center" width="100"><spring:message code="item.itemPrice" /></th>
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<th align="center" width="80"><spring:message code="item.edit" /></th>
			<th align="center" width="80"><spring:message code="item.remove" /></th>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_MEMBER')">
			<th align="center" width="80"><spring:message code="item.read" /></th>
		</sec:authorize>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<sec:authorize access="!hasRole('ROLE_ADMIN') AND !hasRole('ROLE_MEMBER')">
					<td colspan="3">
						<spring:message code="common.listEmpty" />
					</td>
				</sec:authorize>
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<td colspan="5">
						<spring:message code="common.listEmpty" />
					</td>
				</sec:authorize>
				
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<td colspan="4">
						<spring:message code="common.listEmpty" />
					</td>
				</sec:authorize>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="item">
				<tr>
					<td align="center">${item.itemId}</td>
					<td align="center">${item.itemName}</td>
					<td align="center">${item.price} 원</td>
					
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<td align="center"><a href='/item/modify${pgrq.toUriString(pgrq.page)}&itemId=${item.itemId}'><spring:message code="item.edit" /></a></td>
						<td align="center"><a href='/item/remove${pgrq.toUriString(pgrq.page)}&itemId=${item.itemId}'><spring:message code="item.remove" /></a></td>
					</sec:authorize>
					
					<sec:authorize access="hasRole('ROLE_MEMBER')">
						<td align="center"><a href='/item/read${pgrq.toUriString(pgrq.page)}&itemId=${item.itemId}'><spring:message code="item.read" /></a></td>
					</sec:authorize>
				</tr>	
			</c:forEach>
		</c:otherwise>			
	</c:choose>
</table>

<sec:authorize access="hasRole('ROLE_ADMIN')">
	<div id="newmake" align="right">
		<a href="register"><spring:message code="action.new" /></a>
	</div>
</sec:authorize>

<!-- 페이징 네비게이션 -->
<div>
	<c:if test="${pagination.prev}">
		<a href="${pagination.startPage - 1}">&laquo;</a>
	</c:if>
	
	<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
		<a href="/item/list${pagination.makeQuery(idx)}">${idx}</a>
	</c:forEach>
	
	<c:if test="${pagination.next && pagination.endPage > 0}">
		<a href="${pagination.endPage + 1}">&raquo;</a>
	</c:if>
</div>

<script>
	var result = "${msg}";
	
	if(result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
</script>
