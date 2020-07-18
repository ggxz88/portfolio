<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="item.header.register" /></h2>

<form id="itemregister" action="/item/register" method="post" enctype="multipart/form-data" accept-charset="UTF-8">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	
	<div class="input_area">
		<label for="itemName"><spring:message code="item.itemName" /></label>
		<input type="text" id="itemName" name="itemName" required="required" />
	</div>
	
	<div class="input_area">
		<label for="price"><spring:message code="item.itemPrice" /></label>
		<input type="text" id="price" name="price" required="required" />
	</div>
		
	<div class="input_area">
		<label for="picture"><spring:message code="item.itemFile" /></label>
		<input type="file" id="picture" name="picture" />
	</div>
	
	<div class="input_area">
		<label for="preview"><spring:message code="item.itemPreviewFile" /></label>
		<input type="file" id="preview" name="preview" />
	</div>
	
	<div class="input_area">
		<label for="description"><spring:message code="item.itemDescription" /></label>
		<textarea id="description" name="description" required="required" ></textarea>
	</div>
	
	<div>
		<button type="submit" id="register" name="register"><spring:message code="action.register" /></button>
		<a href="/item/list"><input type="button" value="<spring:message code="action.list" />"></a>
			
	</div>
	
</form>