<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="context" value="${pageContext.request.contextPath}" /> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${context}/common/css/mypage.css" rel="stylesheet" media="all">

<title>마이페이지</title>
<script type="text/javascript">
	window.name='info_update';
	function pwchk() {
		window.open('http://localhost:8080/VeggiEats/updatePw.do','pw_update','width=430,height=300,left=700,top=30,location=no,status=no,scrollbars=yes');
	}
	
	function nnamechg() {
		window.open('http://localhost:8080/VeggiEats/updateNickName.do','n_name_update','width=430,height=300,left=700,top=30,location=no,status=no,scrollbars=yes');
	}
	
	function emailchg() {
		window.open('http://localhost:8080/VeggiEats/updateEmail.do','email_update','width=430,height=300,left=700,top=30,location=no,status=no,scrollbars=yes');
	}
</script>
</head>
<body>
	<main id="contents_myPage">
		<%@ include file="my_page_side.jsp" %>
		<div id="main">
			<div class="section">
				<p>&nbsp; <spring:message code="message.user.information.title"/> </p>
				<div>
				<form>
					<table class="info">
					
						<tr><th><spring:message code="message.user.information.id"/></th><td><input type="text" value="${user.m_id}" readonly></td></tr>
						<tr><th><spring:message code="message.user.information.password"/></th><td><input type="password" value="${user.m_password}"></td><td><button type="button" onclick="pwchk()"><spring:message code="message.user.information.update"/></button> </td></tr>
						<tr><th><spring:message code="message.user.information.name"/></th><td><input type="text" value="${user.m_name}" readonly></td></tr>
						<tr><th><spring:message code="message.user.information.nickName"/></th><td><input type="text" value="${user.nick_name}" ></td><td><button type="button" onclick="nnamechg()"><spring:message code="message.user.information.update"/></button></tr>
						<tr><th><spring:message code="message.user.information.email"/></th><td><input type="text" value="${user.email}" ></td><td><button type="button" onclick="emailchg()"><spring:message code="message.user.information.update"/></button></tr>
						<tr><th><spring:message code="message.user.information.birth"/></th><td><input type="text" value="${user.birth}" readonly></td></tr>
						<tr><td colspan="2"><a href="${context}/delete.do" id="out"><spring:message code="message.user.information.unregister"/></a></td></tr>
					
					</table>
				</form>
				</div>
			</div>
			
		</div>
    </main>

	<script type="text/javascript" src="${context}/common/js/my_information.js"></script>
</body>
</html>
