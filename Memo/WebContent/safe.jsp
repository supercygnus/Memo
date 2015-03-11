<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
<% 
if(session.getAttribute("userName")==null||session.getAttribute("userName")==""){
	out.println("<script type='text/javascript'>alert('您還沒有登入');window.location.href='index.jsp';</script>");
}
%>
</body>
</html>