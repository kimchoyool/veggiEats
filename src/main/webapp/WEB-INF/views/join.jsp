<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="context" value="${pageContext.request.contextPath}" /> 
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${context}/resources/css/join.css" rel="stylesheet" media="all">

<title>회원가입</title>
</head>
<body>
	<main id="contents_join">
        <div id="join_word">개인회원 회원가입</div>
        <div id="join_inner">
            <div id="join_must"><span class="must">*</span> 필수입력사항</div>
            <!--라벨 인풋(text) 버튼 -->
			<form action="/join" method="post" onsubmit="return chk_join()">
            <div id="join_detailed"> <!--회원가입정보 입력 -->
                <div id="join_id" class="join_div">
                    <label>아이디<span class="must">*</span></label>
					<div><!--placeholder..를 필요한 부분에만 넣으라는 피드백,, -->
                    	<input type="text" id="input_id" name="M_id" onkeydown="warning_id()" maxlength="12" oninput="this.value=this.value.replace(/[^a-z0-9]/g,'').replace(/(\..*)\./g, '$1');" required/>
					</div>
                    <button type="button" onclick="idchk()">중복확인</button>
					
                </div>
				<div id="id_warning" class="warning"> <!--input에 입력시 뜨게 하기-->
						<p> 아이디는 영문,숫자 포함하여 6~12자로 입력 바랍니다. </p>
				</div>
                <div id="join_pw" class="join_div">
                    <label>비밀번호<span class="must">*</span></label>
					<div> <!-- 입력시 *로 입력되게? -->
                    	<input type="password" id="input_pw" name="M_password" onkeydown="warning_pw()" maxlength="12" oninput="this.value=this.value.replace(/[^a-z0-9]/g,'').replace(/(\..*)\./g, '$1');" required/>
					</div>
                </div>
				<div id="pw_warning" class="warning"> <!--input에 입력시 뜨게 하기-->
					<p> 비밀번호는 영문,숫자 포함하여 6~12자로 입력 바랍니다. </p>
				</div>
                <div id="join_pw_chk" class="join_div">
                    <label>비밀번호확인<span class="must">*</span></label>
					<div>
                    	<input type="password" id="input_pw_chk" onkeyup="warning_pw_chk()" maxlength="12" oninput="this.value=this.value.replace(/[^a-z0-9]/g,'').replace(/(\..*)\./g, '$1');" required >
					</div>
                </div>
				<div id="pw_chk_warning" class="warning"> <!--input에 입력시 뜨게 하기-->
					<p> 입력한 비밀번호와 일치하지 않습니다. </p>
				</div>
                <div id="join_name" class="join_div">
                    <label>이름<span class="must">*</span></label>
					<div>
                    	<input type="text" name="M_name" required>
					</div>
                </div>
                <div id="join_nname" class="join_div">
                    <label>닉네임<span class="must">*</span></label>
					<div>
                    	<input type="text" name="nick_name" required>
					</div>
                </div>
                <div id="join_email" class="join_div">
                    <label>이메일<span class="must">*</span></label>
					<div> <!--type을 email로 해야하나? -->
                    	<input type="text" id="email" name="email" placeholder="예: VeggiEats@VeggiEats.com" maxlength="50" onkeyup="email_chk()" required>
					</div>
                    <button type="button" onclick="emailchk()">중복확인</button>
                </div>
				<div id="email_warning" class="warning"> <!--input에 입력시 뜨게 하기-->
					<p> 올바른 이메일 주소를 입력하세요. </p>
				</div>
				<!-- 
                <div id="join_phone" class="join_div">
                    <label>휴대폰<span class="must">*</span></label>
					<div>
                   		<input type="text" placeholder="숫자만 입력해주세요" maxlength="11" onkeydown="button_active()" oninput="this.value=this.value.replace(/[^0-9]/g,'').replace(/(\..*)\./g, '$1');"/>
					</div>
                    <button type="button" id="phone_button" disabled>인증번호 받기</button>
                    입력하면 인증번호 버튼 활성화
                </div>
                 -->
                <div id="join_bday" class="join_div">
                    <label>생년월일</label>
                    <div><!--아예숫자만받기-->
                        <input type="text" name="YYYY" placeholder="YYYY" maxlength="4" oninput="this.value=this.value.replace(/[^0-9]/g,'').replace(/(\..*)\./g, '$1');"/>
                        <span>|</span>
                        <input type="text" name="MM" placeholder="MM" maxlength="2" oninput="this.value=this.value.replace(/[^0-9]/g,'').replace(/(\..*)\./g, '$1');"/>
                        <span>|</span>
                        <input type="text" name="DD" placeholder="DD" maxlength="2" oninput="this.value=this.value.replace(/[^0-9]/g,'').replace(/(\..*)\./g, '$1');"/>
                    </div>
                </div>
            </div>
				<div id="terms"> <!--이용약관동의 -->
					<label>이용약관동의<span class="must">*</span></label>
					<div id="terms_inner">
						<label><input type="checkbox" name="select_all" value="전체 동의" onclick="selectAll(this)" required>전체 동의합니다.</label><!--체크하면 전체 선택되게 하기 -->
						<label><input type="checkbox" name="terms" value="이용약관 동의" onclick="checkselectAll()" required>이용약관 동의<span>(필수)</span></label>
						<label><input type="checkbox" name="terms" value="개인정보 수집·이용 동의" onclick="checkselectAll()" required>개인정보 수집<span id="middot">&#149;</span>이용<span>(필수)</span></label>
						<label><input type="checkbox" name="terms" value="만14세 이상 동의" onclick="checkselectAll()" required>본인은 만 14세 이상입니다.<span>(필수)</span></label>
					</div>
				</div>
            <div id="join_btn"> <!--회원가입버튼  -->
                <button type="submit">가입하기</button>
            </div>
            </form>
        </div>
    </main>
	<%-- <script type="text/javascript" src="${context}/common/js/jquery-3.6.4.js"></script> --%>
	<script type="text/javascript" src="${context}/resources/js/join.js"></script>
</body>
</html>