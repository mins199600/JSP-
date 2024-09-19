<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>02_JSP 기본문법</title>
	<link rel="stylesheet" href="../css/reset.css">
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>

	<h3>JSP 기본문법</h3>
	<hr>
	<h4>대한민국</h4>
	<hr>
	1+2+3
	<hr>
	
	
		<% 
			//한줄주석
			/*여러줄 주석*/
			out.print("문자열 출력");
			out.print(123+456);
			out.print(5+7);
			out.print(8.9);
			out.print('X');
		
			out.print("<h1>코카콜라</h1>");
			out.print("<img src='../Image/coke.jpg'>");
			out.print("<hr>");
		%>
		
		<%
			//스크립트릿은 문서에 여러번 가능하다
			out.println("<style>.txt{color:red}</style>");
			out.println("<span class='txt'>오필승 코리아</span>");	
		%>
</body>
</html>