<%@page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h1>
	Hello world!  
</h1>

<a href="/item/read?itemId=4"><img class="mySlides" src="<spring:url value='/resources/images/image/blue.png'/>">
</a>
<a href="/item/read?itemId=5"><img class="mySlides" src="<spring:url value='/resources/images/image/purple.png'/>">
</a>
<a href="/item/read?itemId=6"><img class="mySlides" src="<spring:url value='/resources/images/image/blue2.png'/>">
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
	  setTimeout(carousel, 4000); // Change image every 5 seconds
	}
</script>
