<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="banner.header.modify" /></h2>

<form id="itemmodify" action="/banner/modify" method="post" enctype="multipart/form-data" accept-charset="UTF-8">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="bannerNo" value="${banner.bannerNo}" />
	
	<div class="input_area">
		<label for="bannerName"><spring:message code="banner.bannerName" /></label>
		<input type="text" id="bannerName" name="bannerName" value="${banner.bannerName}" required="required"/>
	</div>
	
	<div class="input_area">
		<label for="preview"><spring:message code="banner.bannerPicture" /></label>
		<img src="display?bannerNo=${banner.bannerNo}" width="210" height="240" id="preview" name="preview">
	</div>
	
	<div class="picture_area">
		<label for="bannerPicture"><spring:message code="banner.bannerPictureFile" /></label>
		<input type="file" id="bannerPicture" name="bannerPicture" />
	</div>
	
	<div>
		<button type="submit" id="modifybtn" name="modify">수정</button>
		<a href="/item/list"><input type="button" value="<spring:message code="action.list" />"></a>
			
	</div>
	
</form>