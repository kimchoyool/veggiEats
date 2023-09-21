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
		width: 700px;
		margin: 10px auto;
		vertical-align: middle;
		text-align: center;
	}
	table{margin: 10px auto;}
	table,tr,th,td{
		border: 1px solid black;
		text-align: center;
	}
	th,td{width: 100px;}
	input{width: 140px;}
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
	<main>
		<h3>예약 내역</h3>
		<form action="${context}/reservationInfo.do" method="post">
			<table>
				<tr>
					<th>예약번호</th><th>예약일</th><th>예약시간</th><th>식당명</th><th>예약인원</th><th>상태</th>
				</tr>
				<tr>
					<td><input type="text" name="rno" value="${reservation.r_no}" readonly></td>
					<td>${reservation.reservation_date}</td>
					<td>${reservation.reservation_time}</td>
					<td>${reservation.restaurantNameVO.r_name}</td>
					<td>${reservation.people}</td>
					<td>${reservation.state}</td>
				</tr>
			</table>
			<br>
			<button type="submit">예약취소</button> &nbsp;
		</form>
	</main>
</body>
</html>