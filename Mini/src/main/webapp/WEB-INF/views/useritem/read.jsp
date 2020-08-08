<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="useritem.header.read" /></h2>

<form id="itemread" action="/useritem/read">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="userItemNo" value="${userItem.userItemNo}" />
	
	<div class="input_area">
		<label for="itemName"><spring:message code="useritem.itemName" /></label>
		<input type="text" id="itemName" name="itemName" value="${userItem.itemName}" required="required" readonly />
	</div>
	
	<div class="input_area">
		<label for="price"><spring:message code="useritem.itemPrice" /></label>
		<input type="text" id="price" name="price" value="${userItem.price}" required="required" readonly />
	</div>
	
	<div class="input_area">
		<label for="picture"><spring:message code="useritem.itemFile" /></label>
		<img src="/item/display?itemId=${userItem.itemId}" width="210" height="240" id="picture" name="picture">
	</div>
	
	<div class="input_area">
		<label for="description"><spring:message code="useritem.itemDescription" /></label>
		<input type="text" id="description" name="description" value="${userItem.description}" required="required" readonly />
	</div>
	
	<div>
		<a href="/useritem/list"><input type="button" value="<spring:message code="action.list" />"></a>
	</div>
	
</form>