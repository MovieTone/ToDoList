<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>To-Do List</title>
</head>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<style>
table {
	table-layout: fixed;
	width: 100%;
	border-right: 2px dashed blue;
	border-bottom: 2px dashed blue;
}

td {
	border-left: 2px dashed blue;
	border-top: 2px dashed blue;
	word-wrap: break-word;
}

th {
	border-left: 2px dashed blue;
	border-top: 2px dashed blue;
}
</style>

<body>
	<H3 align="center">Table</H3>
	<table>
		<th>Description</th>
		<th>Status</th>
		<th>Actions</th>
		<c:forEach items="${openList}" var="current">
			<tr>
				<td>${current.description}</td>
				<td>${current.status}</td>
				<td>
					<form method="post" action="ToDoController">
						<input type="hidden" name="openId" value="${current.id}" />
						<button type="submit">Completed</button>
					</form>
					<form method="post" action="ToDoController">
						<input type="hidden" name="deleteId" value="${current.id}" />
						<button type="submit">Delete</button>
					</form>
				</td>
			</tr>
		</c:forEach>
		<c:forEach items="${completeList}" var="current">
			<tr>
				<td>${current.description}</td>
				<td>${current.status}</td>
				<td>
					<form method="post" action="ToDoController">
						<input type="hidden" name="completeId" value="${current.id}" />
						<button type="submit">Not Completed</button>
					</form>
					<form method="post" action="ToDoController">
						<input type="hidden" name="deleteId" value="${current.id}" />
						<button type="submit">Delete</button>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<form method="post" action="ToDoController">
		<input type="hidden" name="archive" value="true" />
		<div>
			<button type="submit">Archive Completed</button>
		</div>
	</form>
	<br />
	<form method="post" action="ToDoController">
		<label for="description">Add a new task:</label> <br />
		<textarea required name="description" id="description"
			placeholder="Description" cols="40" rows="8"></textarea>
		<div>
			<button type="submit">Add ToDo</button>
		</div>
	</form>
</body>
</html>