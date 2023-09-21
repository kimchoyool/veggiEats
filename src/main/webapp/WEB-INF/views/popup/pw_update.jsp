<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
	
	/* 현재 비밀번호 맞는지도 확인, 새비번 똑같이 입력했는지 확인 여기서 값이 안넘어가지나..?*/
	/* 
		수정완료 후 팝업창(이거)이 안닫히고 개인정보조회 창으로 넘어가는게 모델에서 view를 개인정보 조회로 넘기기 때문 인것같음,,,,
		부모창의 이름을 설정하고 자식창에서 form button 확인 > 유효성검사 > 통과하면 target을 부모장의 이름으로 하고 submit()하고 자식 창 닫기
	*/
	function chk() {
		let pw_update = document.pw_update;
		let pw = pw_update.pw.value;
		let new_pw = pw_update.new_pw.value;
		let new_pw_chk = pw_update.new_pw_chk.value;
		
		if(pw=="<c:out value='${user.m_password}'/>"){ 
			console.log(<c:out value='${user.m_password}'/>);
			if(new_pw===new_pw_chk){
				alert("비밀번호가 수정되었습니다.");
				
				pw_update.target='info_update';
				pw_update.submit();
				window.close();

				//self.close();
			}else if(new_pw!=new_pw_chk){
				alert("새 비밀번호를 똑같이 입력해주세요");
			}else{
				alert("새 비밀번호를 기존 비밀번호와 다르게 입력해주세요.");
			}
		}else{
			alert("현재 비밀번호를 다시 입력해주세요");
		}
	}
</script>
</head>
<body>
	<main>
		<h3>비밀번호 변경</h3>
		<!-- action="부모창.jsp" http://localhost:8080/VeggiEats/Veggieats -->
		<form action="http://localhost:8080/VeggiEats/updatePw.do" name="pw_update" method="post">
		<!--<input type="hidden" name="cmd" value="update">-->
			<input type="text" name="pw" placeholder="현재 비밀번호">
			<br><br>
			<input type="text" name="new_pw" placeholder="새 비밀번호">
			<br>
			<input type="text" name="new_pw_chk" placeholder="새 비밀번호 확인">
			<br>
			<br>
			<input type="button" value="확인" onclick="chk()"> &nbsp;
			<input type="button" value="취소" onclick="window.close()">
	
		</form>
	</main>
</body>
</html>