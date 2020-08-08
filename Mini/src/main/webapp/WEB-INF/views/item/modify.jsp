<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="item.header.modify" /></h2>

<form id="itemmodify" action="/item/modify" method="post" enctype="multipart/form-data" accept-charset="UTF-8">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="itemId" value="${item.itemId}" />
	<input type="hidden" name="pictureUrl" value="${item.pictureUrl}" />
	<input type="hidden" name="pictureUrl" value="${item.previewUrl}" />
	<input type="hidden" name="page" value="${pgrq.page}" />
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}" />
	<input type="hidden" name="keyword" value="${pgrq.keyword}" />

	<div class="itemname_area">
		<label for="itemName"><spring:message code="item.itemName" /></label>
		<input type="text" id="itemName" name="itemName" value="${item.itemName}" required="required" />
	</div>
	
	<div class="price_area">
		<label for="price"><spring:message code="item.itemPrice" /></label>
		<input type="text" id="price" name="price" value="${item.price}" required="required" />
	</div>
	
	<div class="preview_area">
		<label for="previewFile"><spring:message code="item.preview" /></label>
		<img src="display?itemId=${item.itemId}" width="150" height="150" id="previewFile" name="previewFile">
	</div>
	
	<div class="picture_area">
		<label for="picture"><spring:message code="item.itemFile" /></label>
		<input type="file" id="picture" name="picture" />
	</div>
	
	<div class="previewfile_area">
		<label for="preview"><spring:message code="item.itemPreviewFile" /></label>
		<input type="file" id="preview" name="preview" />
	</div>
	
	<div class="description_area">
		<label for="description"><spring:message code="item.itemDescription" /></label>
		<textarea id="description" name="description" required="required" >${item.description}</textarea>
	</div>
	
	<div>
		<button type="submit" id="modifybtn" name="modify">수정</button>
		<a href="/item/list${pgrq.toItemUriString()}"><input type="button" value="<spring:message code="action.list" />"></a>
			
	</div>
	
</form>