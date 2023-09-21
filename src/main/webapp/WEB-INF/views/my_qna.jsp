<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:8080/VeggiEats/common/css/mypage.css" rel="stylesheet" media="all">

<title>마이페이지</title>
</head>
<body>
	<main id="contents_myPage">
		<%@ include file="my_page_side.jsp" %>
		<div id="main">
			<div class="section">
				<p>&nbsp; Q&A 내역 </p>
				<div>
					<table class="my_page">
						<tr><th>Q&A 작성일</th><th>제목</th><th>답변상태</th><th>비고</th></tr>
						<tr><td>2023-05-05</td><td>식당 예약시...</td><td>확인중</td><td></td></tr>
						<tr><td>2023-05-05</td><td>질문질문질문</td><td>답변완료</td><td></td></tr>
						<tr><td>2023-05-05</td><td>식당 예약시...</td><td>확인중</td><td></td></tr>
						<tr><td>2023-05-05</td><td>질문질문질문</td><td>답변완료</td><td></td></tr>
						<tr><td>2023-05-05</td><td>식당 예약시...</td><td>확인중</td><td></td></tr>
						<tr><td>2023-05-05</td><td>질문질문질문</td><td>답변완료</td><td></td></tr>
					</table>
				</div>
			</div>
	
		</div>
    </main>
	<script type="text/javascript" src="http://localhost:8080/VeggiEats/common/js/join.js"></script>
</body>
</html>