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


	$("#popo").click(function(){

			if(CheckDomesticOrForeign()=="D"){
					alert("國內");
				}
			else{
					alert("國外");
				}
			
		});
	
	
});


function kk(){
	alert("hh");
}

function abc(){

	var id=$("#foreid").val();
	
	if (id.length != 10) 
		return false;
	

	if (isNaN(id.substr(2,8)) || (id.substr(0,1)<"A" ||id.substr(0,1)>"Z") || (id.substr(1,1)<"A" ||id.substr(1,1)>"Z")){
		return false;					
	}
	
	var head="ABCDEFGHJKLMNPQRSTUVXYWZIO";
	id = (head.indexOf(id.substr(0,1))+10) +''+ ((head.indexOf(id.substr(1,1))+10)%10) +''+ id.substr(2,8)
	s =parseInt(id.substr(0,1)) + 
	parseInt(id.substr(1,1)) * 9 + 
	parseInt(id.substr(2,1)) * 8 + 
	parseInt(id.substr(3,1)) * 7 + 			
	parseInt(id.substr(4,1)) * 6 + 
	parseInt(id.substr(5,1)) * 5 + 
	parseInt(id.substr(6,1)) * 4 + 
	parseInt(id.substr(7,1)) * 3 + 
	parseInt(id.substr(8,1)) * 2 + 
	parseInt(id.substr(9,1)) + 
	parseInt(id.substr(10,1));

	//判斷是否可整除
	if ((s % 10) != 0) 
	 return false;
	//居留證號碼正確		
	return true;
	
}

function CheckDomesticOrForeign(){

	var id=$("#foreid").val();
	var asciicode=id.substr(1,1).charCodeAt();
	alert(asciicode);
	if((asciicode>=65&&asciicode<=90)||(asciicode>=97&&asciicode<=122))
		return "F";
	else
		return "D";
	
}

</script>
</head>
<body>


<input type="text" id="foreid" />
<input type="button" value="gogo" id="popo" />
</body>
</html>