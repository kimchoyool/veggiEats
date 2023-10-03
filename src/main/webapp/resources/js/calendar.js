const table = document.querySelector("table");
for(let i=0; i<7;i++){ //요일 행까지 미리 만들기 8줄
    let tr = document.createElement("tr");
    table.append(tr);
}
//요일 tr 생성
let week=['일','월','화','수','목','금','토'];

let first = document.querySelector("table tr:first-child");
for(let i=0;i<7;i++){
    let th = document.createElement("th");
    first.append(th);
}
first.style.background='rgba(0,102,14,0.5)';

let select_th =document.querySelectorAll("th");
select_th.forEach((el,index)=>{
    el.append(week[index]);
});


//일자 들어갈 td 생성
let rest = document.querySelectorAll("table tr:not(:first-child)");
rest.forEach((el,index)=>{
    for(let i=0;i<7;i++){
        let td = document.createElement("td");
        el.append(td);
    }
});

//tr[i]의 첫번째 td는 red 마지막 td는 blue
for(let i=0;i<rest.length;i++){ 
    let first_tds = document.querySelectorAll("tr td:first-child");
    let last_tds = document.querySelectorAll("tr td:last-child");
    first_tds[i].style.color='red';
    last_tds[i].style.color='blue';
}

let now = new Date(); //오늘날짜

let year = now.getFullYear();
let month = now.getMonth(); //+1을 해야하나?

let calendar_mark = document.querySelector("#calendar_ymb>p");

//let lastMDay = new Date(now.getFullYear(),now.getMonth(),0).getDate();
//당월의 첫째날 요일 substring(0,3)===Sun:0 ~Sat:6에서 시작

//td 날짜 추가
let select_td=document.querySelectorAll("td");
let select_td_len = select_td.length;
//console.log(select_td_len); //42
//console.log(bin); //6
let day = now.getDate(); //now.getDate() 오늘날짜
let bin = 0;

console.log("월: "+month+" now: "+now.getMonth());
console.log(typeof month);
console.log(typeof now.getMonth());
console.log("월일치 "+ month == now.getMonth());
console.log("년: "+year+" now: "+now.getFullYear());
console.log("원,연도일치여부: "+month==now.getMonth() && year==now.getFullYear());

function calendar(){
    if(month<0){ 
        let y = new Date(year,month).getFullYear(); 
        let m = new Date(year,month).getMonth()+1;
        calendar_mark.innerHTML=y+"년 "+m+"월";
    }else{
        calendar_mark.innerHTML=year+"년 "+(month+1)+"월"; 
    }
	    
	//당월의 첫째날 ex. Sat Apr 01 2023 ,,,
	let startDay = new Date(year,month,1);
	//당월의 마지막날
	let lastDay = new Date(year,month+1,0).getDate();
    let start  = startDay.toString().substring(0,3); //Sat,, 
    
    //let bin = 0;
    if(start==="Sun"){
        bin=0;
    }else if(start==="Mon"){
        bin=1;
    }else if(start==="Tue"){
        bin=2;
    }else if(start==="Wed"){
        bin=3;
    }else if(start==="Thu"){
        bin=4;
    }else if(start==="Fri"){
        bin=5;
    }else if(start==="Sat"){
        bin=6;
    }


    //
    select_td.forEach(el=>{
        el.innerHTML="";
    });
    //일자 입력
    for(let i=0;i<lastDay;i++){
	    select_td[bin+i].innerHTML=i+1;

	    //오늘 날짜에 표시
	    if(year==now.getFullYear() && month==now.getMonth() && i===day){ 
	        select_td[bin+i-1].className='today';
	        select_td[bin+i-1].style.background='rgba(0,102,14,0.5)';
	        select_td[bin+i-1].style.borderRadius='50%';
	        select_td[bin+i-1].style.color='white';
	        
	    }else{
            console.log(select_td[bin+i-1]);
            console.log(select_td);
            console.log(bin+i-1);
            if(bin+i-1>0){
                if(select_td[bin+i-1].classList=='today'){
                    select_td[bin+i-1].classList.remove('today');
                    select_td[bin+i-1].style.background='';
                    select_td[bin+i-1].style.color='';
                }
            }else if(select_td[bin+i].classList=='today'){
                select_td[bin+i].classList.remove('today');
                select_td[bin+i].style.background='';
                select_td[bin+i].style.color='';
            }
	    }
	    //해당 월 이전 날짜 클래스 부여해서 css처리함
	    if(year==now.getFullYear() && month==now.getMonth() && i<day){
            if(bin+i-1>0){
                select_td[bin+i-1].className='prevday';
            }else{
                select_td[bin+i].className='prevday';
            }

		}else{
			//이전날짜가 아닌데 클래스 이름이 prevday면 remove하기
            if(bin+i-1>0){
                if(select_td[bin+i-1].classList=='prevday'){
                    select_td[bin+i-1].classList.remove('prevday');
                }
            }else{
                if(select_td[bin+i].classList=='prevday'){
                    select_td[bin+i].classList.remove('prevday');
                }
            }

		}
	}
    
    let v;
    let nowmonth = now.getMonth();
    for(let td of select_td){
    	let cnt = bin;
    	/*
    	console.log("월: "+month+" now: "+now.getMonth());
    	console.log(typeof month);
    	console.log(typeof now.getMonth());
    	console.log("월일치 "+ month === now.getMonth());
    	console.log("년: "+year+" now: "+now.getFullYear());
    	console.log("원,연도일치여부: "+month==now.getMonth() && year==now.getFullYear());
    	*/
    	if(month==now.getMonth() && year==now.getFullYear() ){
    		cnt = day-1+bin;
    	}
    	console.log("cnt: "+cnt);
    	for(let j=cnt; j<select_td_len; j++){
    		//달력 넘겼을 때 선택 초기화
    		if(select_td[j].style.background=='rgb(0, 102, 14)'){
    	    	select_td[j].style.background="";
    	    	select_td[j].style.color="";
    			}
    		select_td[j].addEventListener("click",function(event){
    			for(let i=cnt; i<select_td_len; i++){

    				if(select_td[i].style.background=='rgb(0, 102, 14)'){
    		    	select_td[i].style.background="";
    		    	select_td[i].style.color="";
    				}
    				if(select_td[i].classList=='today'){
    					select_td[i].style.background="";
    			    	select_td[i].style.color="";
    				}
    			}
    			
    			//주말 표시
    			for(let i=0;i<rest.length;i++){ 
    			    let first_tds = document.querySelectorAll("tr td:first-child");
    			    let last_tds = document.querySelectorAll("tr td:last-child");
    			    first_tds[i].style.color='red';
    			    last_tds[i].style.color='blue';
    			}
    			
    			select_td[j].style.background='#00660e';
    			select_td[j].style.borderRadius='50%';
    			select_td[j].style.color='white';
    		    //선택한 날짜 불러오기 innetHtml, innerText로는 안불러와짐,,
    		    v = select_td[j].textContent;
    		   
    		    let select_date = document.getElementById('select_date');
    		    select_date.value=year+'-'+String(month+1).padStart(2,'0')+'-'+v;
    		});
    		
    	}
    }
}
calendar();

//달력 넘기는 버튼
let prev_img = document.getElementById('prev_img');
let next_img = document.getElementById('next_img');
//console.log(prev_img);
function prev_mouseover(){
    prev_img.setAttribute('src','../resources/img/caret-left-fill.svg');
}
function prev_mouseleave(){
    prev_img.setAttribute('src','../resources/img/caret-left.svg');
}
function next_mouseover(){
    next_img.setAttribute('src','../resources/img/caret-right-fill.svg');
}
function next_mouseleave(){
    next_img.setAttribute('src','../resources/img/caret-right.svg');
}

//달력 버튼 누르면 변경
let prev = document.getElementById('prev');
let next = document.getElementById('next');
let cnt = 0;
if(month==now.getMonth() && year==now.getFullYear() ){
	cnt = day-1+bin;
}else{cnt=bin;}
//오늘의 전 달은 클릭해도 안넘어가게
prev.addEventListener("click",function(e){
	if((month-1)>=now.getMonth()){
    e.preventDefault(); 
    month--; 
    //2월->1월이 안나옴,,,
    //1월에서 이전 버튼 누르면 연도-- 12월로 가야함 if(month)
    //다시 달력 만들기
    calendar(); 
    /*if(month==now.getMonth() && year==now.getFullYear()){
    	cnt = day-1+bin;
    }else{cnt=bin;}*/
	}
});

next.addEventListener("click",function(e){
    e.preventDefault();
    month++;
    calendar();
    /*if(month==now.getMonth() && year==now.getFullYear() ){
    	cnt = day-1+bin;
    }else{cnt=bin;}*/
});
/*
//선택한 날짜 표시
let v;
for(let td of select_td){
	//let cnt = bin; //위치를prev.addEventListener안으로 바꿔보기
	//console.log("원,연도일치여부: "+month==now.getMonth() && year==now.getFullYear());
	/*if(month==now.getMonth() && year==now.getFullYear() ){
		cnt = day-1+bin;
	}
	//console.log("cnt: "+cnt);
	//'오늘'이후 날짜부터 click이벤트 안되게함(오늘 포함)
	for(let j=cnt; j<select_td_len; j++){
		//달력 넘겼을 때 선택 초기화
		if(select_td[j].style.background=='rgb(0, 102, 14)'){
	    	select_td[j].style.background="";
	    	select_td[j].style.color="";
			}
		select_td[j].addEventListener("click",function(event){
			for(let i=cnt; i<select_td_len; i++){

				if(select_td[i].style.background=='rgb(0, 102, 14)'){
		    	select_td[i].style.background="";
		    	select_td[i].style.color="";
				}
				if(select_td[i].classList=='today'){
					select_td[i].style.background="";
			    	select_td[i].style.color="";
				}
			}
			
			//주말 표시
			for(let i=0;i<rest.length;i++){ 
			    let first_tds = document.querySelectorAll("tr td:first-child");
			    let last_tds = document.querySelectorAll("tr td:last-child");
			    first_tds[i].style.color='red';
			    last_tds[i].style.color='blue';
			}
			
			select_td[j].style.background='#00660e';
			select_td[j].style.borderRadius='50%';
			select_td[j].style.color='white';
		    //선택한 날짜 불러오기 innetHtml, innerText로는 안불러와짐,,
		    v = select_td[j].textContent;
		   
		    let select_date = document.getElementById('select_date');
		    select_date.value=year+'-'+String(month+1).padStart(2,'0')+'-'+v;
		});
		
	}
}
*/
//인원 선택시 총 예약인원, 예약금액 변경
let person_select = document.getElementById('person_select');
let p_amount = document.getElementById('p_amount');
let deposit = document.getElementById('deposit');
let total_amount = document.getElementById('total_amount');
function change_person(){
    p_amount.innerHTML=person_select.options[person_select.selectedIndex].value;
    total_amount.innerHTML=(person_select.options[person_select.selectedIndex].value * parseInt(deposit.innerText.replace(/,/g,''))).toLocaleString('ko-KR') ;
}
//$('input[type=date]').val(year+'-'+(month+1)+'-'+v);


//하트 이미지 클릭시 변경 다시 클릭시 원래대로
let heart = document.getElementById('heart');
heart.addEventListener('click',function(){
    if(heart.src.indexOf('heart_solid.png')===-1){
        heart.setAttribute('src','../resources/img/heart_solid.png');
    }else{
        heart.setAttribute('src','../resources/img/heart.png');
    }
});

//예약하기
function chk(){
	let select_date = document.getElementById('select_date');
	console.log(select_date.value);
	if(window.sessionStorage.getItem('ID')=='null'){
    	alert('로그인이 필요한 서비스 입니다.');
    	return false;
    }
	else if(select_date.value==''){
    	alert('예약날짜를 선택하세요.');
        return false;
    }
	else if(person_select.selectedIndex===0){
        alert('인원 수를 선택하세요.');
        return false;
    }
    else if(time_select.selectedIndex===0){
        alert('예약시간을 선택하세요.');
        return false;
    }
    
    //console.log(sessionStorage.getItem('member'));
    else{
    	return true;
    }
}

