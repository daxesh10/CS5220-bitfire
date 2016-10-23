<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Address</title>
</head>
<body>

<form:form modelAttribute="address">
<table border="1">

<tr><th>Label</th><th>Address</th><th>USD</th><th>BTC</th><th>Primary</th></tr>
<tr>
	<td><form:input path = "label" /></td>
	<td>${address.address}</td>
	<td>${address.USD}</td>
	<td>${address.bitcoins}</td>
	
	<c:if test="${not address.primary }">
		<td><input type="checkbox"  name = "primary" id="primary" /></td>
	</c:if>
	
	<c:if test="${address.primary }">
		<td>Primary</td>
	</c:if>
</tr>

</table>
<input type = "submit" name = "save" value = "Save" /> 
</form:form>
</body>
</html>