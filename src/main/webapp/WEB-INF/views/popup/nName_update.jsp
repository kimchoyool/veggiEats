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
	
	function chk() {
		let nName_update = document.nName_update;
		nName_update.target='info_update';
		nName_update.submit();
		window.close();
	}
</script>
</head>
<body>
	<main>
		<h3>닉네임 변경</h3>
		<form action="${context}/updateInfo" name="nName_update" method="post">
		<!-- <input type="hidden" name="cmd" value="update"> -->
			현재 닉네임: <input type="text" name="n_name" value="${user.get().nickname}" required>
			<br><br>
			변경할 닉네임: <input type="text" name="new_n_name" placeholder="새 닉네임">
			<br><br>
			<input type="button" value="확인" onclick="chk()"> &nbsp;
			<input type="button" value="취소" onclick="window.close()">
	
		</form>
	</main>
</body>
</html>