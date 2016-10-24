<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bitfire:Profile</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link href="https://fonts.googleapis.com/css?family=Exo+2|Rokkitt"
	rel="stylesheet">
<link href="css/bitfire-profile.css" rel="stylesheet">


</head>
<body>
	<!-- Static navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">
					<div class="logo text-center">
						<img src="assets/img/fire.png" alt=""
							style="width: 50px; height: 50px;">
						<h2 class="web-font">
							<span class="ignite web-font">BIT</span><span
								class="white web-font">FIRE</span>
						</h2>
					</div>
				</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Profile</a></li>
					<li><a href="#">Transactions</a></li>
					<li><a href="#">Send &amp; Request</a></li>
					<li><a href="#">Wallet</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Logout</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

	<div class="jumbotron">
		<div class="container">
			<h3>Welcome, Name Goes Here!</h3>
		</div>
	</div>

	<div class="container wrapper">
		<div class="page-header text-center web-font">
			<h2>Account Summary</h2>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading">
							<a href="#">BitFire Balance <span
								class="glyphicon glyphicon-chevron-right pull-right"
								aria-hidden="true"></span></a>
						</div>

						<div class="panel-body">
							<p>Balance: Goes here</p>

							<ul style="list-style: none;">
								<li><a href="#">Add Bitcoins</a></li>
								<li><a href="#">Address Bitcoin Transfer</a></li>
							</ul>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<a href="#">Addresses <span
								class="glyphicon glyphicon-chevron-right pull-right"
								aria-hidden="true"></span></a>
						</div>

						<div class="panel-body">
							<div class="row">
								<div class="col-md-5">
									<p>
										<strong></>Label of Address 1</strong>
									</p>
								</div>
								<div class="col-md-7">
									<p>Address 1</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-5">
									<p>
										<strong>Label of Address 2</strong>
									</p>
								</div>
								<div class="col-md-7">
									<p>Address 2</p>
								</div>
							</div>
						</div>

						<div class="panel-footer text-center">
							<a href="wallet.html"><strong>Manage Wallet</strong></a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-heading trans-panel">Transactions</div>

					<div class="panel-body">
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading trans" role="tab" id="headingOne">
									<h4 class="panel-title">
											<a role="button" data-toggle="collapse"
												data-parent="#accordion" href="#collapseOne"
												aria-expanded="true" aria-controls="collapseOne">
												Transaction 1</a>
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">Transaction details go here</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading trans" role="tab" id="headingTwo">
									<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse"
												data-parent="#accordion" href="#collapseTwo"
												aria-expanded="false" aria-controls="collapseTwo">
												Transaction 2 </a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingTwo">
									<div class="panel-body">Transaction details go here</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading trans" role="tab" id="headingThree">
									<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse"
												data-parent="#accordion" href="#collapseThree"
												aria-expanded="false" aria-controls="collapseThree">
												Transaction 3 </a>
									</h4>
								</div>
								<div id="collapseThree" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingThree">
									<div class="panel-body">Transaction details go here</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-footer text-center">
						<a href="trasactions.html"><strong>View All</strong></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>