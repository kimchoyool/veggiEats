<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="../common/css/map.css" rel="stylesheet" media="all">
<title>근처식당</title>
</head>
<body>
	<main id="contents_map">
		<section id="map">
			<iframe id="map_iframe" width="700px" height="500px" frameborder="0"scrolling='no' marginheight="0" marginwidth="0">
			</iframe>
		</section>
		<section id="map_shops">
			<a href="./shop_page.jsp">
				<div class="map_shop">
					<img src="../common/img/인기식당2.png" width="150px">
					<div>
						<p>식당이름</p>
						<p>위치, 별점, 간단한 설명</p>
					</div>
				</div>
			</a>
			<a href="./shop_page.jsp">
				<div class="map_shop">
					<img src="../common/img/인기식당3.jpg" width="150px">
					<div>
						<p>식당이름</p>
						<p>위치, 별점, 간단한 설명</p>
					</div>
				</div>
			</a>
			<a href="./shop_page.jsp">
				<div class="map_shop">
					<img src="../common/img/인기식당8.png" width="150px">
					<div>
						<p>식당이름</p>
						<p>위치, 별점, 간단한 설명</p>
					</div>
				</div>
			</a>
			<a href="./shop_page.jsp">
				<div class="map_shop">
					<img src="../common/img/인기식당9.png" width="150px">
					<div>
						<p>식당이름</p>
						<p>위치, 별점, 간단한 설명</p>
					</div>
				</div>
			</a>
			<a href="./shop_page.jsp">
				<div class="map_shop">
					<img src="../common/img/인기식당4.png" width="150px">
					<div>
						<p>식당이름</p>
						<p>위치, 별점, 간단한 설명</p>
					</div>
				</div>
			</a>
		</section>
	</main>
	<div id="div_up_arrow">
		<a href="#contents_map"><img id="up_arrow" src="../common/img/arrow-up-circle.svg"></a>
	</div>
	<script type="text/javascript" src="../common/js/map.js"></script>
</body>
</html>