<%@page contentType="text/html;charset=UTF-8" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<a href="/item/read?itemId=4"><img class="mySlides" width="70%" height="300px" src="<spring:url value='/resources/images/image/blue.png'/>">
</a>
<a href="/item/read?itemId=5"><img class="mySlides" width="70%" height="300px" src="<spring:url value='/resources/images/image/purple.png'/>">
</a>
<a href="/item/read?itemId=6"><img class="mySlides" width="70%" height="300px" src="<spring:url value='/resources/images/image/blue2.png'/>">
</a>

<script>
	var slideIndex = 0;
	carousel();
	
	function carousel() {
	  var i;
	  var x = document.getElementsByClassName("mySlides");
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";
	  }
	  slideIndex++;
	  if (slideIndex > x.length) {slideIndex = 1}
	  x[slideIndex-1].style.display = "block";
	  setTimeout(carousel, 4000); // Change image every 4 seconds
	}
</script>

<h3><spring:message code="menu.item.rank" /></h3>

<table id="list" border="1">
	<tr>
		<th align="center" width="80"><spring:message code="useritem.rank" /></th>
		<th align="center" width="160"><spring:message code="useritem.preview" /></th>
		<th align="center" width="320"><spring:message code="useritem.itemName" /></th>
		<th align="center" width="100"><spring:message code="useritem.itemPrice" /></th>
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
			<c:forEach items="${list}" var="rank">
				<tr>
					<td align="center">${rank.row_num}</td>
					<td align="center"><img src="/item/display?itemId=${rank.itemId}" width="120" height="120" id="preview" name="preview"></td>
					<td align="center"><a href='/item/read?itemId=${rank.itemId}'>${rank.itemName}</a></td>
					<td align="center">${rank.price}</td>
				</tr>	
			</c:forEach>
		</c:otherwise>			
	</c:choose>
</table>
