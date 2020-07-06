<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2></h2>

<form action="/board/read">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="boardNo" value="${board.boardNo}" />

	<div class="input_area">
		<label for="title">제목</label>
		<input type="text" id="title" name="title" value="${board.title}" required="required" readonly />
	</div>
	
	<div class="input_area">
		<label for="writer">작성자</label>
		<input type="text" id="writer" name="writer" value="${board.writer}" required="required" readonly />
	</div>
	
	<div class="input_area">
		<label for="content">내용</label>
		<input type="text" id="content" name="content" value="${board.content}" required="required" readonly />
	</div>
	
	<div>
		<sec:authentication property="principal" var="pinfo" />
	
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href='/board/modify?boardNo=${board.boardNo}'><input type="button" value="<spring:message code="action.edit" />"></a>
				<input type="submit" value="<spring:message code="action.remove" />" onclick="javascript: board.action='remove';"/>
			</sec:authorize>
			
			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<c:if test="${pinfo.username eq board.writer}">
					<a href='/board/modify?boardNo=${board.boardNo}'><input type="button" value="<spring:message code="action.edit" />"></a>
					<input type="submit" value="<spring:message code="action.remove" />" onclick="javascript: board.action='remove';"/>
				</c:if>
			</sec:authorize>
			
		<a href="list"><input type="button" value="<spring:message code="action.list" />"></a>
			
	</div>
	
</form>