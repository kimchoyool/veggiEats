<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${context}/resources/css/map.css" rel="stylesheet" media="all">
<title>근처식당</title>
</head>
<body>
<jsp:include page="common/header.jsp"/>
	<main id="contents_map">
		<section id="map">
			<iframe id="map_iframe" width="700px" height="500px" frameborder="0"scrolling='no' marginheight="0" marginwidth="0">
			</iframe>
		</section>
		<section id="map_shops">
			<a href="./shop_page.jsp">
				<div class="map_shop">
					<img src="${context}/resources/img/인기식당2.png" width="150px">
					<div>
						<p>식당이름</p>
						<p>위치, 별점, 간단한 설명</p>
					</div>
				</div>
			</a>
			<a href="./shop_page.jsp">
				<div class="map_shop">
					<img src="${context}/resources/img/인기식당3.jpg" width="150px">
					<div>
						<p>식당이름</p>
						<p>위치, 별점, 간단한 설명</p>
					</div>
				</div>
			</a>
			<a href="./shop_page.jsp">
				<div class="map_shop">
					<img src="${context}/resources/img/인기식당8.png" width="150px">
					<div>
						<p>식당이름</p>
						<p>위치, 별점, 간단한 설명</p>
					</div>
				</div>
			</a>
			<a href="./shop_page.jsp">
				<div class="map_shop">
					<img src="${context}/resources/img/인기식당9.png" width="150px">
					<div>
						<p>식당이름</p>
						<p>위치, 별점, 간단한 설명</p>
					</div>
				</div>
			</a>
			<a href="./shop_page.jsp">
				<div class="map_shop">
					<img src="${context}/resources/img/인기식당4.png" width="150px">
					<div>
						<p>식당이름</p>
						<p>위치, 별점, 간단한 설명</p>
					</div>
				</div>
			</a>
		</section>
	</main>
	<div id="div_up_arrow">
		<a href="#contents_map"><img id="up_arrow" src="${context}/resources/img/arrow-up-circle.svg"></a>
	</div>
<jsp:include page="common/footer.jsp"/>
	<script type="text/javascript" src="${context}/resources/js/map.js"></script>
</body>
</html>