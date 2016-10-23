<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "<c:url value='/user/send.html' />" method = "post">
	<input type = "email" name = "email" placeholder = "recepeient's email"/>
	<input type ="text" name = "btc" placeholder ="amout of BTC to send"/>
	<input type ="submit" value = "Send" />
</form>

</body>
</html>