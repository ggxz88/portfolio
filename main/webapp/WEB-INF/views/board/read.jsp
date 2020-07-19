<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2><spring:message code="board.header.read" /></h2>

<form id="read" action="/board/read">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="boardNo" value="${board.boardNo}" />
	<input type="hidden" name="page" value="${pgrq.page}" />
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}" />
	<input type="hidden" name="searchType" value="${pgrq.searchType}" />
	<input type="hidden" name="keyword" value="${pgrq.keyword}" />

	<div class="input_area">
		<label for="title"><spring:message code="board.title" /></label>
		<input type="text" id="title" name="title" value="${board.title}" readonly />
	</div>
	
	<div class="input_area">
		<label for="writer"><spring:message code="board.writer" /></label>
		<input type="text" id="writer" name="writer" value="${board.writer}" readonly />
	</div>
	
	<div class="input_area">
		<label for="content"><spring:message code="board.content" /></label>
		<textarea id="content" name="content" readonly >${board.content}</textarea>
	</div>
	
	<div>
		<sec:authentication property="principal" var="pinfo" />
	
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href='/board/modify${pgrq.toUriString()}&boardNo=${board.boardNo}'><input type="button" value="<spring:message code="action.edit" />"></a>
				<input type="submit" value="<spring:message code="action.remove" />" onclick="javascript: action='/board/remove'; method='post'; "/>
			</sec:authorize>
			
			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<c:if test="${pinfo.username eq board.writer}">
					<a href='/board/modify${pgrq.toUriString()}&boardNo=${board.boardNo}'><input type="button" value="<spring:message code="action.edit" />"></a>
					<input type="submit" value="<spring:message code="action.remove" />" onclick="javascript: action='/board/remove'; method='post';"/>
				</c:if>
			</sec:authorize>
			
		<a href="/board/list${pgrq.toUriString()}"><input type="button" value="<spring:message code="action.list" />"></a>
			
	</div>
	
	<h3 align="left">댓글</h3>
	<div align="left">
		<c:choose>
			<c:when test="${empty replyList}">
				<div>
					<spring:message code="common.listEmpty" />
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${replyList}" var="replylist">
					<div>
						작성자 : ${replylist.replyWriter}
						작성 일자 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${replylist.regDate}" />	
					</div>	
					<div>
						${replylist.replyContent}
					</div>
					<br>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div>
		<div class="input_area">
			<label for="replyWriter"><spring:message code="reply.writer" /></label>
			<input type="text" id="replyWriter" name="replyWriter" required="required" />
		</div>
		
		<div class="input_area">
			<label for="replyContent"><spring:message code="reply.content" /></label>
			<input type="text" id="replyContent" name="replyContent" required="required" />
		</div>
		
		<input type="submit" value="<spring:message code="action.register" />" onclick="javascript: action='/board/replyregister'; method='post'; location.reload(); " />
		
	</div>

</form>

