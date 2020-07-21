<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2><spring:message code="reply.header.modify" /></h2>

<form id="modify" action="/board/replymodify" method="post">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="boardNo" value="${reply.boardNo}" />
	<input type="hidden" name="replyNo" value="${reply.replyNo}" />
	<input type="hidden" name="page" value="${pgrq.page}" />
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}" />
	<input type="hidden" name="searchType" value="${pgrq.searchType}" />
	<input type="hidden" name="keyword" value="${pgrq.keyword}" />
	
	
	<div class="input_area">
		<label for="replyContent"><spring:message code="reply.content" /></label>
		<input type="text" id="replyContent" name="replyContent" value="${reply.replyContent}" />
	</div>
		
	<div>
		<sec:authentication property="principal" var="pinfo" />
	
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button type="submit" id="modifybtn" name="modify"><spring:message code="action.modify" /></button>
			</sec:authorize>
			
			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<c:if test="${pinfo.username eq reply.replyWriter}">
					<button type="submit" id="modifybtn" name="modify"><spring:message code="action.modify" /></button>
				</c:if>
			</sec:authorize>
				
	</div>		
	
</form>