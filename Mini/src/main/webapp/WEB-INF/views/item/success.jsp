<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div>
	<h2>${msg}</h2>
	<span class="linkbtn"><a href="/item/list"><spring:message code="action.list" /></a></span>
	<span class="linkbtn"><a href="/useritem/list"><spring:message code="menu.useritem.list"/></a></span>
</div>