<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2>상품 랭킹</h2>

<table>
	<c:forEach items="${list}" var="rank">
		<tr>
			<td align="center"><a href='/item/read?itemId=${rank.itemId}'>${rank.itemName}</a></td>
			<td align="center">${rank.price} 원</td>
		</tr>	
	</c:forEach>
</table>

