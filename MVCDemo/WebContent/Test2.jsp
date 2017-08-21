<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script language="javascript">
	var i = 0;
	function check() {
		var str1 =  document.getElementById("text1").innerHTML.toLowerCase();;
		var str2 = document.getElementById("text2").innerHTML.toLowerCase();;
		for (var int = 0; int < str1.length; int++)
			for (var int2 = 0; int2 < str2.length; int2++) {
				if (str1.charAt(int).localeCompare(str2.charAt(int2)) == 0) {
					i++;
					continue;
				}
			}
		if (i != 5)
			alert("wrong");
		else
			alert("good");
	}
</script>
</head>
<body>
	<form>
			<p id="text1">DLEAR</p>
			<p id="text2">edlar</p>
		<input type="button" value="Display Message" onclick="check()">
		</input>
</body>
</html>