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
<link href="${context}/common/css/login.css" rel="stylesheet" media="all">
<title>로그인</title>
</head>
<body>
	<main>
		<div id="contents_login">
			<div id="login_w">
				<spring:message code="message.user.login.title"/><br>
				<spring:message code="message.user.login.name"/>
			</div>
			<div id="login_box">
				<form action="${context}/login.do" method="post">
					<div id="idpw">
						<input type="text" name="M_id" placeholder=" <spring:message code="message.user.login.id"/>" >
						<input type="password" name="M_password" placeholder=" <spring:message code="message.user.login.password"/>">
					</div>
					<div id="find">
						<a href="#"><spring:message code="message.user.login.findID"/></a>
						<span>|</span>
						<a href="#"><spring:message code="message.user.login.findPassword"/></a>
					</div>
					<div id="button">
						
						<input type="submit" value="<spring:message code="message.user.login.title"/>" class="btn">	
						<a href="${context}/join.do">
							<button type="button" class="btn">
								<span><spring:message code="message.user.login.register"/></span>
							</button>
						</a>
					</div>
				</form>
			</div>
		</div>
	</main>
</body>
</html>