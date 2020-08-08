<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="coin.header.chargeCoin" /></h2>

<form id="charge" action="/coin/charge" method="post" >

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

	<div class="input_area">
		<label for="amount"><spring:message code="coin.charge" /></label>
		<input type="text" id="amount" name="amount" required="required" />
	</div>
	
	<button type="submit" id="charge" name="charge"><spring:message code="action.register" /></button>
	<a href="/coin/list"><input type="button" value="<spring:message code="action.list" />"></a>
	
</form>