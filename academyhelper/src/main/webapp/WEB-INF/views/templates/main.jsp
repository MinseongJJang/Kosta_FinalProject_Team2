<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section class="banner" id="top">
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class="banner-caption">
					<h2>IT기관 검색</h2>
					<h3>
						추천 검색어 :&nbsp;&nbsp;<a>#서정우</a>&nbsp;&nbsp;<a>#잘생김</a>&nbsp;&nbsp;<a>#WEB</a>
					</h3>
					<br>
					<div class="submit-form">
						<form id="form-submit" action="" method="get">
							<div class="row">
								<div class="col-md-3 third-item">
									<fieldset>
										<select required name='category' onchange='this.form.()'>
											<option value="">Select category...</option>
											<option value="Shops">Shops</option>
											<option value="Hotels">Hotels</option>
											<option value="Restaurants">Restaurants</option>
											<option value="Events">Events</option>
											<option value="Meetings">Meetings</option>
											<option value="Fitness">Fitness</option>
											<option value="Cafes">Cafes</option>
										</select>
									</fieldset>
								</div>
								<div class="col-md-3 first-item">
									<fieldset>
										<input name="name" type="text" class="form-control" id="name"
											placeholder="Your name...">
									</fieldset>
								</div>
								<div class="col-md-3 second-item">
									<fieldset>
										<input name="location" type="text" class="form-control"
											id="location" placeholder="Type location...">
									</fieldset>
								</div>
								<div class="col-md-3">
									<fieldset>
										<button type="submit" id="form-submit" class="btn">Search
											Now</button>
									</fieldset>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="popular-places" id="popular">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="section-heading">
					<h2>IT 기관 홍보</h2>
				</div>
			</div>
		</div>
		<div class="owl-carousel owl-theme">
			<div class="item popular-item">
				<div class="thumb">
					<img
						src="${pageContext.request.contextPath }/resources/img/popular_item_1.jpg"
						alt="">
					<div class="text-content">
						<h4>Mauris tempus</h4>
						<span>76 listings</span>
					</div>
					<div class="plus-button">
						<a href="#"><i class="fa fa-plus"></i></a>
					</div>
				</div>
			</div>
			<div class="item popular-item">
				<div class="thumb">
					<img
						src="${pageContext.request.contextPath }/resources/img/popular_item_2.jpg"
						alt="">
					<div class="text-content">
						<h4>Aenean dolor</h4>
						<span>18 listings</span>
					</div>
					<div class="plus-button">
						<a href="#"><i class="fa fa-plus"></i></a>
					</div>
				</div>
			</div>
			<div class="item popular-item">
				<div class="thumb">
					<img
						src="${pageContext.request.contextPath }/resources/img/popular_item_3.jpg"
						alt="">
					<div class="text-content">
						<h4>Nunc at quam</h4>
						<span>55 listings</span>
					</div>
					<div class="plus-button">
						<a href="#"><i class="fa fa-plus"></i></a>
					</div>
				</div>
			</div>
			<div class="item popular-item">
				<div class="thumb">
					<img
						src="${pageContext.request.contextPath }/resources/img/popular_item_4.jpg"
						alt="">
					<div class="text-content">
						<h4>Fusce ac turpis</h4>
						<span>66 listings</span>
					</div>
					<div class="plus-button">
						<a href="#"><i class="fa fa-plus"></i></a>
					</div>
				</div>
			</div>
			<div class="item popular-item">
				<div class="thumb">
					<img
						src="${pageContext.request.contextPath }/resources/img/popular_item_5.jpg"
						alt="">
					<div class="text-content">
						<h4>Lorem ipsum</h4>
						<span>82 listings</span>
					</div>
					<div class="plus-button">
						<a href="#"><i class="fa fa-plus"></i></a>
					</div>
				</div>
			</div>
			<div class="item popular-item">
				<div class="thumb">
					<img
						src="${pageContext.request.contextPath }/resources/img/popular_item_1.jpg"
						alt="">
					<div class="text-content">
						<h4>Praesent nec</h4>
						<span>76 listings</span>
					</div>
					<div class="plus-button">
						<a href="#"><i class="fa fa-plus"></i></a>
					</div>
				</div>
			</div>
			<div class="item popular-item">
				<div class="thumb">
					<img
						src="${pageContext.request.contextPath }/resources/img/popular_item_2.jpg"
						alt="">
					<div class="text-content">
						<h4>Suspendisse</h4>
						<span>36 listings</span>
					</div>
					<div class="plus-button">
						<a href="#"><i class="fa fa-plus"></i></a>
					</div>
				</div>
			</div>
			<div class="item popular-item">
				<div class="thumb">
					<img
						src="${pageContext.request.contextPath }/resources/img/popular_item_3.jpg"
						alt="">
					<div class="text-content">
						<h4>Bibendum</h4>
						<span>48 listings</span>
					</div>
					<div class="plus-button">
						<a href="#"><i class="fa fa-plus"></i></a>
					</div>
				</div>
			</div>
			<div class="item popular-item">
				<div class="thumb">
					<img
						src="${pageContext.request.contextPath }/resources/img/popular_item_4.jpg"
						alt="">
					<div class="text-content">
						<h4>Quisque sodales</h4>
						<span>66 listings</span>
					</div>
					<div class="plus-button">
						<a href="#"><i class="fa fa-plus"></i></a>
					</div>
				</div>
			</div>
			<div class="item popular-item">
				<div class="thumb">
					<img
						src="${pageContext.request.contextPath }/resources/img/popular_item_5.jpg"
						alt="">
					<div class="text-content">
						<h4>Pellentesque</h4>
						<span>85 listings</span>
					</div>
					<div class="plus-button">
						<a href="#"><i class="fa fa-plus"></i></a>
					</div>
				</div>
			</div>
			<div class="item popular-item">
				<div class="thumb">
					<img
						src="${pageContext.request.contextPath }/resources/img/popular_item_1.jpg"
						alt="">
					<div class="text-content">
						<h4>Commodo</h4>
						<span>76 listings</span>
					</div>
					<div class="plus-button">
						<a href="#"><i class="fa fa-plus"></i></a>
					</div>
				</div>
			</div>
			<div class="item popular-item">
				<div class="thumb">
					<img
						src="${pageContext.request.contextPath }/resources/img/popular_item_2.jpg"
						alt="">
					<div class="text-content">
						<h4>Adipiscing</h4>
						<span>32 listings</span>
					</div>
					<div class="plus-button">
						<a href="#"><i class="fa fa-plus"></i></a>
					</div>
				</div>
			</div>
			<div class="item popular-item">
				<div class="thumb">
					<img
						src="${pageContext.request.contextPath }/resources/img/popular_item_3.jpg"
						alt="">
					<div class="text-content">
						<h4>Etiam hendrerit</h4>
						<span>49 listings</span>
					</div>
					<div class="plus-button">
						<a href="#"><i class="fa fa-plus"></i></a>
					</div>
				</div>
			</div>
			<div class="item popular-item">
				<div class="thumb">
					<img
						src="${pageContext.request.contextPath }/resources/img/popular_item_4.jpg"
						alt="">
					<div class="text-content">
						<h4>Suspendisse</h4>
						<span>63 listings</span>
					</div>
					<div class="plus-button">
						<a href="#"><i class="fa fa-plus"></i></a>
					</div>
				</div>
			</div>
			<div class="item popular-item">
				<div class="thumb">
					<img
						src="${pageContext.request.contextPath }/resources/img/popular_item_5.jpg"
						alt="">
					<div class="text-content">
						<h4>Sit amet dictum</h4>
						<span>86 listings</span>
					</div>
					<div class="plus-button">
						<a href="#"><i class="fa fa-plus"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br> <br> <br>
	<div class="section-heading">
		<div class="blue-button">
			<a class="scrollTo" data-scrollTo="popular" href="#">더보기</a>
		</div>
	</div>
</section>


<section class="featured-places" id="blog">
	<div class="container">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div class="section-heading">
					<h2>Best 교육과정</h2>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
		<div class="row">
			<div class="col-sm-4">
				<div class="featured-item">
					<div class="thumb">
						<img
							src="${pageContext.request.contextPath}/resources/img/featured_item_1.jpg"
							alt="">
						<div class="overlay-content">
							<ul>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
							</ul>
						</div>
						<div class="date-content">
							<h6>Academy Helper</h6>
							<span>Academy Helper</span>
						</div>
					</div>
					<div class="down-content">
						<h4>Academy Helper</h4>
						<span>Academy Helper</span>
						<p>Academy Helper</p>
						<div class="row">
							<div class="col-md-6 first-button">
								<div class="text-button">
									<a href="#">Academy Helper</a>
								</div>
							</div>
							<div class="col-md-6">
								<div class="text-button">
									<a href="#">Academy Helper</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="featured-item">
					<div class="thumb">
						<img
							src="${pageContext.request.contextPath}/resources/img/featured_item_2.jpg"
							alt="">
						<div class="overlay-content">
							<ul>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
							</ul>
						</div>
						<div class="date-content">
							<h6>Web</h6>
							<span>개꿀</span>
						</div>
					</div>
					<div class="down-content">
						<h4>Academy Helper</h4>
						<span>Academy Helper</span>
						<p>Academy Helper</p>
						<div class="row">
							<div class="col-md-6 first-button">
								<div class="text-button">
									<a href="#">Academy Helper</a>
								</div>
							</div>
							<div class="col-md-6">
								<div class="text-button">
									<a href="#">Academy Helper</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="featured-item">
					<div class="thumb">
						<img
							src="${pageContext.request.contextPath}/resources/img/featured_item_3.jpg"
							alt="">
						<div class="overlay-content">
							<ul>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i></li>
							</ul>
						</div>
						<div class="date-content">
							<h6>12</h6>
							<span>October</span>
						</div>
					</div>
					<div class="down-content">
						<h4>Academy Helper</h4>
						<span>Academy Helper</span>
						<p>Academy Helper</p>
						<div class="row">
							<div class="col-md-6 first-button">
								<div class="text-button">
									<a href="#">Academy Helper</a>
								</div>
							</div>
							<div class="col-md-6">
								<div class="text-button">
									<a href="#">Academy Helper</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br> <br> <br>
	<div class="section-heading">
		<div class="blue-button">
			<a class="scrollTo" data-scrollTo="featured-replaces" href="#">더보기</a>
		</div>
	</div>
</section>

<section class="popular-places" id="popular">
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<div class="section-heading">
					<a href="#"><img
						src="${pageContext.request.contextPath }/resources/img/service.png">
					</a>
					<p>아카데미헬퍼</p>
					<h2>사이트이용</h2>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="section-heading">
					<a href="#"><img
						src="${pageContext.request.contextPath }/resources/img/complain.png">
					</a>
					<p>불편사항접수</p>
					<h2>건의사항</h2>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="section-heading">
					<a href="#"><img
						src="${pageContext.request.contextPath }/resources/img/cafe.png">
					</a>
					<p>전세계60억명이선택한</p>
					<h2>커뮤니티</h2>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="section-heading">
					<a href="#"><img
						src="${pageContext.request.contextPath }/resources/img/kakao.png">
					</a>
					<p>카카오톡상담</p>
					<h2>kms4182</h2>
				</div>
			</div>
		</div>
	</div>
</section>