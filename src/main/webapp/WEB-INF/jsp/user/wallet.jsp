<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Wallet</title>
</head>
<body>

<form action ="<c:url value='/user/addaddress.html' />" action ='get'>

<table border="1">
<tr><th>Address</th><th>Label</th><th>USD</th><th>BTC</th><th>Primary</th><th>Edit</th><th>Archive</th></tr>

<c:forEach items="${addresses}" var="address">
<tr>
	<td>${address.address}</td>
	<td>${address.label}</td>
	<td>${address.USD}</td>
	<td>${address.bitcoins}</td>
	<c:if test="${address.primary }">
	<td>Primary</td>
	</c:if>
		<c:if test="${not address.primary }">
	<td></td>
	</c:if>
	
	<td><a href="<c:url value='/user/editaddress.html?id=${ address.addressId }' />">Edit</a></td>
	<td><a href="<c:url value='/user/archiveaddress.html?id=${ address.addressId }' />">Archive</a></td>
	
</tr>
</c:forEach>
</table>
<input type="submit" value="Add address" />
</form>
<p>${error}</p>
</body>
</html>