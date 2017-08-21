<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Word Srumbler</title>
<script type='text/javascript' src='jquery-1.9.1.js'></script>
<script type="text/javascript" src="jquery.session.js"></script>
<script language="javascript">
	document
			.write([
					"\<script src='",
					("https:" == document.location.protocol) ? "https://"
							: "http://",
					"ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js' type='text/javascript'>\<\/script>" ]
					.join(''));
	document
			.write([
					"\<script src='",
					("https:" == document.location.protocol) ? "https://"
							: "http://",
					"github.com/AlexChittock/JQuery-Session-Plugin/blob/master/jquery.session.js' type='text/javascript'>\<\/script>" ]
					.join(''));
	var XMLHttpRequestObject = false;
	var point = 0;

	if (window.XMLHttpRequest) {
		XMLHttpRequestObject = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		XMLHttpRequestObject = new ActiveXObject("Microsoft.XMLHTTP");
	}
	createCookie("point", 0, 1);

	function randomWord() {
		var text = "";
		var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

		for (var i = 0; i < 5; i++)
			text += possible
					.charAt(Math.floor(Math.random() * possible.length));
		document.getElementById("text").innerHTML = text;
	}
	function Check() {
		var CheckForm = document.getElementById('WordForm');
		if (CheckForm.elements['txt_Word'].value.length < 5) {
			alert("your word is to short");
			stop;
		}
		var text = "";
		for (var int = 0; int < CheckForm.elements['txt_Word'].value.length; int++) {
			text = text + CheckForm.elements['txt_Word'].value[int];
		}
		var str1 = document.getElementById("text").innerHTML.toLowerCase();
		validate(str1, text);
		getData("listWord.txt", text);
	}
	function getData(dataSource, text) {
		if (XMLHttpRequestObject) {
			XMLHttpRequestObject.open("GET", dataSource);

			XMLHttpRequestObject.onreadystatechange = function() {
				if (XMLHttpRequestObject.readyState == 4
						&& XMLHttpRequestObject.status == 200) {
					var re = new RegExp(text, '');
					var result = XMLHttpRequestObject.responseText.match(re);
					if (result != null) {
						point = parseInt(readCookie("point"),10);
						createCookie("point", (point+1), 1);
						alert("point : "+(point+1));
					} else {
						point = parseInt(readCookie("point"),10);
						createCookie("point", (point-1), 1);
						alert("point : " + (point-1));
					}
				}
			}

			XMLHttpRequestObject.send(null);
		}
	}
	function createCookie(name, value, days) {
		if (days) {
			var date = new Date();
			date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
			var expires = "; expires=" + date.toGMTString();
		} else {
			var expires = "";
		}
		document.cookie = name + "=" + value + expires + "; path=/";
	}

	function readCookie(name) {
		var nameEQ = name + "=";
		var ca = document.cookie.split(';');
		for (var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ') {
				c = c.substring(1, c.length);
			}
			if (c.indexOf(nameEQ) == 0) {
				return c.substring(nameEQ.length, c.length);
			}
		}
		return null;
	}

	function eraseCookie(name) {
		createCookie(name, "", -1);
	}
	var i = 0;
	function validate(str1, str2) {
		for (var int = 0; int < str1.length; int++)
			for (var int2 = 0; int2 < str2.length; int2++) {
				if (str1.charAt(int).localeCompare(str2.charAt(int2)) == 0) {
					i++;
					continue;
				}
			}
		if (i != 5){
			alert("wrong character");
			stop;
		}
	}
</script>
</head>
<body onload="randomWord()">
	<h1>Word Scrumbler</h1>
	<center>
		<br>
		<h2>
			<input type="button" value="other word" onclick="randomWord()">
			<p id="text"></p>
		</h2>

		<form id="WordForm" name="CheckWord" method="POST"
			onsubmit="return Check(CheckWord)">
			<table border="0" align="center" width="100%">
				<tr>
					<td width="15%">Your word:</td>
					<td width="85%"><input required minlength=5 maxlength=5
						type="text" name="txt_Word" id="txt_Word" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="submit" name="btn_Register" id="btn_Register"
						value="check"></td>
				</tr>
				<tr>
			</table>
			<p>&nbsp;</p>
		</form>
	</center>
</body>
</html>