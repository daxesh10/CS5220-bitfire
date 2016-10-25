<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bitcoin:Self Transfer</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link href="https://fonts.googleapis.com/css?family=Exo+2|Rokkitt"
	rel="stylesheet">
<link href="../css/bitfire-wallet.css" rel="stylesheet">
</head>
<body>
<!-- Static navbar -->
	<nav class="navbar navbar-default navbar-fixed-top"  style="height: 70px;">
		<div class="container"> 
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="../index.html">
					<div class="logo text-center">
						<img src="../assets/img/fire.png" alt=""
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
					<li><a href="../index.html">Profile</a></li>
					<li><a href="<c:url value='/user/transactions.html' />">View
							All Transactions</a></li>
					<li><a href="<c:url value='/user/send.html' />">Send
							Bitcoin</a></li>
					<li class="active"><a href="<c:url value='/user/wallet.html' />">Wallet</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value='/logout' />">Logout</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	
	<div class ="container" style = "margin-top:100px">
	<div class = "well">
<form class = "form"action ="<c:url value= '/user/selftransfer.html'/>" method = "post">
FROM: 
<select class = "dropdown" name = "from"  style ="margin-left: 6px;">
<c:forEach items="${addresses}" var="address">
	<option value="${address.addressId}">${address.label} : ${address.address} : ${address.bitcoins}</option>
</c:forEach>
</select>

</br>
</br>
TO:
<select class = "dropdown" name = "to" style = "margin-left: 24px;">
<c:forEach items="${addresses}" var="address">
	<option  value="${address.addressId}">${address.label} : ${address.address} : ${address.bitcoins}</option>
</c:forEach>
</select>

</br>
</br>


<label style = "float: left;"><strong>BTC</strong></label>
<div class="col-xs-3" style = "margin-left: 9px;">

<input type = "text" name = "amount" class="form-control input-md" placeholder = "amount of BTC to tranfser" />

</div>
</br>
</br>
</br>
<input  class = "btn btn-danger" type = "submit" value ="Transfer" />
</form>

<p>${error}</p>
</div>
</div>
</body>
</html>