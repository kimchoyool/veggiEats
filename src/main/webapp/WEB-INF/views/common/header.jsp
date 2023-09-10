<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="context" value="${pageContext.request.contextPath}" /> 
<%
	request.setCharacterEncoding("utf-8");
	String name = (String)session.getAttribute("ID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${context}/resources/css/base.css" rel="stylesheet" media="all">
<link href="${context}/resources/css/main.css" rel="stylesheet" media="screen and (min-width:769px)">
<link rel="stylesheet" media="screen and (max-width:768px)" href="${context}/resources/css/layout_media.css">
<script type="text/javascript" src="${context}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	//예약시 로그인 여부를 확인 하기 위해서 js에서 사용하기 위해 설정해둠 
	sessionStorage.setItem("ID", '<%=name%>');
</script>
<title>VeggiEats</title>
</head>
<body>
	<header id="header">
		<div class="inner">
			<div id="logo">
			<!-- 상대경로로 하면 메인과 다른 페이지들의 위치가 달라서 로고가 적용이 안되는 페이지가 생김  > 절대경로로 함 -->
				<a href="${context}"><img src="${context}/resources/img/Veggieats.png"></a>
			</div>
			<div id="search">
				<input id="search_bar" type="text" placeholder="  검색 ">
				<a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  				<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
				</svg></a>
			</div>
			<div id="top_nav">
				<nav>
					<ul id="top_nav_inner">
					<% if(session.getAttribute("ID")!=null){
						//MemberDTO member = (MemberDTO)session.getAttribute("member");
						session.setAttribute("ID", name); %>
						<li><%=name %>님</li>
						<li><a href="${context}/mypages.do">마이페이지</a></li>
						<li><a href="${context}/logout.do">로그아웃</a></li>
					<% } else{%>
						<li><a href="${context}/login.do">로그인</a></li>
						<li><a href="${context}/join.do">회원가입</a></li>
						<li><a href="#">고객센터</a></li>
					<% }%>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<nav id="main_nav">
		<div class="inner">
			<ul class="mnav">
				<li class="mnav_list">
					<a href="#">카테고리</a>
					<ul class="sub_menu">
						<li id="seoul">
							<a href="#">서울</a>
							<ul class="sub_menu_sub seoul">
								<li><a href="#">강남/서초</a></li>
								<li><a href="#">마포/용산</a></li>
								<li><a href="#">구로/관악/금천</a></li>
								<li><a href="#">강서/양천</a></li>
								<li><a href="#">영등포/동작</a></li>
								<li><a href="#">성동/성북</a></li>
								<li><a href="#">강동/송파</a></li>
								<li><a href="#">광진/중랑</a></li>
								<li><a href="#">종로/중구/동대문</a></li>
								<li><a href="#">강북/노원/도봉</a></li>
								<li><a href="#">은평/서대문</a></li>
							</ul>
						</li>
						<li id="kyungin">
							<a href="#">경기/인천</a>
							<ul class="sub_menu_sub kyungin">
								<li><a href="#">일산/파주</a></li>
								<li><a href="#">인천/부천</a></li>
								<li><a href="#">안양/안산/광명</a></li>
								<li><a href="#">용인/분당/수원</a></li>
							</ul>
						</li>
						<li id="deachung">
							<a href="#">대전/충청</a>
							<ul class="sub_menu_sub deachung">
								<li><a href="#">대전</a></li>
								<li><a href="#">충청</a></li>
							</ul>
						</li>
						<li  id="deakyung">
							<a href="#">대구/경북</a>
							<ul class="sub_menu_sub deakyung">
								<li><a href="#">대구</a></li>
								<li><a href="#">경북</a></li>
							</ul>
						</li>
						<li id="bukyung">
							<a href="#">부산/경남</a>
							<ul class="sub_menu_sub bukyung">
								<li><a href="#">부산</a></li>
								<li><a href="#">경남</a></li>
							</ul>
						</li>
						<li id="gkangjeon">
							<a href="#">광주/전라</a>
							<ul class="sub_menu_sub gkangjeon">
								<li><a href="#">광주</a></li>
								<li><a href="#">전라</a></li>
							</ul>
						</li>
						<li>
							<a href="#">강원</a>
						</li>
						<li>
							<a href="#">제주</a>
						</li>
					</ul>
				</li> <!-- hover시 지역별메뉴  -->
				<li class="mnav_list"><a href="/VeggiEats/boardList.do">베지레시피</a></li>
				<li class="mnav_list"><a href="http://localhost:8080/VeggiEats/code/map.jsp">근처식당</a></li>
				<li class="mnav_list"><a href="#">공지사항</a></li>
			</ul>
		</div>
	</nav>

</body>
</html>