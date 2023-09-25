<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${context}/resources/css/join.css" rel="stylesheet" media="all">

<title>회원가입</title>
</head>
<body>

	<main id="contents_join_btn">
		<div>
			<div><button type="button"> <a href="${context}/join"><p>개인</p><p>회원가입</p></a></button></div>
        	<div><button type="button"> <p>기업</p><p>회원가입</p></button></div>
		</div>
		
    </main>

	<script type="text/javascript" src="${context}/resources/js/join.js"></script>
</body>
</html>