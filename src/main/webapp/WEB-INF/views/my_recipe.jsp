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
				<p>&nbsp; 비건레시피 작성글</p>
				<div>
					<table class="my_page">
						<tr><th>작성일</th><th>제목</th><th>조회수</th><th>추천수</th></tr>
						<c:forEach var="board" items="${board}">
							<tr style="cursor: pointer;" onclick="location.href='${context}/board?no=${board.boardId}'">
								<td>${board.createDate.toLocalDate()}</td>
								<td>${board.title}</td>
								<td></td>
								<td></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
    </main>
	<jsp:include page="common/footer.jsp"/>
	<script type="text/javascript" src="${context}/resources/js/join.js"></script>
</body>
</html>