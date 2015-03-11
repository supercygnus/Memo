<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
$(function(){

	//alert("hello");
	$("input[name='submitbtn']").click(function(){
			if($("input[name='username']").val()==""){
						alert("請輸入使用者名稱");
						return false;
				}
			if($("input[name='password']").val()==""){
				alert("請輸入密碼");
				return false;
			}
			$("form[name='myform']").submit();
		});
	
});

</script>

</head>
<body>
<form action="UserServlet?action=login" method="post" name="myform">
<table align="center" width="583px" height="281px" border="1" cellpadding="0" cellspacing="0" background="images/bg_login.jpg">
<tr>
<td height="173px" colspan="2"></td>
</tr>
<tr>
<td width="200px" height="27px">
用戶名
</td>
<td width="283px">
<input type="text" name="username" />
</td>
</tr>
<tr>
<td>
密碼
</td>
<td>
<input type="password" name="password" />
</td>
</tr>
<tr>
<td colspan="2">
<input type="button" class="btn_bg" name="submitbtn" value="送出"/>&nbsp;&nbsp;&nbsp;
<input type="reset" class="btn_bg" name="resetbtn" />
</td>
</tr>
</table>
</form>

</body>
</html>