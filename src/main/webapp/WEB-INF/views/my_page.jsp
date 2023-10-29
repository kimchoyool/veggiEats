<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="context" value="${pageContext.request.contextPath}" /> 
<%
	request.setCharacterEncoding("utf-8");

	String id = (String)session.getAttribute("ID");
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
				<p>&nbsp; 최근 예약 내역 &nbsp;&nbsp;<a href="myReservation">더보기</a></p>
				<div>
					<table class="my_page">
						<tr><th>예약일</th><th>식당명</th><th>예약인원</th><th>상태</th></tr>
						<c:choose>
							<c:when test="${fn:length(reservation) > 5 }">
								<c:forEach var="reservation" items="${reservation}" begin="0" end="4">
									<tr style="cursor: pointer;" onclick="location.href='${context}/reservationInfo?no=${reservation.reservationNo}'">
										<td>${reservation.reservationDate}</td>
										<td>${reservation.restaurantName}</td>
										<td>${reservation.people}</td>
										<td>${reservation.state}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach var="reservation" items="${reservation}">
									<tr style="cursor: pointer;" onclick="location.href='${context}/reservationInfo?no=${reservation.reservationNo}'">
										<td>${reservation.reservationDate}</td>
										<td>${reservation.restaurantName}</td>
										<td>${reservation.people}</td>
										<td>${reservation.state}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
			<div class="section">
				<p>&nbsp; 식당 후기 &nbsp;&nbsp;<a href="my_review.jsp">더보기</a></p>
				<div>
					<table class="my_page">
						<tr><th>예약일</th><th>식당명</th><th>예약인원</th><th>상태</th></tr>
						<!-- 
						<tr><td>2023-05-05</td><td>플랜트 연남점</td><td>2명</td><td>후기작성가능</td></tr>
						<tr><td>2023-05-05</td><td>플랜트 연남점</td><td>2명</td><td>후기작성완료</td></tr>
						 -->
					</table>
				</div>
			</div>
			<div class="section">
				<p>&nbsp; 비건레시피 작성글 &nbsp;&nbsp;<a href="myBoard">더보기</a></p>
				<div>
					<table class="my_page">
						<tr><th>작성일</th><th>제목</th><th>조회수</th><th>추천수</th></tr>
						<c:choose>
							<c:when test="${fn:length(board) > 5 }">
								<c:forEach var="board" items="${board}" begin="0" end="4">
									<tr style="cursor: pointer;" onclick="location.href='${context}/board?no=${board.boardId}'">
										<td>${board.createDate.toLocalDate()}</td>
										<td>${board.title}</td>
										<td></td>
										<td></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach var="board" items="${board}">
									<tr style="cursor: pointer;" onclick="location.href='${context}/board?no=${board.boardId}'">
										<td>${board.createDate.toLocalDate()}</td>
										<td>${board.title}</td>
										<td></td>
										<td></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
		</div>
    </main>
	<jsp:include page="common/footer.jsp"/>
</body>
</html>