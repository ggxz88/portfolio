<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
	<title><tiles:getAsString name="title" /></title>
	<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
    <link type="text/css" rel="stylesheet" href="<spring:url value='/resources/css/style.css'/>">
</head>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<body>

	<tiles:insertAttribute name="header" />
	
	<tiles:insertAttribute name="menu" />
	
	<div align="center">
		<tiles:insertAttribute name="content" />
	</div>
	
	<tiles:insertAttribute name="footer" />

</body>
</html>
