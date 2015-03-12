<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ page import="java.util.*,java.text.SimpleDateFormat"%>
<jsp:useBean id="mystringutil" class="memo.yueyiqiu.tool.StringUtil" scope="page" ></jsp:useBean>
<% 

String mydate=request.getParameter("date");

if(mydate==null||mydate.equals("")){
	mydate=new SimpleDateFormat("yyyy-M-d").format(new Date());
}

Date nowdate=new Date();
String time=nowdate.getHours()+":"+mystringutil.formatNO(nowdate.getMinutes(), 2);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
$(function(){
		$("input[name='remindMode']").click(function(){
				var flag=$(this).val();
				flag=parseInt(flag)+1;
				alert(flag);
				
				var weekArray=new Array("�g��","�g�@","�g�G","�g�T","�g�|","�g��","�g��");
				var temp="";
				var month_temp="";
				var year_temp="";
				for(var i=0;i<7;i++){
						temp+="<input type='checkbox' name='flag' class='noborder' value='"+(i+1)+"'  />"+weekArray[i];
					}
				
				for(var i=1;i<32;i++){
					var tt=i;
					if(i<10)
						tt="0"+i;
					month_temp+="<input type='checkbox' name='flag' class='noborder' value='"+i+"' size='10' />"+tt+"��";
					
					var ptr=i;
					ptr=parseInt(ptr);
					
					if(ptr%9==0)
						month_temp+="<br/>";
					}
				
				alert(month_temp);
				year_temp+="<select name='flag_m' >";
				for(var i=1;i<=12;i++){
					year_temp+="<option value='"+i+"'>"+i+"</option>";
					}
				year_temp+="</select>��";
				var day_input=$("<input type='text' name='flag_d' size='2' value='1' />").blur(function(){alert("OK");});
				var d_text=$("<span>��</span>");

				var once=$("<input type='text' name='flag' value='<%=mydate%>' size='10' />").blur(function(){alert("YY");});
				
				switch(flag){
						case 1:
							var content="";
							$("#remindFlag").html("���G���");
							$("#remindFlag").append(once);
							break;
						case 2:
							$("#remindFlag").html("");
							$("#remindFlag").css("height","0px");
							break;
						case 3:
							$("#remindFlag").html(temp);
							break;
						case 4:
							$("#remindFlag").html(month_temp);
							break;
						case 5:
							$("#remindFlag").html(year_temp);
							$("#remindFlag").append(day_input);
							$("#remindFlag").append(d_text);
							break;
					}
				
			});
});
</script>
</head>
<body>
<img src="images/add_top.gif" />
<form action="MemoServlet?action=add" method="post" >
<table width="650px" cellpadding="0" cellspacing="0" border="1" align="center">
<tr height="30px">
<td width="5%">&nbsp;</td>
<td width="11%">���D:</td>
<td width="84%">
<input type="text" name="title" size="40" />
</td>
</tr>
<tr height="30px">
<td>&nbsp;</td>
<td>�����覡:</td>
<td>
<input type="radio" name="remindMode" class="noborder" value="0" />�榸&nbsp;
<input type="radio" name="remindMode" class="noborder" value="1" />�C��&nbsp;
<input type="radio" name="remindMode" class="noborder" value="2" />�C�P&nbsp;
<input type="radio" name="remindMode" class="noborder" value="3" />�C��&nbsp;
<input type="radio" name="remindMode" class="noborder" value="4" />�C�~&nbsp;
</td>
</tr>
<tr height="30px">
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>
�������:
<input type="text" name="flag" value="<%=mydate%>" size="" />
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td id="remindFlag">
�����ɶ�:
<input type="text" name="remindTime" size="10" value="<%=time%>" />
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>��&nbsp;&nbsp;&nbsp;&nbsp;�e</td>
<td>
<textarea name="content" rows="60" cols="10"></textarea>
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>
<input name="submit_btn" type="submit" value="�O�s" class="btn_bg" />
<input name="reset_btn" type="reset" value="���m" class="btn_bg" />
</td>
</tr>
</table>
</form>

</body>
</html>