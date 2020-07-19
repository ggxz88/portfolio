<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="cart.header.list" /></h2>

<table id="list" border="1">
	<tr>
		<th align="center" width="420"><spring:message code="cart.info" /></th>
		<th align="center" width="120"><spring:message code="cart.amount" /></th>
		<th align="center" width="120"><spring:message code="cart.price" /></th>
		<th align="center" width="80"><spring:message code="action.buy" /></th>
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
			<c:forEach items="${list}" var="cart">
				<tr>
					<td align="center">
						<div id="preview_pic" align="left">
							<p class="item_info">
								<img src="/item/display?itemId=${cart.itemId}" width="120" height="120" id="preview" name="preview" align="top">
								<a id="cart_itemname" href='/item/read?itemId=${cart.itemId}'>${cart.itemName}</a>	
								${cart.price}원
							</p>
						</div>
						<div id="cartremove">
							<a href="/cart/remove?cartNo=${cart.cartNo}"><img src="<spring:url value='/resources/images/image/Remove.png'/>" width="15" height="15"></a>
						</div>
					</td>
					<td align="center">${cart.amount}</td>
					<td align="center">${cart.amount * cart.price}</td>
					<td id="a_btn" align="center"><a href="/item/buy?itemId=${cart.itemId}"><spring:message code="action.buy"/></a></td>
				</tr>	
			</c:forEach>
		</c:otherwise>			
	</c:choose>
</table>

<div class="priceall_area" align="center">
	총 금액 : ${priceall}원
	<br>
</div>

<div id="removeall">
	<a href="/cart/removeall?userId=${cart.userId}"><spring:message code="cart.removeall" /></a>
</div>

