<%@ page import="entity.Student"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Add student page</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
</head>
<body>
	<%
		Student student = (Student) request.getAttribute("student");
	String url = "/addStudent";
	String err = "";
	if (student != null) {
		url = "/editStudent";
	}
	%>
	<div>
		<div class="card-body">
			<h3>Enter student's informations here</h3>
			<form action="<%=request.getContextPath() + url%>" method="post">

				<input type="hidden" name="sId"
					value="<%=student == null ? "" : student.getsId()%>">

				<div class="form-group row">
					<label for="sName" class="col-sm-1 col-form-label">Student
						Name</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="sName"
							value="<%=student == null ? "" : student.getsName()%>">
					</div>
				</div>

				<div class="form-group row">
					<label for="sClass" class="col-sm-1 col-form-label">Student
						Class</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="sClass"
							value="<%=student == null ? "" : student.getsClass()%>">
					</div>
				</div>

				<div class="form-group row">
					<label for="sDob" class="col-sm-1 col-form-label">Student
						DoB</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="sDob"
							value="<%=student == null ? "" : student.getsDob()%>">
					</div>
				</div>
				<%
				if(url == "/addStudent"){
				%>
					<div id="wrapper">
						<label for="yes_no_radio">Do you have your own license car?</label>
						<p>
							<input type="radio" name="yes_no" id="YesSelect"
								onclick="yesSelect()" checked>Yes
						</p>
						<p>
							<input type="radio" name="yes_no" id="NoSelect"
								onclick="noSelect()">No
						</p>
					</div>
			<%}else{
					if(student.getsLincenseCar() == ""){
					%>
					<div id="wrapper">
						<label for="yes_no_radio">Do you have your own license car?</label>
						<p>
							<input type="radio" name="yes_no" id="YesSelect"
								onclick="yesSelect()" checked>Yes
						</p>
						<p>
							<input type="radio" name="yes_no" id="NoSelect"
								onclick="noSelect()">No
						</p>
					</div>
			<%
					} 
				}
			%>
				<div class="form-group row" id="licenseCarDiv">
					<label for="sLicense" class="col-sm-1 col-form-label">License
						car code</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="licenseCar"
							id="licenseCar" onchange="onChangeLicense(this.value)"
							value="<%=student == null ? "" : student.getsLincenseCar()%>">
						<input class="form-control"
							style="color: red; border: none; background-color: white;"
							id="displayError" value="<%=err %>"
							disabled="disabled">

					</div>
				</div>
				<button type="submit" class="btn btn-primary">Done</button>

			</form>

		</div>
	</div>

	<script type="text/javascript">
		function noSelect() {
			$('#licenseCarDiv').hide();
		}

		function yesSelect() {
			$('#licenseCarDiv').show();
			document.getElementById("licenseCar").value = "";
		}

		function onChangeLicense(value) {
			var err = document.getElementById("displayError");
			if (value == null) {
				err.value = "Please enter your license car code";
			}
			if (!/^[0-9]+$/.test(value)) {
				err.value = "Please enter all by number";
			} else {
				err.value = "";
			}
		}
	</script>
</body>
</html>