<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="cart.header.list" /></h2>

<div>
	<a href="/cart/removeall?userId=${cart.userId}"><spring:message code="cart.removeall" /></a>
</div>

<table border="1">
	<tr>
		<th align="center" width="80"><spring:message code="cart.no" /></th>
		<th align="center" width="320"><spring:message code="cart.itemName" /></th>
		<th align="center" width="180"><spring:message code="cart.itemprice" /></th>
		<th align="center" width="180"><spring:message code="cart.amount" /></th>
		<th align="center" width="180"><spring:message code="cart.price" /></th>
		<th align="center" width="80"><spring:message code="action.remove" /></th>
		<th align="center" width="80"><spring:message code="action.buy" /></th>
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
			<c:forEach items="${list}" var="cart">
				<tr>
					<td align="center">${cart.cartNo}</td>
					<td align="center"><a href='/item/read?itemId=${cart.itemId}'>${cart.itemName}</a></td>
					<td align="center">${cart.price}</td>
					<td align="center">${cart.amount}</td>
					<td align="center">${cart.amount * cart.price}</td>
					<td align="center"><a href="/cart/remove?cartNo=${cart.cartNo}"><spring:message code="action.remove" /></a></td>
					<td align="center"><a href="/item/buy?itemId=${cart.itemId}"><spring:message code="action.buy"/></a></td>
		
				</tr>	
			</c:forEach>
		</c:otherwise>			
	</c:choose>
</table>
<br>
<div class="priceall_area" align="right">
	총 가격 : ${priceall}원
</div>
