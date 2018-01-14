<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<jsp:include page="fragments/header.jsp" />
	<link href="/resources/css/octicons.css" rel="stylesheet" />
	<!-- Bootstrap Date-Picker Plugin -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
</head>
<body class="container-fluid">
	<div id="promoDeck" class="card-deck text-center">
		<div class="card no-pad promoCard">
			<img class="card-img-top promo-img padded" src="/resources/images/sample.jpg" alt="sample image" /><br />
			<div class="card-block p-t-2">
				<h4 class="card-title">Sample promo</h4>
				<p class="card-text">lorem ipsum ......</p>
			</div>
		</div>
		<div class="card no-pad promoCard" data-toggle="modal" data-target="#myForm">
			<img class="promo-img add-img padded v-align" src="/resources/images/svg/plus.svg" alt="add promo" />
		</div>
		<div class="col-xs-4"></div>
	</div>
	<div id="myForm" class="modal fade" role="form">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title text-center">Add New Promotion</h4>
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="container-fluid modal-body">
					<br />
					<form class="form-horizontal" action="#">
						<div class="form-group row">
							<label class="control-label col-sm-4" for="promoName">Promotion Name:<span class="required"> *</span></label>
							<div class="col-sm-8"><input type="text" class="form-control" id="promoName" name="promoName" placeholder="Enter promotion name" /></div>
						</div>
						<div class="form-group row">
							<label class="control-label col-sm-4" for="promoDesc">Description: (optional)</label>
							<div class="col-sm-8"><textarea class="form-control" id="promoDesc" name="promoDesc" rows="4" cols="55" placeholder="Enter promotion description here"></textarea></div>
						</div>
						<div class="form-group row">
							<label class="control-label col-sm-4" for="link">URL Link:<span class="required"> *</span></label>
							<div class="col-sm-8"><input type="text" class="form-control" id="link" placeholder="https://www.facebook.com/page/posts/1234567890" name="link" /></div>
						</div>
						<div class="form-group row">
							<label class="control-label col-sm-4" for="action">Action Type:<span class="required"> *</span></label>
							<div class="col-sm-8">
								<label class="radio-inline"><input type="radio" name="action" value="A"> Analysis Only</label>
								&nbsp;&nbsp;&nbsp;
								<label class="radio-inline"><input type="radio" name="action" value="E"> Engagement Only</label>
								&nbsp;&nbsp;&nbsp;
								<label class="radio-inline"><input type="radio" id="action_default" name="action" value="B" checked> Analysis &#38; Engagement</label>
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-sm-4" for="status">Promotion Status:<span class="required"> *</span></label>
							<div class="col-sm-8">
								<label class="radio-inline"><input type="radio" id="status_default" name="status" value="A" onclick="trigger_date_input(value)" checked /> Active</label>
								&nbsp;&nbsp;&nbsp;
								<label class="radio-inline"><input type="radio" name="status" value="I" onclick="trigger_date_input(value)" /> Inactive</label>
							</div>
						</div>
						<div id="promoFrom" class="form-group row">
							<label class="control-label col-sm-4" for="dateTo">Promotion From:<span class="required"> *</span></label>
							<div class="col-sm-8 date">
								<input type="text" class="form-control" id="dateFrom" name="dateFrom" onkeydown="return false" disabled />
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-sm-4" for="dateTo">Promotion Until:<span class="required"> *</span></label>
							<div class="col-sm-8 date">
								<input type="text" class="form-control" id="dateTo" name="dateTo" onkeydown="return false" />
							</div>
						</div>
						<br />
						<div class="form-group">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('#myForm').on('hidden.bs.modal', function() {
			$(this)
				.find('input[type=text]').val('').end()
				.find('textarea').val('').end()
				.find('input[type=radio]').prop('checked', false).end();
			document.getElementById("action_default").checked = true;
			document.getElementById("status_default").checked = true;
			document.getElementById("promoFrom").style.display = "none";
		});

		function trigger_date_input(value) {
			var obj_wrapper = document.getElementById("promoFrom");
			var obj = document.getElementById("dateFrom");
			if (value == "A") {
				obj_wrapper.style.display = "none";
				obj.disabled = true;
				$('#dateFrom').val('');
			} else {
				obj_wrapper.style.display= "flex";
				obj.disabled = false;
				$('#dateTo').datepicker('setStartDate', new Date());
			}
		}

		$(document).ready(function() {
			$('#dateTo').datepicker({
				format : 'mm/dd/yyyy',
				startDate : new Date(),
				autoclose : true,
				orientation : 'bottom'
			}).on('changeDate', function(selected) {
				$('#dateFrom').datepicker('setEndDate', new Date(selected.date.valueOf()));
			});

			$('#dateFrom').datepicker({
				format : 'mm/dd/yyyy',
				startDate : new Date(),
				autoclose : true,
				orientation : 'bottom'
			}).on('changeDate', function(selected) {
				$('#dateTo').datepicker('setStartDate', new Date(selected.date.valueOf()));
			});
		})
	</script>
</body>
</html>