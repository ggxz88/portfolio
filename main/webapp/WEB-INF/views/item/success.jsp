<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div>
	<h2>${msg}</h2>
	<a href="/item/list"><spring:message code="action.list" /></a>
	<a href="/useritem/list"><spring:message code="menu.useritem.list"/></a>
</div>