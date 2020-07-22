<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="banner.header.register" /></h2>

<form id="itemregister" action="/banner/register" method="post" enctype="multipart/form-data" accept-charset="UTF-8">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	
	<div class="input_area">
		<label for="itemId"><spring:message code="banner.itemId" /></label>
		<input type="text" id="itemId" name="itemId" required="required" />
	</div>
	
	<div class="input_area">
		<label for="bannerName"><spring:message code="banner.bannerName" /></label>
		<input type="text" id="bannerName" name="bannerName" required="required" />
	</div>
	
	<div class="input_area">
		<label for="bannerPicture"><spring:message code="banner.bannerPictureFile" /></label>
		<input type="file" id="bannerPicture" name="bannerPicture" />
	</div>
	
	<div>
		<button type="submit" id="registerbtn" name="register"><spring:message code="action.register" /></button>
		<a href="/banner/list"><input type="button" value="<spring:message code="action.list" />"></a>
	</div>
	
</form>