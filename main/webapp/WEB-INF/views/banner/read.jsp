<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2><spring:message code="banner.header.read" /></h2>

<form id="itemread" action="/banner/read">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="bannerNo" value="${banner.bannerNo}" />
	
	<div class="input_area">
		<label for="bannerName"><spring:message code="banner.bannerName" /></label>
		<input type="text" id="bannerName" name="bannerName" value="${banner.bannerName}" readonly />
	</div>
	
	<div class="input_area">
		<label for="bannerPicture"><spring:message code="banner.bannerPicture" /></label>
		<img src="display?bannerNo=${banner.bannerNo}" width="210" height="240" id="bannerPicture" name="bannerPicture">
	</div>
	
	<div>
		<a href='/banner/modify?bannerNo=${banner.bannerNo}'><spring:message code="item.edit" /></a>
		<a href='/banner/remove?bannerNo=${banner.bannerNo}'><spring:message code="item.remove" /></a>
		<a href="/banner/list"><input type="button" value="<spring:message code="action.list" />"></a>
	</div>
	
</form>