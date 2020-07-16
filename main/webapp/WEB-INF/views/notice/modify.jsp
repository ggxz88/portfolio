<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2><spring:message code="notice.header.modify" /></h2>

<form action="/notice/modify" method="post">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="noticeNo" value="${notice.noticeNo}" />
	<input type="hidden" name="page" value="${pgrq.page}" />
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}" />
	<input type="hidden" name="searchType" value="${pgrq.searchType}" />
	<input type="hidden" name="keyword" value="${pgrq.keyword}" />
	
	<div class="input_area">
		<label for="title"><spring:message code="notice.title" /></label>
		<input type="text" id="title" name="title" value="${notice.title}" required="required" />
	</div>
	
	<div class="input_area">
		<label for="content"><spring:message code="notice.content" /></label>
		<input type="text" id="content" name="content" value="${notice.content}" required="required" />
	</div>
	
	<div>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<button type="submit" id="modify" name="modify"><spring:message code="action.modify" /></button>
			<input type="submit" value="<spring:message code="action.remove" />" onclick="javascript: action='/notice/remove';"/>
		</sec:authorize>
			
		<a href="/notice/list${pgrq.toUriString()}"><input type="button" value="<spring:message code="action.list" />"></a>
			
	</div>
	
</form>