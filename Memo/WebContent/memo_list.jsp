<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="BIG5"%>
<%@ page import="memo.yueyiqiu.model.*,java.util.*"%>
<%
List<MemoForm> list=(List)request.getAttribute("memoList");
String temp="";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
$(function(){

	$("a#del_a").click(function(){
			var id=$(this).attr("fid");
			//alert(id);
			if(confirm("�u���n�R���o�ӰT����?")==true){
					window.location.href="MemoServlet?action=del&id="+id;
				}
		});
	
	
});
</script>
</head>
<body>
<div>
<table>
<tr>
<td>
<form action="MemoServlet?action=search" method="post">
�п�J�d������r:
<input name="key" type="text" size="40"/>
&nbsp;
<input name="submit_b" type="submit" value="�d��" class="btn_bg" />
</form>
</td>
</tr>
<tr height="5px"><td></td></tr>
</table>
<table width="98%" height="60px" cellpadding="0" cellspacing="0">
<tr>
<td width="17%" align="center">���D</td>
<td width="49%" align="center">���e</td>
<td width="8%" align="center">�����ɶ�</td>
<td width="7%" align="center">�����覡</td>
<td width="15%" align="center">�������</td>
<td width="4%" align="center">�R��</td>
</tr>
<% 
if(list.size()==0){%>
<tr>
<td colspan="6">�ȵL�Ƨѿ��T��</td>
</tr>
<% 	
}
else{
	for(int i=0;i<list.size();i++){
		MemoForm f=list.get(i);
		int remindMode=f.getRemindMode();
		switch(remindMode){
			case 0:temp="�榸";break;
			case 1:temp="�C��";break;
			case 2:temp="�C�P";break;
			case 3:temp="�C��";break;
			case 4:temp="�C�~";break;
		}
		String flag=f.getFlag();
		if(remindMode==2){
			flag=flag.substring(0,flag.length()-1);
			String[] arrFlag=flag.split(",");
			int week=0;
			flag="";
			for(int j=0;j<arrFlag.length;j++){
				week=Integer.parseInt(arrFlag[j]);
				switch(week){
					case 1:flag+="�g�@,";break; 
					case 2:flag+="�g�G,";break; 
					case 3:flag+="�g�T,";break; 
					case 4:flag+="�g�|,";break; 
					case 5:flag+="�g��,";break; 
					case 6:flag+="�g��,";break; 
					case 7:flag+="�g��,";break; 
				}
			}
			flag=flag.substring(0,flag.length()-1);
		}
		else if(remindMode==3){
			flag=flag.substring(0,flag.length()-1);
		}%>
<tr height="27px">
<td><%=f.getTitle()%></td>
<td><%=f.getContent() %></td>
<td><%=f.getRemindTime() %></td>
<td><%=temp %></td>
<td><%=flag %></td>
<td><a href="#" id="del_a" fid="<%=f.getId()%>"><img src="images/del.gif" border="0"></a></td>
</tr>
	<%
	}
}
%>
</table>
</div>
</body>
</html>