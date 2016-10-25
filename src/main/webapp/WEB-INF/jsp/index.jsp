<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

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
	<nav class="navbar navbar-default navbar-fixed-top" >
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value ='/index.html'/>">
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
				<security:authorize access="authenticated">
			
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.html">Profile</a></li>
					<li><a href="<c:url value='/user/transactions.html' />">Transactions</a></li>
					<li><a href="<c:url value='/user/send.html' />">Send
							Bitcoin</a></li>
					<li><a href="<c:url value='/user/wallet.html' />">Wallet</a></li>
				</ul></security:authorize>
				<ul class="nav navbar-nav navbar-right">
					<li><security:authorize access="anonymous">
							<a href="<c:url value='/login.html' />">Login</a>
						</security:authorize> <security:authorize access="authenticated">
							<a href="<c:url value='/logout' />">Logout</a>
						</security:authorize></li>
					<li><security:authorize access="anonymous"><a href="register.html">Sign Up</a></security:authorize></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<security:authorize access="authenticated">
		<div class="jumbotron">
			<div class="container">
				<h1>Welcome, ${user.name }!</h1>
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
								<p><strong>Balance:</strong> ${balance} BTC</p>

								<ul style="list-style: none;">
									<a href="<c:url value='/user/send.html' />">Send Bitcoin</a>
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
							
							<c:forEach items = "${addresses}" var = "address">
								<div class="row">
									<div class="col-md-5">
										<p>
											<strong></>${address.label}</strong>
										</p>
									</div>
									<div class="col-md-7">
										<p>${address.address}</p>
									</div>
								</div>
							</c:forEach>
							</div>

							<div class="panel-footer text-center">
								<a href="<c:url value='/user/wallet.html' />">Manage Wallet</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<div class="panel panel-default">
						<div class="panel-heading trans-panel">Transactions</div>

						<c:forEach items="${transactions }" var="trans" varStatus="i">
							<div class="panel-body">
								<div class="panel-group" id="accordion" role="tablist"
									aria-multiselectable="true">
									<div class="panel panel-default">
										<div class="panel-heading trans" role="tab"
											id="heading${i.index}">
											<h4 class="panel-title title">
												<c:if test="${i.index == 1 }">
													<a role="button" data-toggle="collapse"
														data-parent="#accordion" href="#collapse${i.index}"
														aria-expanded="true" aria-controls="collapse${i.index}">
														<div class="row">
															<div class="col-md-4">${trans.date }</div>
															<div class="col-md-5">
																<c:if
																	test="${ trans.senderUser.userId eq trans.receiverUser.userId}">
																	<td>Self transfer</td>
																</c:if>

																<c:if
																	test="${ trans.senderUser.userId ne trans.receiverUser.userId}">
																	<c:if test="${user.userId eq trans.senderUser.userId}">
																		<td>Sent</td>
																	</c:if>
																	<c:if
																		test="${ user.userId eq trans.receiverUser.userId}">
																		<td>Received</td>
																	</c:if>
																</c:if>
															</div>
															<div class="col-md-3">
																<c:if
																	test="${ trans.senderUser.userId eq trans.receiverUser.userId}">
																	<td><span class="glyphicon glyphicon-plus"
																		style="color: #3ea134" aria-hidden="true"></span>
																		${trans.bitcoin}</td>
																</c:if>

																<c:if
																	test="${ trans.senderUser.userId ne trans.receiverUser.userId}">
																	<c:if test="${user.userId eq trans.senderUser.userId}">
																		<td><span class="glyphicon glyphicon-minus"
																			style="color: #ff0000" aria-hidden="true"></span>
																			${trans.bitcoin}</td>
																	</c:if>
																	<c:if
																		test="${ user.userId eq trans.receiverUser.userId}">
																		<td><span class="glyphicon glyphicon-plus"
																			style="color: #3ea134" aria-hidden="true"></span>
																			${trans.bitcoin}</td>
																	</c:if>
																</c:if>
															</div>
														</div>
													</a>
												</c:if>
												<c:if test="${i.index != 1 }">
													<a role="button" data-toggle="collapse"
														data-parent="#accordion" href="#collapse${i.index}"
														aria-expanded="false" aria-controls="collapse${i.index}">
														<div class="row">
															<div class="col-md-4">${trans.date }</div>
															<div class="col-md-5">
																<c:if
																	test="${ trans.senderUser.userId eq trans.receiverUser.userId}">
																	<td>Self transfer</td>
																</c:if>

																<c:if
																	test="${ trans.senderUser.userId ne trans.receiverUser.userId}">
																	<c:if test="${user.userId eq trans.senderUser.userId}">
																		<td>Sent</td>
																	</c:if>
																	<c:if
																		test="${ user.userId eq trans.receiverUser.userId}">
																		<td>Received</td>
																	</c:if>
																</c:if>
															</div>
															<div class="col-md-3">
																<c:if
																	test="${ trans.senderUser.userId eq trans.receiverUser.userId}">
																	<td><span class="glyphicon glyphicon-plus"
																		style="color: #3ea134" aria-hidden="true"></span>
																		${trans.bitcoin}</td>
																</c:if>

																<c:if
																	test="${ trans.senderUser.userId ne trans.receiverUser.userId}">
																	<c:if test="${user.userId eq trans.senderUser.userId}">
																		<td><span class="glyphicon glyphicon-minus"
																			style="color: #ff0000" aria-hidden="true"></span>
																			${trans.bitcoin}</td>
																	</c:if>
																	<c:if
																		test="${ user.userId eq trans.receiverUser.userId}">
																		<td><span class="glyphicon glyphicon-plus"
																			style="color: #3ea134" aria-hidden="true"></span>
																			${trans.bitcoin}</td>
																	</c:if>
																</c:if>
															</div>
														</div>
													</a>
												</c:if>
											</h4>
										</div>
										<div id="collapse${i.index}"
											class="panel-collapse collapse in" role="tabpanel"
											aria-labelledby="heading${i.index}">
											<div class="panel-body">
												<div class="row">
													<div class="col-md-3">${trans.senderUser.username}</div>
													<div class="col-md-1">
														<a href="https://blockchain.info/tx/${trans.txId }">TX</a>
													</div>
													<div class="col-md-3">${trans.bitcoin } BTC</div>
													<div class="col-md-2">${trans.USD}</div>
													<div class="col-md-3"><strong>Confirmations:</strong> ${trans.confirmations }</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<div class="panel-footer text-center">
							<a href="<c:url value='/user/transactions.html' />">View All
								Transactions</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</security:authorize>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>