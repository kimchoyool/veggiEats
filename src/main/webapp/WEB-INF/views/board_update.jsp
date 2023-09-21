<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${context}/common/css/board.css" rel="stylesheet" media="all">
<script type="text/javascript" src="${context}/common/js/jquery-3.6.4.js"></script>
<title>베지레시피</title>
</head>
<body>
	<main id="contents_board">
	<!-- 제목 , 내용 -->
	<form action="updateBoard.do" method="post">
	<input type="hidden" name="board_id" value="${board.board_id}">
	<table id="write">
		<tr><td><input type="text" name="title" maxlength="50" placeholder="제목" value="${board.title}" required></td></tr>
		<tr><td><textarea name="content" placeholder="내용" required>${board.content}</textarea></td></tr>
		<tr><td align="right"><button type="submit" class="btn">수정</button></td></tr>
	
	</table>
	</form>
	</main>

<script type="text/javascript" src="${context}/common/js/board.js?v=<%=System.currentTimeMillis() %>"></script>

</body>
</html>