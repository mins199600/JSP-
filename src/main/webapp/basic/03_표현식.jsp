<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>03_표현식</title>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>

	<h3>표현식</h3>
	
	
	<% 
	String name = "손흥민";
	int kor = 80, eng = 85, mat = 100;
	int aver = (kor + eng + mat) / 3;
	
	StringBuilder output = new StringBuilder();
	output.append("이름 : ").append(name).append("<br>")
	      .append("국어 : ").append(kor).append("<br>")
	      .append("영어 : ").append(eng).append("<br>")
	      .append("수학 : ").append(mat).append("<br>")
	      .append("평균 : ").append(aver).append("<br><hr>")
	      .append("<table border='1'>")
	      .append("<tr><th>이름</th><td>").append(name).append("</td></tr>")
	      .append("<tr><th>국어</th><td>").append(kor).append("</td></tr>")
	      .append("<tr><th>영어</th><td>").append(eng).append("</td></tr>")
	      .append("<tr><th>수학</th><td>").append(mat).append("</td></tr>")
	      .append("<tr><th>평균</th><td>").append(aver).append("</td></tr>")
	      .append("</table>");
	
	out.print(output.toString());
	%>
		<hr>
		<!--표현식 : out.print() 단축키-->
		<table border="1">
			<tr>
				<th>이름</th>
				<td><%=name%></td>
			</tr>
			<tr>
				<th>국어</th>
				<td><%=kor%></td>
			</tr>
			<tr>
				<th>영어</th>
				<td><%=eng%></td>
			</tr>
			<tr>
				<th>수학</th>
				<td><%=mat%></td>
			</tr>
			<tr>
				<th>평균</th>
				<td><%=aver%></td>
			</tr>
		</table>

</body>
</html>