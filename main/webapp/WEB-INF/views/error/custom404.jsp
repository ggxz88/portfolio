<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	
<h2><spring:message code="common.error.urlNotFound" /></h2>

<span class="linkbtn"><a href="javascript:window.history.back();"><spring:message code="common.error.backPage" /></a><br></span>
<span class="linkbtn"><a href="/"><spring:message code="common.error.returnHome" /></a></span>
