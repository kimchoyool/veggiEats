/* 제이쿼리 불러오기 */
function loadJQuery() {
    var oScript = document.createElement("script");
    oScript.type = "text/javascript";
    oScript.charset = "utf-8";		  
    oScript.src = "http://code.jquery.com/jquery-3.6.4.js";	
    document.getElementsByTagName("head")[0].appendChild(oScript);
}
loadJQuery();


let chkNum = /[0-9]/;
let chkEnga = /[a-z]/;
let chkEngA = /[A-z]/;

var idck = 0; //중복=0, 사용가능=1
function warning_id(){ //id 유효성 검사
    idck = 0;
    console.log(idck);
    let warning = document.getElementById('id_warning');
    let input = document.getElementById('input_id');
        warning.style.display='block';
        let id_str = input.value;
        //영문숫자 포함인지 확인 후 길이 확인
        if(chkNum.test(id_str) && chkEnga.test(id_str) || chkEngA.test(id_str)){
        	if(6<=id_str.length && id_str.length<=12){ 
                warning.style.display='none';
            }
        }

}


/* 아이디 중복 검사 */
function idchk() {
    var id = $("#input_id").val();
    console.log(id);
	if(id==''){
		alert('아이디를 입력해주세요.');
	}
	$.ajax({
		async: true,
        type: 'POST',
        data: id,
        url: "idcheck.do",
        dataType: "json", 
        contentType: "application/json; charset=UTF-8",
        success: function(data){
        console.log(data);
            if(data.cnt>0){ //아이디가 존재할 경우
                alert('존재하는 아이디 입니다. 다른 아이디를 입력해주세요');
                $("#input_id").focus();
            }
            else{ //사용가능한 아이디인 경우
                alert('사용가능한 아이디 입니다.');
                $("#input_id").focus();
                idck=1;
            }
        },
        error: function(request,status,error){
            /*alert('error: '+error);*/
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
		
	});
}


function warning_pw(){ //pw 유효성 검사
    let warning = document.getElementById('pw_warning');
    let input = document.getElementById('input_pw');
        warning.style.display='block';
        let pw_str = input.value;
      //영문숫자 포함인지 확인 후 길이 확인
        if(chkNum.test(pw_str) && chkEnga.test(pw_str) || chkEngA.test(pw_str)){
        	if(6<=pw_str.length&&pw_str.length<=12){
                warning.style.display='none';
            }
        }
}

function warning_pw_chk(){ //pw 일치하는지 재입력확인
    let warning = document.getElementById('pw_chk_warning');
    let input_pw1 = document.getElementById('input_pw').value;
    
    warning.style.display='block';
 
    let input_pw2 = document.getElementById('input_pw_chk').value;
    //여기가 안읽혀서 위치를 block 이후로 바꿨는데 엔터를 쳐야만 마지막글자까지 넘어감...
    //해결: 이벤트를 onkeydown에서 onkeyup으로 바꿈

    if(input_pw1==input_pw2){ 
        warning.style.display='none';
    }
}

email_chk=function(){ //이메일 유효성 검사(제이쿼리 사용)
    let warning = $("#email_warning");
    let input_email = $("#email").val(); 
    let regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    console.log(input_email)
    if(regex.test(input_email)){
        console.log("올바른 이메일");
        warning.css('display','none');
        //warning.style.display='none';
    }else{
        console.log("올바른 이메일이 아님");
        warning.css('display','block');
        //warning.style.display='block';
    }
}

function button_active(){ //onkeydown 인증받기 버튼 활성화
    let button = document.querySelector('#phone_button');
    button.disabled=false;
    button.style.color='#00660e';
}

function selectAll(obj){ //전체선택
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');

    checkboxes.forEach((checkbox)=>{
        checkbox.checked=obj.checked
    });
}

function checkselectAll(){
    const checkboxes = document.querySelectorAll('input[name="terms"]');
    const checked = document.querySelectorAll('input[name="terms"]:checked');
    const select_all = document.querySelector('input[name="select_all"]');

    if(checkboxes.length===checked.length){
        select_all.checked=true;
    }else{
        select_all.checked=false;
    }

}


/* 이메일 중복 검사*/
function emailchk() {
	
}

function chk_join() {
	let warnings = document.getElementsByClassName('warning');
	for(i=0;i<warnings.length;i++){
        
		if(warnings[i].style.display=='block'){
			alert('필수 입력 사항을 전부 맞게 입력 해주세요');
			return false;
		}
        if(idck==0){
            alert('아이디 중복확인을 다시 해주세요.');
			return false;
        }
        else{
			return true;
		}
	}

}