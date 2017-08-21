<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script language="javascript">
	var XMLHttpRequestObject = false;

	if (window.XMLHttpRequest) {
		XMLHttpRequestObject = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		XMLHttpRequestObject = new ActiveXObject("Microsoft.XMLHTTP");
	}

	function getData(dataSource) {
		if (XMLHttpRequestObject) {
			XMLHttpRequestObject.open("GET", dataSource);

			XMLHttpRequestObject.onreadystatechange = function() {
				if (XMLHttpRequestObject.readyState == 4
						&& XMLHttpRequestObject.status == 200) {

					var string = XMLHttpRequestObject.responseText
							.match(/text/g);
					alert(string);
				}
			}

			XMLHttpRequestObject.send(null);
		}
		
		function validateInput(input, text){
			for (var int = 0; int < input.length; int++) {
				for (var int2 = 0; int2 < text.length; int2++) {
					if (input.charAt(int)==text.charAt(int2)) {
						continue;
					}else if(int2==text.length-1 && input.charAt(int)!=text.charAt(int2)){
						alert("Wrong character");
					}					
				}
			}
		}
		function checkInput() {
			var text1 = document.getElementById("text1");
			var text2 = document.getElementById("text2");
			alert(text1);
			alert(text2);
		}
</script>
</head>
<body>
	<h1>Fetching data with Ajax & javaScript</h1>

	<form>	
			<p id="text1">cinta</p>			
			<p id="text2">cinta</p>
		<input type="button" value="Display Message"
			onclick="getData('listWord.txt')"> </input>
		<input type="button" value="test"
			onclick="checkInput()"> </input>
	</form>
</body>
</html>