<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
관리자 로그인 확인 화면입니다.
관리자 여부 : ${sessionScope.admin.customerFlag}
${sessionScope.admin.customerName}님 환영합니다.

</body>
</html>