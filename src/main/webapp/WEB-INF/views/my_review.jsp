<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
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
				<p>&nbsp; 식당 후기</p>
				<div>
					<table class="my_page">
						<tr><th>예약일</th><th>식당명</th><th>예약인원</th><th>상태</th></tr>
						<tr><td>2023-05-05</td><td>플랜트 연남점</td><td>2명</td><td>후기작성가능</td></tr>
						<tr><td>2023-05-05</td><td>플랜트 연남점</td><td>2명</td><td>후기작성완료</td></tr>
						<tr><td>2023-05-05</td><td>플랜트 연남점</td><td>2명</td><td>후기작성가능</td></tr>
						<tr><td>2023-05-05</td><td>플랜트 연남점</td><td>2명</td><td>후기작성완료</td></tr>
						<tr><td>2023-05-05</td><td>플랜트 연남점</td><td>2명</td><td>후기작성가능</td></tr>
						<tr><td>2023-05-05</td><td>플랜트 연남점</td><td>2명</td><td>후기작성완료</td></tr>
					</table>
				</div>
			</div>
		</div>
    </main>
<jsp:include page="common/footer.jsp"/>
	<script type="text/javascript" src="${context}/resources/js/join.js"></script>
</body>
</html>