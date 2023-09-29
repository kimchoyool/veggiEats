<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.format.DateTimeFormatterBuilder" %>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${context}/resources/css/board.css" rel="stylesheet" media="all">

<title>베지레시피</title>
<script type="text/javascript">
	function chk() {
		let id = '<%=session.getAttribute("ID") %>';
		if(id == 'null'){
			alert("로그인이 필요합니다.");
		}else{
			window.location.href='${context}/insertBoard';
		}
	}
</script>
</head>
<body>
<jsp:include page="common/header.jsp"/>
	<main id="contents_board">
		<table>
			<tr><th>번호</th><th>날짜</th><th>제목</th><th>작성자</th></tr>
			<!-- 클릭하면 해당 게시글페이지로 이동 -->
			<c:forEach var="board" items="${boardList}">
				<tr style="cursor: pointer;" onclick="location.href='${context}/board?no=${board.boardId}'">
					<td>${board.boardId}</td>
					<td>${board.createDate.toLocalDate()}</td>
					<td>${board.title} </td>
					<td>${board.memberId}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4" align="right">
					<button type="button" class="btn_board" onclick="chk()">글쓰기</button>
				</td>
			</tr>
		</table>
	</main>
<jsp:include page="common/footer.jsp"/>
<script type="text/javascript" src="${context}/resources/js/board.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
</html>