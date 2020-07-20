<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2><spring:message code="item.header.read" /></h2>

<form id="itemread" action="/item/read">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="itemId" value="${item.itemId}" />
	<input type="hidden" name="page" value="${pgrq.page}" />
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}" />
	<input type="hidden" name="keyword" value="${pgrq.keyword}" />

	<div class="input_area">
		<label for="itemName"><spring:message code="item.itemName" /></label>
		<input type="text" id="itemName" name="itemName" value="${item.itemName}" readonly />
	</div>
	
	<div class="input_area">
		<label for="price"><spring:message code="item.itemPrice" /></label>
		<input type="text" id="price" name="price" value="${item.price}" readonly />
	</div>
	
	<div class="input_area">
		<label for="preview"><spring:message code="item.preview" /></label>
		<img src="display?itemId=${item.itemId}" width="210" height="240" id="preview" name="preview">
	</div>
	
	<div class="input_area">
		<label for="description"><spring:message code="item.itemDescription" /></label>
		<textarea id="description" name="description" readonly >${item.description}</textarea>
	</div>
	
	<div>
		<input type="submit" value="<spring:message code="action.buy" />" onclick="javascript: action='/item/buy'; method='post'; "/>
		<input type="submit" value="<spring:message code="action.cartadd" />" onclick="javascript: action='/item/cartadd'; method='post'; "/>
		<a href="/item/list${pgrq.toItemUriString()}"><input type="button" value="<spring:message code="action.list" />"></a>
			
	</div>
	
	<h3 align="left">후기</h3>
	<div align="left">
		<c:choose>
			<c:when test="${empty reviewList}">
				<div>
					<spring:message code="common.listEmpty" />
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${reviewList}" var="reviewList">
					<div>
						작성자 : ${reviewList.reviewWriter}
						작성 일자 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${reviewList.regDate}" />	
					</div>	
					<div>
						${reviewList.reviewContent}
						<sec:authentication property="principal" var="pinfo" />
						
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<button type="button" class="reviewremove" data-rno="${reviewList.reviewNo}"><spring:message code="action.remove" /></button>
						</sec:authorize>
						
						<sec:authorize access="hasRole('ROLE_MEMBER')">
							<c:if test="${pinfo.username eq reviewList.reviewWriter}">
								<button type="button" class="reviewremove" data-rno="${reviewList.reviewNo}"><spring:message code="action.remove" /></button>
							</c:if>
						</sec:authorize>
						
						<script>
							$(".reviewremove").click(function(){
							   self.location = "/item/reviewremove${pgrq.toItemUriString()}&itemId=${item.itemId}"
							    + "&reviewNo=" + $(this).attr("data-rno");        
							  });
						</script>
					</div>
					<br>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div>
		<div class="input_area">
			<label for="reviewContent"><spring:message code="review.content" /></label>
			<input type="text" id="reviewContent" name="reviewContent" />
		</div>
		
		<input type="submit" id="reviewregister" value="<spring:message code="action.register" />" onclick="javascript: action='/item/reviewregister'; method='post';" />
		
	</div>
	
</form>