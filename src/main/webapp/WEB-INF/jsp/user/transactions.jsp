<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transactions</title>
</head>
<body>

<table border="1">
<tr><th>Type</th><th>Date</th><th>Email</th><th>TX</th><th>BTC</th><th>USD</th><th>Confirmations</th></tr>
<c:forEach items="${transactions}" var="trans">
<tr>
	<c:if test = "${user.userId eq trans.senderUser.userId}" >
		<td>Sent</td>
	</c:if>
	<c:if test = "${ user.userId eq trans.receiverUser.userId}" >
		<td>Received</td>
	</c:if> 
	<td>${trans.date}</td>
	<td>${trans.senderUser.username}</td>
	<td>${trans.txId}</td>
	<td>${trans.bitcoin}</td>
	<td>${trans.USD}</td>
	<td>${trans.confirmations}</td>
</tr>
</c:forEach>
</table>
</body>
</html>