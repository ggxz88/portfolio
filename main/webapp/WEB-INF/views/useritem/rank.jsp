<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2>상품 랭킹</h2>

<!-- 
<table>
	<c:forEach var="i" begin="1" end="10">
		<tr>
			<td>${i}</td>
		
		</tr>
	</c:forEach>
</table>

<table>
	<c:forEach items="${list}" var="rank">
		<tr>
			<td align="center"><a href='/item/read?itemId=${rank.itemId}'>${rank.itemName}</a></td>
			<td align="center">${rank.price} 원</td>
		</tr>	
	</c:forEach>
</table>
-->
<div style="float: left; width:33%">
	<c:forEach var="i" begin="1" end="10">
		${i}.
		<br/>
	</c:forEach>
</div>

<div style="float: left; width:33%">
	<c:forEach items="${list}" var="rank">
		<a href='/item/read?itemId=${rank.itemId}'>${rank.itemName}</a>
		${rank.price} 원
		<br>	
	</c:forEach>
</div>

<div style="float: left; width:33%">

</div>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
