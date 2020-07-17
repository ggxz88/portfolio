<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<h2><spring:message code="notice.header.read" /></h2>

<form action="/notice/read">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="noticeNo" value="${notice.noticeNo}" />
	<input type="hidden" name="page" value="${pgrq.page}" />
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}" />
	<input type="hidden" name="searchType" value="${pgrq.searchType}" />
	<input type="hidden" name="keyword" value="${pgrq.keyword}" />

	<div class="input_area">
		<label for="title"><spring:message code="notice.title" /></label>
		<input type="text" id="title" name="title" value="${notice.title}" readonly />
	</div>
	
	<div class="input_area">
		<label for="content"><spring:message code="notice.content" /></label>
		<textarea id="content" name="content" readonly >${notice.content}</textarea>
	</div>
	
	<div>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<a href='/notice/modify${pgrq.toUriString()}&noticeNo=${notice.noticeNo}'><input type="button" value="<spring:message code="action.edit" />"></a>
			<input type="submit" value="<spring:message code="action.remove" />" onclick="javascript: action='/notice/remove'; method='post'; "/>
		</sec:authorize>			
		<a href="/notice/list${pgrq.toUriString()}"><input type="button" value="<spring:message code="action.list" />"></a>
			
	</div>
	
</form>