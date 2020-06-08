<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entity.Student"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String deleteImageAddress = "https://img.icons8.com/cotton/2x/delete-sign--v2.png";
String editImageAddress = "https://img.icons8.com/cotton/2x/edit.png";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Welcome page</title>
</head>
<style type="text/css">
img {
	width: 30px;
	height: 30px;
	margin: 4px;
}

button {
	margin: 20px;
}
</style>
<body>
	<div class="container">
		<a href="./welcome">
			<button class="btn btn-primary">Add Student</button>
		</a>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Student Name</th>
					<th scope="col">Student Class</th>
					<th scope="col">Student DoB</th>
					<th scope="col">Student License Car</th>
					<th scope="col">Options</th>
				</tr>
			</thead>
			<tbody>
				<%
					List<Student> students = (List) request.getAttribute("studentList");
				for (Student s : students) {
				%>
				<tr>
					<td scope="row"><%=s.getsId()%></td>
					<td><%=s.getsName()%></td>
					<td><%=s.getsClass()%></td>
					<td><%=s.getsDob()%></td>
					<td><%=s.getsLincenseCar()%></td>
					<td><a href="./editStudent?studentId=<%=s.getsId()%>"
						name="edit"> <img alt="edit" src="<%=editImageAddress%>"
							class="optionSize" />
					</a> <a href="./deleteStudent?studentId=<%=s.getsId()%>"> <img
							alt="delete" src="<%=deleteImageAddress%>" class="optionSize" />
					</a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>





