<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!-- <%@ include file="safe.jsp"%> -->
<%@ page import="java.util.*,java.io.*,java.text.*"%>
<% 
String user=(String)session.getAttribute("userName");


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
$(function(){
		$("a[name='addmemo']").click(function(){
				window.open("memo_add.jsp","","width='694',height='519'");
			});
});
</script>
</head>
<body>
<%@include file="top.jsp"%>
<div id="main">
<div id="left">
<table>
<tr>
<td colspan="2" background="images/left_title.jpg">

</td>
</tr>
<tr>
<td>

</td>
<td>
	<table>
		<tr>
			<td><a href="#" name="addmemo">添加備忘錄</a></td>
			<td><a href="MemoServlet?action=listAll" target="_blank">查看全部備忘錄</a></td>
		</tr>
	</table>
</td>
</tr>
</table>
</div>
<div>

</div>
</div>
fsdfsf
</body>
</html>