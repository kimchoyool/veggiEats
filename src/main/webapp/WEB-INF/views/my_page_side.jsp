<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="context" value="${pageContext.request.contextPath}" /> 
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${context}/common/css/mypage.css" rel="stylesheet" media="all">

<title>마이페이지</title>
</head>
<body>
		<div id="side" >
			<ul id="side_nav">
				<li><a href="${context}/mypages.do">마이페이지</a></li>
				<li><a href="${context}/myReservation.do">예약내역확인</a></li>
				<li><a href="${context}/my_review.jsp">식당 후기</a></li>
				<li><a href="${context}/myboard.do">비건레시피 작성글</a></li>
				<li><a href="${context}/my_qna.jsp">Q&A</a></li>
				<li><a href="${context}/mypage.do">회원정보수정</a></li>
			</ul>
		</div>

	<script type="text/javascript" src="${context}/common/js/join.js"></script>
</body>
</html>