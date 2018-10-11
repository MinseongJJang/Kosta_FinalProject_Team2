<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="mainContainer">
	<section class="banner" id="top">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="banner-caption">
						<div class="line-dec"></div>
						<h2>Academy Helper</h2>
						<span> Academy Helper </span>
						<div class="blue-button">
							<a class="scrollTo" data-scrollTo="popular" href="#">Academy
								Helper</a>
						</div>
					</div>
					<div class="submit-form">
						<form id="form-submit" action="" method="get">
							<div class="row">
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
	</section>
	<div class="container featured-places" id="blog">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div class="section-heading">
					<span>Academy Helper</span>
					<h2>Academy Helper</h2>
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
</div>