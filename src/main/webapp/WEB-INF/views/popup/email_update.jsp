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
	main{
		width: 400px;
		margin: 10px auto;
	    justify-content: center;
	    text-align: center;
	}
</style>
<script type="text/javascript">
	
	/* 이메일 유효성 검사 */
	function chk() {
		let email_update = document.email_update;
		let new_email = email_update.new_email.value;
		let regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(regex.test(new_email)){
			email_update.target='info_update';
			email_update.submit();
			window.close();
			
		}else{
			alert("올바른 이메일로 입력해주세요.");
		}
	}
</script>
</head>
<body>
	<main>
		<h3>이메일 변경</h3>
		<form action="${context}/updateInfo" name="email_update" method="post">
		<!--<input type="hidden" name="cmd" value="update">-->
			현재 이메일: <input type="text" name="email" value="${user.get().email}" required>
			<br><br>
			변경할 이메일: <input type="text" name="new_email" placeholder="새 이메일">
			<br><br>
			<input type="button" value="확인" onclick="chk()"> &nbsp;
			<input type="button" value="취소" onclick="window.close()">
	
		</form>
	</main>
</body>
</html>