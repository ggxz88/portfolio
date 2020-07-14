<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="cart.header.list" /></h2>

<table border="1">
	<tr>
		<th align="center" width="80"><spring:message code="cart.no" /></th>
		<th align="center" width="320"><spring:message code="cart.itemName" /></th>
		<th align="center" width="180"><spring:message code="cart.itemprice" /></th>
		<th align="center" width="180"><spring:message code="cart.amount" /></th>
		<th align="center" width="180"><spring:message code="cart.price" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="5">
					<spring:message code="common.listEmpty" />
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="cart">
				<tr>
					<td align="center">${cart.cartNo}</td>
					<td align="center"><a href='/item/read?itemId=${cart.itemId}'>${cart.itemName}</a></td>
					<td align="center">${cart.price}</td>
					<td align="center">${cart.amount}</td>
					<td align="center">${cart.amount * cart.price}</td>
				</tr>	
			</c:forEach>
		</c:otherwise>			
	</c:choose>
</table>
