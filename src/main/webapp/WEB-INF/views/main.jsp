<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<link rel="stylesheet" href="${context}/resources/css/swiper.min.css"/>
<script type="text/javascript" src="${context}/resources/js/swiper.min.js"></script>

  
 <link rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

<title>VeggiEats</title>
<script type="text/javascript"> 
var swiper = new Swiper('.swiper-container',{
	speed:2000,
	autoplay:{
		delay:3000,
		disableOnInteration: false
	},
	slidesPerView: 1,
	loop: true,
	pagination:{
		el: '.swiper-pagination',
		clickable: true, 
	},
	navigation:{
		nextEl: '.next',
		prevEl: '.prev'
	},
	observer: true,
	observeParents: true
	
});
			
</script>
</head>
<body>
<jsp:include page="common/header.jsp"/>
	<main>
		<div id="contents">
			<article id="banner">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide"><a href="#"><img src="${context}/resources/img/배너1.jpg" alt=""></a></div>
						<div class="swiper-slide"><a href="#"><img src="${context}/resources/img/배너2.png" alt=""></a></div>
						<div class="swiper-slide"><a href="#"><img src="${context}/resources/img/배너3.png" alt=""></a></div>
					</div>
					<div class="swiper-pagination"></div>
            		<div class="prev arrow"><img src="${context}/resources/img/arrow-left.svg" width="50px" alt="arrow-left"></div>
            		<div class="next arrow"><img src="${context}/resources/img/arrow-right.svg" width="50px" alt="arrow-right"></div>
				</div>
			</article>
			<div id="main_shops">
				<h2>인기 식당</h2>
				<div id="shops_fav">
					<article class="shops">
						<div>
						<a href="${context}/shop_page"><img src="${context}/resources/img/연남 플랜트1.jpg" alt="비건식당 사진"></a>
						</div>
						<p>플랜트 연남점<p>
						<p>서울 마포구 월드컵북로4길 87</p>
					</article>
					<article class="shops"><div>
						<a href="${context}/shop_page"><img src="${context}/resources/img/인기식당2.png" alt="비건식당 사진"></a>
						</div>
						<p>인기/추천 식당2</p>
						<p></p>
					</article>
					<article class="shops">
						<div>
							<a href="${context}/shop_page"><img src="${context}/resources/img/인기식당3.jpg" alt="비건식당 사진"></a>
						</div>
						<p>인기/추천 식당3</p>
						<p></p>
					</article>
					<article class="shops">
						<div>
							<a href="${context}/shop_page"><img src="${context}/resources/img/인기식당4.png" alt="비건식당 사진"></a>
						</div>
						<p>인기/추천 식당4</p>
						<p></p>
					</article>
					<article class="shops">
						<div>
							<a href="${context}/shop_page"><img src="${context}/resources/img/인기식당5.png" alt="비건식당 사진"></a>
						</div>
						<p>인기/추천 식당5<p>
						<p></p>
					</article>
					<article class="shops">
						<div>
							<a href="${context}/shop_page"><img src="${context}/resources/img/인기식당6.jpg" alt="비건식당 사진"></a>
						</div>
						<p>인기/추천 식당6</p>
						<p></p>
					</article>
					<article class="shops">
						<div>
							<a href="${context}/shop_page"><img src="${context}/resources/img/인기식당7.png" alt="비건식당 사진"></a>
						</div>
						<p>인기/추천 식당7</p>
						<p></p>
					</article>
					<article class="shops">
						<div>
							<a href="${context}/shop_page"><img src="${context}/resources/img/인기식당8.png" alt="비건식당 사진"></a>
						</div>
						<p>인기/추천 식당8</p>
						<p></p>
					</article>
				</div>
			</div>
		</div>
	</main>
<jsp:include page="common/footer.jsp"/>
</body>
</html>