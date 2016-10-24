<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Self transfer</title>
</head>
<body>

<form action ="<c:url value= '/user/selftransfer.html'/>" method = "post">
FROM: 
<select name = "from">
<c:forEach items="${addresses}" var="address">
	<option value="${address.addressId}">${address.label} : ${address.address} : ${address.bitcoins}</option>
</c:forEach>
</select>

</br>

TO: 
<select name = "to">
<c:forEach items="${addresses}" var="address">
	<option  value="${address.addressId}">${address.label} : ${address.address} : ${address.bitcoins}</option>
</c:forEach>
</select>

</br>
Amount
<input type = "text" name = "amount" placeholder = "amount to tranfser" />
</br>

<input type = "submit" value ="Transfer" />
</form>

<p>${error}</p>
</body>
</html>