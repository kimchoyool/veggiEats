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
<link href="${context}/resources/css/mypage.css" rel="stylesheet" media="all">

<title>마이페이지</title>
</head>
<body>
<jsp:include page="common/header.jsp"/>
	<main id="contents_myPage">
		<%@ include file="my_page_side.jsp" %>
		<div id="main">
			<div class="section">
				<p>&nbsp; 최근 예약 내역</p>
				<div>
					<table class="my_reservation">
						<tr><th>예약일</th><th>예약시간</th><th>식당명</th><th>예약인원</th><th>상태</th></tr>
						<c:forEach var="reservation" items="${reservation}">
							<tr style="cursor: pointer;" onclick="location.href='${context}/reservationInfo?no=${reservation.r_no}'">
								<td>${reservation.reservation_date}</td>
								<td>${reservation.reservation_time}</td>
								<td>${reservation.restaurantNameVO.r_name}</td>
								<td>${reservation.people}</td>
								<td>${reservation.state}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
    </main>
<jsp:include page="common/footer.jsp"/>
</body>
</html>