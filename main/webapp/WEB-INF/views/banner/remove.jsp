<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="banner.header.remove" /></h2>

<form id="itemremove" action="/banner/remove" method="post">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="bannerNo" value="${banner.bannerNo}" />
	
	<div class="input_area">
		<label for="bannerName"><spring:message code="banner.bannerName" /></label>
		<input type="text" id="bannerName" name="bannerName" value="${banner.bannerName}" required="required" disabled />
	</div>
	
	<div class="input_area">
		<label for="preview"><spring:message code="banner.bannerPicture" /></label>
		<img src="display?bannerNo=${banner.bannerNo}" width="210" height="240" id="preview" name="preview">
	</div>
	
	<div>
		<button type="submit" id="remove" name="remove"><spring:message code="action.remove" /></button>
		<a href="/banner/list"><input type="button" value="<spring:message code="action.list" />"></a>
			
	</div>
	
</form>