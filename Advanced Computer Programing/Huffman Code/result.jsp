<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<body>
		<h1>Your Huffman code is:</h1>
		<% 
			ArrayList<String> value = (ArrayList<String>) request.getAttribute("tree");
			for (String v: value) {
				out.println(v);
				out.println("<br>");
			}
		%>
	</body>
</html>