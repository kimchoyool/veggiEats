<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${context}/resources/css/board.css" rel="stylesheet" media="all">
<script type="text/javascript" src="${context}/resources/js/jquery-3.6.4.js"></script>
<title>베지레시피</title>
</head>
<body>
<jsp:include page="common/header.jsp"/>
	<main id="contents_board">
	<!-- 제목 , 내용 -->
	<form action="/boardWrite" method="post" enctype="multipart/form-data">
	<!--<input type="hidden" name="cmd" value="board_write">-->
	<table id="write">
		<tr><td><input type="text" name="title" maxlength="50" placeholder="제목" required></td></tr>
		<tr><td><textarea name="content" placeholder="내용" required></textarea></td></tr>
		<tr><td>업로드 <input type="file" name="uploadFile"></td></tr>
		<tr><td align="right"><button type="submit" class="btn" >작성(올리기)</button></td></tr>
	
	</table>
	</form>
	</main>
<jsp:include page="common/footer.jsp"/>
<script type="text/javascript" src="${context}/resources/js/board.js?v=<%=System.currentTimeMillis() %>"></script>

</body>
</html>