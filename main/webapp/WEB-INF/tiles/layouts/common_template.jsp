<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<head>
	<title><tiles:getAsString name="title" /></title>
</head>

<script src="/resources/js/jQuery-2.1.4.min.js"></script>

<body>

	<tiles:insertAttribute name="header" />
	
	<div align="center">
		<tiles:insertAttribute name="content" />
	</div>
	
</body>
</html>
