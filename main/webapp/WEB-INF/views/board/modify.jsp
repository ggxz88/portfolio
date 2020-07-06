<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2></h2>

<form action="/board/modify" method="post">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="boardNo" value="${board.boardNo}" />

	<div class="input_area">
		<label for="title">제목</label>
		<input type="text" id="title" name="title" value="${board.title}" required="required" />
	</div>
	
	<div class="input_area">
		<label for="writer">작성자</label>
		<input type="text" id="writer" name="writer" value="${board.writer}" required="required" />
	</div>
	
	<div class="input_area">
		<label for="content">내용</label>
		<input type="text" id="content" name="content" value="${board.content}" required="required" />
	</div>
	
	<div>
		<sec:authentication property="principal" var="pinfo" />
	
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button type="submit" id="modify" name="modify">수정</button>
				<input type="submit" value="<spring:message code="action.remove" />" onclick="javascript: action='/board/remove';"/>
			</sec:authorize>
			
			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<c:if test="${pinfo.username eq board.writer}">
					<button type="submit" id="modify" name="modify">수정</button>
					<input type="submit" value="<spring:message code="action.remove" />" onclick="javascript: action='/board/remove';"/>
				</c:if>
			</sec:authorize>
			
		<a href="list"><input type="button" value="<spring:message code="action.list" />"></a>
			
	</div>
	
</form>