<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="item.header.read" /></h2>

<form id="itemread" action="/item/read">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="itemId" value="${item.itemId}" />
	<input type="hidden" name="page" value="${pgrq.page}" />
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}" />
	<input type="hidden" name="keyword" value="${pgrq.keyword}" />

	<div class="input_area">
		<label for="itemName"><spring:message code="item.itemName" /></label>
		<input type="text" id="itemName" name="itemName" value="${item.itemName}" readonly />
	</div>
	
	<div class="input_area">
		<label for="price"><spring:message code="item.itemPrice" /></label>
		<input type="text" id="price" name="price" value="${item.price}" readonly />
	</div>
	
	<div class="input_area">
		<label for="preview"><spring:message code="item.preview" /></label>
		<img src="display?itemId=${item.itemId}" width="210" height="240" id="preview" name="preview">
	</div>
	
	<div class="input_area">
		<label for="description"><spring:message code="item.itemDescription" /></label>
		<textarea id="description" name="description" readonly >${item.description}</textarea>
	</div>
	
	<div>
		<input type="submit" value="<spring:message code="action.buy" />" onclick="javascript: action='/item/buy'; method='post'; "/>
		<input type="submit" value="<spring:message code="action.cartadd" />" onclick="javascript: action='/item/cartadd'; method='post'; "/>
		<a href="/item/list${pgrq.toItemUriString()}"><input type="button" value="<spring:message code="action.list" />"></a>
			
	</div>
	
</form>