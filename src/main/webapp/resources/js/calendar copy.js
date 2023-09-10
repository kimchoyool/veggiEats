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
console.log(select_td_len); //42
//console.log(bin); //6
let day = now.getDate(); //now.getDate() 오늘날짜

function calendar(){
    if(month<0){ //만약 
        let y = new Date(year,month).getFullYear(); 
        let m = new Date(year,month).getMonth()+1;
        calendar_mark.innerHTML=y+"년 "+m+"월";
    }else{
        calendar_mark.innerHTML=year+"년 "+(month+1)+"월"; 
    }
    
//당월의 첫째날 ex. Sat Apr 01 2023 ,,,
let startDay = new Date(year,month,1);
console.log("startDay "+new Date(year,month,1));
//당월의 마지막날
let lastDay = new Date(year,month+1,0).getDate();
console.log("year "+year);
console.log("month "+month);
console.log("lastDay"+lastDay);
    let start  = startDay.toString().substring(0,3); //Sat,, 
    
    let bin = 0;
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
   for(let i=0;i<lastDay;i++){
    /*if(i<bin){ 이렇게 넣으면 달을 넘길때 기존에 있던 일자가 안지워짐,,
        select_td[i].append("");
    }*/
    select_td[bin+i].innerHTML=i+1;

    /*if(i===day){ //오늘 날짜에 표시 잠시 주석처리함>클릭시 선택으로 바꿀 예정
        select_td[bin+i-1].style.background='rgba(0,102,14,0.5)';
    }*/
} 
}
calendar();

//달력 넘기는 버튼
let prev_img = document.getElementById('prev_img');
let next_img = document.getElementById('next_img');
console.log(prev_img);
function prev_mouseover(){
    prev_img.setAttribute('src','../common/img/caret-left-fill.svg');
}
function prev_mouseleave(){
    prev_img.setAttribute('src','../common/img/caret-left.svg');
}
function next_mouseover(){
    next_img.setAttribute('src','../common/img/caret-right-fill.svg');
}
function next_mouseleave(){
    next_img.setAttribute('src','../common/img/caret-right.svg');
}

//달력 버튼 누르면 변경
let prev = document.getElementById('prev');
let next = document.getElementById('next');

prev.addEventListener("click",function(e){
    e.preventDefault(); 
    month--; //다시 달력 만들기 실행시키기
    //2월->1월이 안나옴,,,
    console.log(month);
    //1월에서 이전 버튼 누르면 연도-- 12월로 가야함 if(month)
    calendar(); //같은 날짜가 2번씩 출력됨,,
});
next.addEventListener("click",function(e){
    e.preventDefault();
    month++;
    calendar();
});