<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${context}/resources/css/detailed.css" rel="stylesheet" media="all">
<title>상세페이지</title>
<link rel="stylesheet" href="${context}/resources/css/bootstrap.min.css">
</head> 
<body>
<jsp:include page="common/header.jsp"/>
	<main id="contents_d">
		<section id="detailed">
			<div id="shop_info" class="info">
				<div id="shop_images" class="info">
					<img src="${context}/resources/img/연남 플랜트외관.jpg" height="300px" alt="">
					<img src="${context}/resources/img/연남 플랜트3.jpg" height="300px" alt="">
				</div>
				<div class="shop_common info" align="right"><!-- 좋아요, 공유하기 등 -->
					<img id="heart" src="${context}/resources/img/heart_solid.png" alt="">
					<img src="${context}/resources/img/share-nodes-solid.svg" alt="">
				</div>
				<!--<div id="shop_title" class="info">식당 이름, 위치, 별점
					<p>플랜트 연남점</p>
					<p>서울 마포구 월드컵북로4길 87</p>
					<p>별점</p>
				</d iv>별점 -->
				<div class="info"><!-- 기본정보 메뉴 사진 후기 -->
					<div class="info_list">
						<ul>
							<li><a href="#detailed_page">기본정보</a></li>
							<li><a href="#detailed_menu">메뉴</a></li>
							<li><a href="#detailed_photo">사진</a></li>
							<li><a href="#detailed_review">후기</a></li>
						</ul>
					</div>
					<!-- <iframe class="if r a me" name="info" width="650px" height="1000px"></iframe> -->
					<div id="detailed_page"> <!-- 기본정보 -->
						<div id="shop_name" class="title">플랜트 연남점</div>
						<div><div><img src="${context}/resources/img/geo-alt.svg" width="20px" alt="지도아이콘">주소</div><div>서울 마포구 월드컵북로4길 87</div></div>
						<div><div><img src="${context}/resources/img/clock.svg" width="20px" alt="시계아이콘">영업시간</div><div>11:00~22:00</div></div>
						<div><div><img src="${context}/resources/img/battery-charging.svg" width="20px" alt="배터리아이콘">정기휴무</div><div>매주 월요일</div></div>
						<div><div><img src="${context}/resources/img/telephone.svg" width="20px" alt="전화기아이콘">연락처</div><div>02-337-1982</div></div>
					</div>
					<div id="detailed_menu"><!-- 메뉴 -->
						<div id="menu" class="title">메뉴</div>
						<div><div>시저 샐러드</div><div>13,000원</div></div>
						<div><div>세서미 피넛 소바 볼</div><div>13,000원</div></div>
						<div><div>후무스 샐러드</div><div>14,5000원</div></div>
						<div><div>두부 시저 랩</div><div>13,000원</div></div>
						<div><div>팔라펠 샐러드 볼</div><div>14,500원</div></div>
						<div><div>팔라펠 랩</div><div>13,000원</div></div>
						<div><div>스크램블 부리또</div><div>13,000원</div></div>
						<div><div>파히타 샌드위치</div><div>13,000원</div></div>
						<div><div>플랜트 치즈버거</div><div>13,000원</div></div>
						<div><div>머쉬룸 치즈버거</div><div>14,500원</div></div>
					</div>
					<div id="detailed_photo"><!-- 사진 -->
						<div class="title">사진</div>
						<img src="${context}/resources/img/연남 플랜트1.jpg" alt="">
						<img src="${context}/resources/img/연남 플랜트2.jpg" alt="">
						<img src="${context}/resources/img/연남 플랜트3.jpg" alt="">
						<img src="${context}/resources/img/연남 플랜트4.jpg" alt="">
						<img src="${context}/resources/img/연남 플랜트5.jpg" alt="">

					</div>
					<div id="detailed_review"><!-- 후기 -->
						<div class="title">후기</div>
						<div>
							<img src="${context}/resources/img/user-regular.svg" width="20px" alt=""> 러브비건
							<span>너무 맛있어요 양도 많고 후무스 샐러드가 진짜 맛있습니다!!</span>
						</div>
						<div>
							<img src="${context}/resources/img/user-regular.svg" width="20px" alt=""> 비건최고
							<span>음식이 전체적으로 담백하니 맛있었어요! 그리고 양도 많고 포만감 가득한 단호박, 두부 메뉴라 다 못먹었는데도 배가 너무 불렀네요 ㅎㅎ 스무디도 넘 맛있어요</span>
						</div>
						
					</div>
				</div>
			</div>
		</section>
		<section id="reservation">
		<form id="form" name="reservation" onsubmit="return chk()" action="${context}/reservation" method="post">
			<div id="calendar">
				<div id="calendar_ymb">
					<button type="button" id="prev" onmouseover="prev_mouseover()" onmouseleave="prev_mouseleave()"><img id="prev_img" src="${context}/resources/img/caret-left.svg"></button>
					<p></p>
					<button type="button" id="next" onmouseover="next_mouseover()" onmouseleave="next_mouseleave()"><img id="next_img" src="${context}/resources/img/caret-right.svg"></button>
				</div>
				<table></table>
			</div>
		<!--	<form id="select">  d iv > form -->
			<div id="select">
				<div id="person">
					<label for="person_select"></label>
					<select name="people" id="person_select" onchange="change_person()" required>
						<option disabled selected>인원 선택</option> <!-- option:hover은 안먹힌다고 한다 ul li를 써야만 한다고 함,, -->
						<option value="1" class="opt">1명</option>
						<option value="2">2명</option>
						<option value="3">3명</option>
						<option value="4">4명</option>
					</select>
				</div>
				<div id="time">
					<label for="time_select"></label>
					<select name="Reservation_time" id="time_select" required>
						<option disabled selected>시간 선택</option>
						<option value="09:00">09:00</option>
						<option value="10:00">10:00</option>
						<option value="11:00">11:00</option>
						<option value="12:00">12:00</option>
						<option value="13:00">13:00</option>
						<option value="17:00">17:00</option>
						<option value="18:00">18:00</option>
					</select>
				</div>
				</div>
			<!-- </form> -->
			<div id="select_info">
				<br>
				
				<!-- js로 값 넣고 확인 페이지로 값 넘기기 type='date'로 하면 width 뒤에가 좀 짤림(date뒤에 달력 아이콘 때문 인듯해서 text로 바꿈)-->
				<input type="text" name="Reservation_date" id="select_date" readonly>
				
				<p>
					1인당 예약금: <span id="deposit">10,000</span>원</p>
				<p>x 총 예약 인원: <span id="p_amount">1</span>명
				</p>
			</div>
			<div id="total_price">
				<p><br>총 예약금 <span id="total_amount">10,000</span>원</p><br>
			</div>
			<div id="reservation_button">
				<button type="submit">예약하기</button>
			</div>
			</form>
		</section>
	</main>
<!-- footer -->
	<div id="div_up_arrow">
		<a href="#contents_d"><img id="up_arrow" src="${context}/resources/img/arrow-up-circle.svg"></a>
	</div>
<jsp:include page="common/footer.jsp"/>
	<script type="text/javascript" src="${context}/resources/js/jquery-3.6.4.js"></script>
	<script type="text/javascript" src="${context}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${context}/resources/js/calendar.js?v=<%=System.currentTimeMillis() %>"></script>
	<!-- calendar.js ?~는 현재시간을 표시해주는 내부함수로 이것 때문에 js변경시 바로 반영가능  -->
</body>
</html>