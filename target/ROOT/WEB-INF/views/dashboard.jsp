<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="fragments/header.jsp" />
<spring:url value="/resources/js/chart.bundle.min.js" var="chartJs" />
<script src="${chartJs}"></script>
<spring:url value="/resources/js/datatables.min.js" var="dataTableJs" />
<script src="${dataTableJs}"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/datatables.min.css" />
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="card col-lg-3 mb-2">
				<div class="row">
					<img style="overflow: visible; height: auto;"
						width="25%" src="/resources/images/svg/device-mobile.svg" />
					<h4 class="card-title align-middle" style="margin-top: 0.75rem;">Top
						Phone Sales</h4>
				</div>
				<div class="card-block">
					<div>
						<h2 class="text-center">Reserved</h2>
					</div>
				</div>
			</div>
			<div class="card col-lg-3 mb-2">
				<div class="row">
					<img style="overflow: visible; height: auto;"
						width="25%" src="/resources/images/svg/issue-opened.svg" />
					<h4 class="card-title align-middle" style="margin-top: 0.75rem;">Reserved</h4>
				</div>
				<div class="card-block">
					<div>
						<h2 class="text-center">Reserved</h2>
					</div>
				</div>
			</div>
			<div class="card col-lg-3 mb-2">
				<div class="row">
					<img style="overflow: visible; height: auto;"
						width="25%" src="/resources/images/svg/graph.svg" />
					<h4 class="card-title align-middle" style="margin-top: 0.75rem;">Reserved</h4>
				</div>
				<div class="card-block">
					<div>
						<h2 class="text-center">Reserved</h2>
					</div>
				</div>
			</div>
			<div class="card col-lg-3 mb-2">
				<div class="row">
					<img style="overflow: visible; height: auto;"
						width="25%" src="/resources/images/svg/file-text.svg" />
					<h4 class="card-title align-middle" style="margin-top: 0.75rem;">Reserved</h4>
				</div>
				<div class="card-block">
					<div>
						<h2 class="text-center">Reserved</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="card container">
		<div class="card-block row">
			<div class="col-lg-6">
				<div>
					<h2 class="text-center">Goals</h2>
				</div>
				<div>
					<div class="mb-4">
						<div>
							<span>Sales</span>
						</div>
						<div class="progress">
							<div
								class="progress-bar progress-bar-striped progress-bar-animated"
								role="progressbar" aria-valuenow="75" aria-valuemin="0"
								aria-valuemax="100" style="width: 75%">700/1000</div>
						</div>
					</div>
				</div>
				<div>
					<div class="mb-4">
						<div>
							<span>New Customers</span>
						</div>
						<div class="progress">
							<div
								class="progress-bar progress-bar-striped progress-bar-animated bg-info"
								role="progressbar" aria-valuenow="15" aria-valuemin="0"
								aria-valuemax="100" style="width: 15%">150/1000</div>
						</div>
					</div>
				</div>
				<div>
					<div class="mb-4">
						<div>
							<span>Performance</span>
						</div>
						<div class="progress">
							<div
								class="progress-bar progress-bar-striped progress-bar-animated"
								role="progressbar" aria-valuenow="40" aria-valuemin="0"
								aria-valuemax="100" style="width: 40%">400/1000</div>
						</div>
					</div>
				</div>
			</div>
			<div style="position: relative; height: 400px;" class="col-lg-6">
				<canvas id="myChart"></canvas>
			</div>
		</div>
		<div class="col-lg-6 offset-lg-6 row">
			<select class="btn btn-outline-primary col-lg-3 offset-lg-5" id="chartType">
				<option value="bar">Bar Graph</option>
				<option value="line">Line Graph</option>
				<option value="polarArea">Polar Area Chart</option>
				<option value="radar">Radar Chart</option>
			</select> 
			<a href="#" class="btn btn-outline-primary col-lg-3 offset-lg-1" id="imgUrl" download="chart.png">Save Chart</a>
			<%--<button id="printBtn">Print</button>--%>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			var myChart;
			var imgUrl;
			var popup;
			var ctx = $('#myChart');
			var config;

			function exportChart() {
				imgUrl = myChart.toBase64Image();
				$("#imgUrl").attr("href", imgUrl);
			}
			/*
			$("#printBtn").click(function() {
				popup = window.open(imgUrl);
				popup.onbeforeunload = closePrint;
				popup.onafterprint = closePrint;
				popup.focus();
				popup.print();
			});

			function closePrint() {
				if (popup) {
					popup.close();
				}
			}
			// sample data, to use ajax in near future
			var config = {
				type : 'bar',
				data : {
					labels : [ "June", "July", "August", "September", "October",
							"November", "December" ],
					datasets : [ {
						label : "company1",
						data : [ 1, 1, 2, 3, 4, 5, 6 ],
						fill : false,
						borderColor : "purple",
						backgroundColor : "purple"
					}, {
						label : "company2",
						data : [ 1, 2, 4, 8, 3, 2, 4 ],
						fill : false,
						borderColor : "green",
						backgroundColor : "green"
					} ]
				},
				options : {
					responsive : true,
					maintainAspectRatio : false,
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero: true
							}
						}]
					},
					animation: {
						onComplete: exportChart
					}
				}
			};
			 */

			// should use serialize with real form
			var formData = {
				'chartType' : 'bar'
			};

			function plotChart() {
				$.ajax({
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					type : "POST",
					url : "${home}report/getReportData",
					dataType : 'json',
					data : JSON.stringify(formData),
					success : function(data) {
						config = data;
						//console.log("DATA: ", config);
						config.options['scales'] = {
							'yAxes' : [ {
								'ticks' : {
									'beginAtZero' : true
								}
							} ]
						};
						config.options['animation'] = {
							'onComplete' : exportChart
						};
						var ctx = $('#myChart');
						myChart = new Chart(ctx, config);
					},
					error : function(e) {
						console.log("ERROR: ", e);
					}
				});
			}

			plotChart();

			$('#chartType').change(function() {
				myChart.destroy();
				formData.chartType = this.value;
				plotChart();
			});
		});
	</script>
</body>
</html>