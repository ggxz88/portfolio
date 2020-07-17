<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2><spring:message code="board.header.modify" /></h2>

<form action="/board/modify" method="post">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="boardNo" value="${board.boardNo}" />
	<input type="hidden" name="page" value="${pgrq.page}" />
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}" />
	<input type="hidden" name="searchType" value="${pgrq.searchType}" />
	<input type="hidden" name="keyword" value="${pgrq.keyword}" />
	
	<div class="input_area">
		<label for="title"><spring:message code="board.title" /></label>
		<input type="text" id="title" name="title" value="${board.title}" required="required" />
	</div>
	
	<div class="input_area">
		<label for="writer"><spring:message code="board.writer" /></label>
		<input type="text" id="writer" name="writer" value="${board.writer}" required="required" />
	</div>
	
	<div class="input_area">
		<label for="content"><spring:message code="board.content" /></label>
		<textarea id="content" name="content" required="required" >${board.content}</textarea>
	</div>
	
	<div>
		<sec:authentication property="principal" var="pinfo" />
	
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button type="submit" id="modify" name="modify"><spring:message code="action.modify" /></button>
				<input type="submit" value="<spring:message code="action.remove" />" onclick="javascript: action='/board/remove';"/>
			</sec:authorize>
			
			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<c:if test="${pinfo.username eq board.writer}">
					<button type="submit" id="modify" name="modify"><spring:message code="action.modify" /></button>
					<input type="submit" value="<spring:message code="action.remove" />" onclick="javascript: action='/board/remove';"/>
				</c:if>
			</sec:authorize>
			
		<a href="/board/list${pgrq.toUriString()}"><input type="button" value="<spring:message code="action.list" />"></a>
			
	</div>
	
</form>