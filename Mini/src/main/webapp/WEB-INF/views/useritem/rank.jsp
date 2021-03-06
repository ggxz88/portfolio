<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="menu.item.rank" /></h2>

<table id="list" border="1">
	<tr>
		<th align="center" width="80"><spring:message code="useritem.rank" /></th>
		<th align="center" width="320"><spring:message code="useritem.itemName" /></th>
		<th align="center" width="100"><spring:message code="useritem.itemPrice" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="3">
					<spring:message code="common.listEmpty" />
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="rank">
				<tr>
					<td align="center">${rank.row_num}</td>
					<td align="center"><a href='/item/read?itemId=${rank.itemId}'>${rank.itemName}</a></td>
					<td align="center">${rank.price}</td>
				</tr>	
			</c:forEach>
		</c:otherwise>			
	</c:choose>
</table>
