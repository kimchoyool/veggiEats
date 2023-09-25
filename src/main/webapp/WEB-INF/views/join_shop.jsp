<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${context}/resources/css/join.css" rel="stylesheet" media="all">

<title>회원가입</title>
</head>
<body>
	<main id="contents_join">
        <div id="join_word">기업회원 회원가입</div>
        <div id="join_inner">
            <div id="join_must"><span class="must">*</span> 필수입력사항</div>
            <!--라벨 인풋(text) 버튼 -->
			<form>
            <div id="join_detailed"> <!--회원가입정보 입력 -->
                <div id="join_id" class="join_div">
                    <label>아이디<span class="must">*</span></label>
					<div><!--placeholder..를 필요한 부분에만 넣으라는 피드백,, -->
                    	<input type="text" id="input_id" onkeydown="warning_id()" maxlength="12" oninput="this.value=this.value.replace(/[^a-z0-9]/g,'').replace(/(\..*)\./g, '$1');"/>
					</div>
                    <button type="button" >중복확인</button>
					
                </div>
				<div id="id_warning" class="warning"> <!--input에 입력시 뜨게 하기-->
						<p> 아이디는 6~12자의 영문,숫자만 사용 가능합니다. </p>
				</div>
                <div id="join_pw" class="join_div">
                    <label>비밀번호<span class="must">*</span></label>
					<div> <!-- 입력시 *로 입력되게? -->
                    	<input type="text" id="input_pw" onkeydown="warning_pw()" maxlength="12" oninput="this.value=this.value.replace(/[^a-z0-9]/g,'').replace(/(\..*)\./g, '$1');"/>
					</div>
                </div>
				<div id="pw_warning" class="warning"> <!--input에 입력시 뜨게 하기-->
					<p> 비밀번호는 6~12자의 영문,숫자만 사용 가능합니다. </p>
				</div>
                <div id="join_pw_chk" class="join_div">
                    <label>비밀번호확인<span class="must">*</span></label>
					<div>
                    	<input type="text" id="input_pw_chk" onkeyup="warning_pw_chk()" maxlength="12" oninput="this.value=this.value.replace(/[^a-z0-9]/g,'').replace(/(\..*)\./g, '$1');" >
					</div>
                </div>
				<div id="pw_chk_warning" class="warning"> <!--input에 입력시 뜨게 하기-->
					<p> 입력한 비밀번호와 일치하지 않습니다. </p>
				</div>
                <div id="join_name" class="join_div">
                    <label>이름<span class="must">*</span></label>
					<div>
                    	<input type="text" placeholder="">
					</div>
                </div>
                <div id="join_shopname" class="join_div">
                    <label>식당명<span class="must">*</span></label>
					<div>
                    	<input type="text" placeholder="">
					</div>
                </div>
				<div id="join_address" class="join_div">
                    <label>식당 주소<span class="must">*</span></label>
					<div>
                    	<input type="text" placeholder="">
					</div>
                </div>
                <!--<div id="join_email" class="join_div">
                    <label>이메일<span class="must">*</span></label>
					<div> type을 email로 해야하나? 
                    	<input type="text" id="email" placeholder="예: VeggiEats@VeggiEats.com" maxlength="50" onkeyup="email_chk()">
					</div>
                    <button type="button" >중복확인</button>
                </div>
				<div id="email_warning" class="warning"> input에 입력시 뜨게 하기
					<p> 올바른 이메일 주소를 입력하세요. </p>
				</div>-->
                <div id="join_phone" class="join_div">
                    <label>휴대폰<span class="must">*</span></label>
					<div>
                   		<input type="text" placeholder="숫자만 입력해주세요" maxlength="11" onkeydown="button_active()" oninput="this.value=this.value.replace(/[^0-9]/g,'').replace(/(\..*)\./g, '$1');"/>
					</div>
                    <button type="button" id="phone_button" disabled>인증번호 받기</button>
                    <!--입력하면 인증번호 버튼 활성화 -->
                </div>
                
            </div>
			</form>
				<div id="terms"> <!--이용약관동의 -->
					<label>이용약관동의<span class="must">*</span></label>
					<div id="terms_inner">
						<label><input type="checkbox" name="select_all" value="전체 동의" onclick="selectAll(this)">전체 동의합니다.</label><!--체크하면 전체 선택되게 하기 -->
						<label><input type="checkbox" name="terms" value="이용약관 동의" onclick="checkselectAll()">이용약관 동의<span>(필수)</span></label>
						<label><input type="checkbox" name="terms" value="개인정보 수집·이용 동의" onclick="checkselectAll()">개인정보 수집<span id="middot">&#149;</span>이용<span>(필수)</span></label>
						<label><input type="checkbox" name="terms" value="만14세 이상 동의" onclick="checkselectAll()">본인은 만 14세 이상입니다.<span>(필수)</span></label>
					</div>
				</div>
            <div id="join_btn"> <!--회원가입버튼 -->
                <button type="submit">가입하기</button>
            </div>
        </div>
    </main>

	<script type="text/javascript" src="${context}/resources/js/join.js"></script>
</body>
</html>