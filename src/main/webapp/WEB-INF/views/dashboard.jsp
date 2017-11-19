<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<spring:url value="/resources/js/chart.bundle.min.js" var="chartJs" />
<script src="${chartJs}"></script>
<jsp:include page="fragments/header.jsp" />
</head>
<body>
	<div style="position: relative; height: 50vh">
		<canvas id="myChart" width="100" height="100"></canvas>
	</div>

	<div class="form-group">
		<select class="form-control" id="chartType">
			<option value='bar'>Bar Graph</option>
			<option value='line'>Line Graph</option>
			<option value='polarArea'>Polar Area Chart</option>
			<option value='radar'>Radar Chart</option>
		</select>
	</div>

	<script>
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
				maintainAspectRatio: false
			}
		};
		
		var myChart;
		var ctx = $('#myChart');
		myChart = new Chart(ctx, config);
		
		$('#chartType').change(function() {
			myChart.destroy();
			config.type = this.value;
			myChart = new Chart(ctx, config);
		});
	</script>
</body>
</html>