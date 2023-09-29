<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
<style type="text/css">
	main{
		width: 700px;
		margin: 10px auto;
		justify-content: center;
		text-align: center;
	}
	button{
		width: 100px;
		height: 30px;
		font-family: Pretendard-Regular;
		background: rgba(0,102,14,0.8);
		border-radius: 5px;
		border: 2px solid white;
		cursor: pointer;
		color: white;
		margin: 10px 0 10px 0;
		transition: background 0.3s ease-in-out,
				color 0.3s ease-in-out;
	}
	button:hover{
		background: white;
		color: #00660e;
	}
</style>
</head>
<body>
<jsp:include page="common/header.jsp"/>
	<main>
		<h3>환영합니다. 회원 가입이 되었습니다.</h3>
		<a href="${context}/login">
		<button type="button">로그인</button>
		</a>
	</main>
<jsp:include page="common/footer.jsp"/>
</body>
</html>