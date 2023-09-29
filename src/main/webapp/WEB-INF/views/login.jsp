<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="context" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${context}/resources/css/login.css" rel="stylesheet" media="all">
<title>로그인</title>
</head>
<body>
<jsp:include page="common/header.jsp"/>
	<main>
		<div id="contents_login">
			<div id="login_w">
				로그인
			</div>
			<div id="login_box">
				<form action="/login" method="post" enctype="application/x-www-form-urlencoded">
					<div id="idpw">
						<input type="text" name="Member_id" placeholder="아이디" >
						<input type="password" name="Member_password" placeholder="비밀번호">
					</div>
					<div id="find">
						<a href="#">아이디 찾기</a>
						<span>|</span>
						<a href="#">비밀번호 찾기</a>
					</div>
					<div id="button">
						
						<input type="submit" value="로그인" class="btn">
						<a href="${context}/join">
							<button type="button" class="btn">
								회원가입</span>
							</button>
						</a>
					</div>
				</form>
			</div>
		</div>
	</main>
	<jsp:include page="common/footer.jsp"/>
</body>
</html>