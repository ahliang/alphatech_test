<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="fragments/header.jsp" />
<link href="/resources/css/octicons.css" rel="stylesheet" />
</head>
<body>
	<section class="carousel slide row" data-ride="carousel" id="promoList">
		<div class="container col-xs-2 lead">
			<a class="btn btn-outline-secondary prev" href="" title="go back"><i class="fa fa-lg fa-chevron-left"></i></a>
		</div>
		<div class="container p-t-0 m-t-2 carousel-inner">
			<div class="row row-equal carousel-item active m-t-0">
				<div class="col-md-4">
					<div class="card container-fluid">
						<div class="card-img-top card-img-top-250">
							<img class="img-fluid" src="/resources/images/sample.jpg" alt="sample image" />
						</div>
						<div class="card-block p-t-2">
							<h4 class="card-title">Sample promo</h4>
							<p class="card-text">lorem ipsum ......</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card container-fluid" data-toggle="modal" data-target="#myForm">
						<div class="card-img-top card-img-top-250">
							<span class="octicon octicon-clippy"><img src="/resources/images/svg/plus.svg" /></span>
						</div>
						<div class="card-block p-t-2">
							<h5 class="card-title">Add Promotion</h5>
							<p class="card-text">Click to add new promotion</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container col-xs-2 lead">
			<a class="btn btn-outline-secondary next" href="" title="more"><i class="fa fa-lg fa-chevron-right"></i></a>
		</div>
	</section>
	<div id="myForm" class="modal fade" role="form">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title text-center">Add New Promotion</h4>
				</div>
				<div class="modal-body">
					<br />
					<form class="form-horizontal" action="#">
						<div class="form-group">
							<label class="control-label col-sm-4" for="promoName">Promotion
								Name:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="promoName"
									placeholder="Enter promotion name" name="promoName" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for="link">URL
								Link:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="link"
									placeholder="Enter link to promotion page" name="link" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for="status">Promotion
								Status:</label>
							<div class="col-sm-8">
								<label class="radio-inline"> <input type="radio"
									name="status" value="A" /> Active
								</label> <label class="radio-inline"> <input type="radio"
									name="status" value="I" /> Inactive
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for="dateTo">Promotion
								Until:</label>
							<div class="col-sm-8 date">
								<input type="text" class="form-control" id="dateTo"
									name="dateTo" />
							</div>
						</div>
						<br />
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-8">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#dateTo').datepicker({
				format : 'mm/dd/yyyy',
				todayHighlight : true,
				autoclose : true,
				orientation : 'top'
			});
		})
	</script>
</body>
</html>