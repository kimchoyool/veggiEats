<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="context" value="${pageContext.request.contextPath}" /> 
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#list{
		width: 700px;
		margin: 10px auto;
		text-align: center;
	}
	table{
		width: 700px;
		border: 1px solid black;
		border-collapse: collapse;
	}
	tr,th,td{
		border: 2px solid black;
	}
</style>
</head>
<body>
	<div id="list">
		<h3>회원 리스트</h3>
		<table>
			<tr><th>아이디</th><th>비밀번호</th><th>이름</th><th>닉네임</th><th>이메일</th><th>생일</th></tr>
			<c:forEach var="user" items="${userlist}" varStatus="i">
			<tr>
				<td><c:out value="${user.m_id}"/></td>
				<td><c:out value="${user.m_password}"/></td>
				<td>${user.m_name}</td>
				<td>${user.nick_name}</td>
				<td>${user.email}</td>
				<td>${user.birth}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>