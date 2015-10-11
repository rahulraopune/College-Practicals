<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Huffman Generator</title>
	<script type="text/javascript">
		function showAlert(element) {
			var text = element.value
			var length = text.split(" ").length
			if (length >= 150)
				alert("Input text (" + length + " words) exceeded the limit of 150 words")
		}
	</script>
</head>
<body>
	<form action="Main" method="post">
		<label>Enter your message:</label>
		<br>
		<textarea name="message" rows="3" cols="30" onchange="showAlert(this)"></textarea>
		<br>
		<input type="submit" value="Submit">
	</form>
</body>
</html>