<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>To-Do List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<body>
	<div class="container" style="width: 800px">
		<div class="row">
			<div class="col">
				<H3 align="center">ToDo List</H3>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<table class="table table-bordered">
					<thead class="table-light">
						<tr>
							<th class="col-10">Task</th>
							<th class="col-1">Status</th>
							<th class="col-1">Remove</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${openList}" var="current">
							<tr>
								<td>${current.description}</td>
								<td><form method="post" action="ToDoController">
										<input type="hidden" name="openId" value="${current.id}" />
										<button type="submit" class="btn btn-primary">
											<svg xmlns="http://www.w3.org/2000/svg" width="16"
												height="16" fill="currentColor" class="bi bi-square"
												viewBox="0 0 16 16"> <path
												d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z" />
											</svg>
										</button>
									</form></td>
								<td class="d-flex gap-2">
									<form method="post" action="ToDoController">
										<input type="hidden" name="deleteId" value="${current.id}" />
										<button type="submit" class="btn btn-danger">
											<svg xmlns="http://www.w3.org/2000/svg" width="16"
												height="16" fill="currentColor" class="bi bi-trash"
												viewBox="0 0 16 16"> <path
												d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z" />
											<path
												d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z" />
											</svg>
										</button>
									</form>
								</td>
							</tr>
						</c:forEach>
						<c:forEach items="${completeList}" var="current">
							<tr>
								<td>${current.description}</td>
								<td><form method="post" action="ToDoController">
										<input type="hidden" name="completeId" value="${current.id}" />
										<button type="submit" class="btn btn-success">
											<svg xmlns="http://www.w3.org/2000/svg" width="16"
												height="16" fill="currentColor" class="bi bi-check2-square"
												viewBox="0 0 16 16"> <path
												d="M3 14.5A1.5 1.5 0 0 1 1.5 13V3A1.5 1.5 0 0 1 3 1.5h8a.5.5 0 0 1 0 1H3a.5.5 0 0 0-.5.5v10a.5.5 0 0 0 .5.5h10a.5.5 0 0 0 .5-.5V8a.5.5 0 0 1 1 0v5a1.5 1.5 0 0 1-1.5 1.5z" />
											<path
												d="m8.354 10.354 7-7a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0" />
											</svg>
										</button>
									</form></td>
								<td class="d-flex gap-2">
									<form method="post" action="ToDoController">
										<input type="hidden" name="deleteId" value="${current.id}" />
										<button type="submit" class="btn btn-danger">
											<svg xmlns="http://www.w3.org/2000/svg" width="16"
												height="16" fill="currentColor" class="bi bi-trash"
												viewBox="0 0 16 16"> <path
												d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z" />
											<path
												d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z" />
											</svg>
										</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col"></div>
			<div class="col text-end">
				<form method="post" action="ToDoController">
					<input type="hidden" name="archive" value="true" />
					<div>
						<button type="submit" class="btn btn-danger">Archive
							completed</button>
					</div>
				</form>
			</div>
		</div>
		<form method="post" action="ToDoController">
			<div class="row">
				<div class="col">
					<textarea required class="form-control" name="description"
						id="description" placeholder="Add a new task" cols="40" rows="8"
						style="height: 100px; margin-top: 20px"></textarea>
				</div>
			</div>
			<div class="row">
				<div class="col"></div>
				<div class="col text-end">
					<button type="submit" class="btn btn-dark" style="margin-top: 20px">Add
						task</button>
				</div>
			</div>
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>