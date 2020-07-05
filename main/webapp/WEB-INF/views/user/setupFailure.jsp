<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div>
	<h2><spring:message code="common.cannotSetupAdmin" arguments="${userName}"/></h2>
	
	<a href="/"><spring:message code="action.home" /></a>
</div>