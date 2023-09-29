<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>예약완료</title>
<style type="text/css">
	main{
		width: 700px;
		margin: 10px auto;
		vertical-align: middle;
		text-align: center;
	}
	table{margin: 10px auto;}
	table,tr,th,td{ border: 1px solid black;}
	th,td{width: 100px;}
</style>
</head> 
<body>
<jsp:include page="common/header.jsp"/>
	<main>
		<p>예약 완료되었습니다.</p>

		<table>
			<tr><th>날짜</th><th>시간</th><th>인원</th></tr>
			<tr>
				<td>${reservation.reservation_date}</td>
				<td>${reservation.reservation_time}</td>
				<td>${reservation.people}</td>
			</tr>
		</table>
	</main>
<jsp:include page="common/footer.jsp"/>
</body>
</html>