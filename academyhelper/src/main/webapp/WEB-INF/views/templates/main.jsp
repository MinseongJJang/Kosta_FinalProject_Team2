<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() {
		var address="";
		$("#locationBtn").click(function() {
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/provinceList.do",
				success : function(result) {
					var info = "<div style='overflow-y:scroll; width:100%; height:350px;'><table class='table'>"
					for (var i = 0; i < result.locationList.length; i++) {
						info += "<tr><td><input type='radio' style='width:15px;height:15px' name='province' value='"+result.locationList[i].province+"'>"
								+ result.locationList[i].province
								+ "</tr></td>"
					}
						info += "</div></table>"
						$("#provinceList").html(info);
					}
				});//ajax
			});//click
			$("#districtBtn").click(function() {
				var selValue = $('input[name=province]:checked').val(); 
				address += selValue;
				$.ajax({
					type : "get",
					url : "${pageContext.request.contextPath}/districtList.do",
					data : "province="+  selValue,
					success : function(result) {
						var info = "<div style='overflow-y:scroll; width:100%; height:350px;'><table class='table'>"
						for (var i = 0; i < result.locationList.length; i++) {
							info += "<tr><td><input type='radio'  style='width:15px;height:15px' name='district' value='"+result.locationList[i].district+"'>"
									+ result.locationList[i].district
									+ "</tr></td>"
						}
							info += "</div></table>"
							$("#districtList").html(info);
					}
				});//ajax
			});//click
			$("#done").click(function() {
				$("#locationBtn").remove();
				var selValue = $('input[name=district]:checked').val(); 
				address += " "+selValue;
				$("#location").text(address);
				$('#addr').val(address);
			});//click
		});//ready
</script>
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
						<form id="form-submit" action="academySearch.do" method="get">
							<div class="row">
								<div class="col-md-3 third-item">
									<!-- JB modal TEST -->
									<div id="location">
									<button type="button" data-toggle="modal" data-target="#provinceModal" id="locationBtn" data-backdrop="false">지역선택3</button>
									</div>
									<!--  province Modal -->
									<div class="modal fade" id="provinceModal" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title">지역선택</h4>
												</div>
												<div class="modal-body">
													<div id="provinceList" ></div>
												</div>
												<div class="modal-footer">
													<button type="button" data-dismiss="modal">닫기</button>
													<button type="button" data-toggle="modal" data-target="#districtModal" id="districtBtn" data-dismiss="modal" data-backdrop="false">다음</button>
												</div>
											</div>
										</div>
									</div>
									<!-- district modal -->
									<div class="modal fade" id="districtModal" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title">지역선택</h4>
												</div>
												<div class="modal-body">
													<div id="districtList"></div>
												</div>
												<div class="modal-footer">
													<button type="button" data-toggle="modal" data-target="#provinceModal" id="locationBtn" data-dismiss="modal" data-backdrop="false">뒤로</button>
													<button type="button" data-dismiss="modal">닫기</button>
													<button type="button" data-dismiss="modal" id="done">선택완료</button>
												</div>
											</div>
										</div>
									</div>
									<!-- JB modal TEST -->
								</div>
								<div class="col-md-3 first-item">
									<fieldset>
										<input name="curName" type="text" class="form-control" placeholder="교육과정">
									</fieldset>
								</div>
								<div class="col-md-3 second-item">
									<fieldset>
										<input name="search" type="text" class="form-control" placeholder="검색어">
									</fieldset>
								</div>
								<div class="col-md-3">
									<fieldset>
										<input type="hidden"  id="addr" name = "academyVO.acaAddr"  >
										<button id="form-submit" class="btn">Search Now</button>
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