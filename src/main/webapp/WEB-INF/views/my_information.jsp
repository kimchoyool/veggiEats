<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="context" value="${pageContext.request.contextPath}" /> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${context}/resources/css/mypage.css" rel="stylesheet" media="all">

<title>마이페이지</title>
<script type="text/javascript">
	window.name='info_update';
	function pwchk() {
		window.open('${context}/updatePw','pw_update','width=430,height=300,left=700,top=30,location=no,status=no,scrollbars=yes');
	}
	
	function nnamechg() {
		window.open('${context}/updateNickname','n_name_update','width=430,height=300,left=700,top=30,location=no,status=no,scrollbars=yes');
	}
	
	function emailchg() {
		window.open('${context}/updateEmail','email_update','width=430,height=300,left=700,top=30,location=no,status=no,scrollbars=yes');
	}
</script>
</head>
<body>
<jsp:include page="common/header.jsp"/>
	<main id="contents_myPage">
		<%@ include file="my_page_side.jsp" %>
		<div id="main">
			<div class="section">
				<p>&nbsp; 회원정보 조회 수정 </p>
				<div>
				<form>
					<table class="info">
					
						<tr><th>아이디</th><td><input type="text" value="${user.get().memberId}" readonly></td></tr>
						<tr><th>비밀번호</th><td><input type="password" value="${user.get().memberPassword}"></td><td><button type="button" onclick="pwchk()">수정</button> </td></tr>
						<tr><th>이름</th><td><input type="text" value="${user.get().memberName}" readonly></td></tr>
						<tr><th>닉네임</th><td><input type="text" value="${user.get().nickname}" ></td><td><button type="button" onclick="nnamechg()">수정</button></tr>
						<tr><th>이메일</th><td><input type="text" value="${user.get().email}" ></td><td><button type="button" onclick="emailchg()">수정</button></tr>
						<tr><th>생년월일</th><td><input type="text" value="${user.get().birthday}" readonly></td></tr>
						<tr><td colspan="2"><a href="${context}/delete" id="out">회원탈퇴</a></td></tr>
					
					</table>
				</form>
				</div>
			</div>
		</div>
    </main>
<jsp:include page="common/footer.jsp"/>
	<script type="text/javascript" src="${context}/resources/js/my_information.js"></script>
</body>
</html>
