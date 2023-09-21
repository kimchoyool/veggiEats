<%@ page import="com.java.veggieats.board.dto.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="loginID" value="${ID}" />
<c:set var="boardID" value="${board.get().m_id}" />
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
<script type="text/javascript" src="${context}/resources/js/jquery-3.6.4.js"></script>
<title>베지레시피</title>
</head>
<body>
<jsp:include page="common/header.jsp"/>
	<main id="contents_board">
	<%-- <form action="/boardUpdate.do" method="get">
	<input type="hidden" name="board_id" value="${board.board_id}"> --%>
		<table id="content">
			<tr>
				<th>작성일</th><td>${board.get().create_date}</td>
			</tr>
			<tr>
				<th>작성자</th><td>${board.get().m_id}</td>
			</tr>
			<tr>
				<th>제목</th><td>${board.get().title}</td>
			</tr>
			<tr>
				<th>내용</th><td>${board.get().content}</td>
			</tr>
			<tr>
				<td><button type="button" class="btn_board" onclick="location.href='${context}/boardList'">목록</button></td>
				<!--   if(board.getM_id().equals(id)){ 
					session.setAttribute("ID", id);-->
				<c:if test="${loginID eq boardID}" >
				<td>
					<button type="button" class="btn_board" onclick="location.href='${context}/updateBoard?no=${board.get().board_id}'">수정</button>&nbsp;
					<button type="button" class="btn_board" onclick="location.href='${context}/deleteBoard?no=${board.get().board_id}'">삭제</button>
				</td>
				</c:if>
			</tr>
		</table>
		</form>
	</main>
<jsp:include page="common/footer.jsp"/>
<script type="text/javascript" src="${context}/resources/js/board.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
</html>