<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		width: 400px;
		margin: 10px auto;
	    justify-content: center;
	    text-align: center;
	}
</style>
<script type="text/javascript">
	
	/* 아이디 중복 검사 */
	function idchk(){
		let id_chk = document.id_chk;
		let id = id_chk.id.value;
		if(id==null){
			alert("중복검사할 아이디를 입력해주세요.");
		}else{
			alert("사용가능한 아이디 입니다.");
		}
	}
	
</script>
</head>
<body>
	<main>
		<h3>아이디 중복 검사</h3>
		<form action="" name="id_chk" method="post">
			<!-- 검사할 아이디 입력 받는 곳 / 중복 여부에따라서 보여줄 곳 작성하기 여기는 컨트롤러를 거쳐서 어떻게..?DTO를 따로 만들어야하나 -->
			<input type="text" placeholder="아이디 입력" name="id">
			<input type="button" value="확인" onclick="idchk()"> &nbsp;
			<input type="button" value="닫기" onclick="window.close()">
	
		</form>
	</main>
</body>
</html>