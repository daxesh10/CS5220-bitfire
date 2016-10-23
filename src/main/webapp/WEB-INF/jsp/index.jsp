<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bitfire</title>
</head>
<body>
<h2>Bitfire</h2>
<p>
 <security:authorize access="anonymous">
    <a href="<c:url value='/login.html' />">Login</a>

  </security:authorize> 
 <security:authorize access="authenticated">
    <a href="<c:url value='/logout' />">Logout</a>
    <p>Hi</p>
  </security:authorize>
</p>
</body>
</html>
