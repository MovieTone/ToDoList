
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ToDoDao {

	private static final String MYSQL_DRIVER_CLASS_NAME = "com.mysql.jdbc.Driver";
	private static final String DB_URL = "jdbc:mysql://localhost/todo";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "";

	private static Connection conn = null;

	public ToDoDao() {

	}

	public void connect() {
		try {
			Class.forName(MYSQL_DRIVER_CLASS_NAME);
		} catch (ClassNotFoundException e) {
			System.out.println("Unable to load driver");
			e.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
		} catch (SQLException e) {
			System.out.println("Connection error");
			e.printStackTrace();
		}
	}

	public List<ToDo> list(String status) {
		connect();
		List<ToDo> list = new ArrayList<ToDo>();
		Statement stmt = null;
		ResultSet resultSet = null;
		try {
			String query = "SELECT * FROM todo t WHERE t.status = '" + status + "'";
			stmt = conn.createStatement();
			resultSet = stmt.executeQuery(query);
			while (resultSet.next()) {
				ToDo todo = new ToDo();
				todo.setId(resultSet.getInt("id"));
				todo.setDescription(resultSet.getString("description"));
				todo.setStatus(resultSet.getString("status"));
				list.add(todo);
			}
		} catch (SQLException e) {
			System.out.println("SQL error");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {

			}
		}
		return list;
	}

	public void delete(int id) {
		connect();
		Statement stmt = null;
		try {
			String query = "DELETE FROM todo WHERE id = " + id;
			stmt = conn.createStatement();
			stmt.execute(query);
		} catch (SQLException e) {
			System.out.println("SQL error");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {

			}
		}
	}

	public void add(String description) {
		connect();
		Statement stmt = null;
		try {
			String query = "INSERT INTO todo (description, status) VALUES ('" + description + "', 'open')";
			stmt = conn.createStatement();
			stmt.execute(query);
		} catch (SQLException e) {
			System.out.println("SQL error");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {

			}
		}
	}

	public void changeStatus(int id, String status) {
		connect();
		Statement stmt = null;
		try {
			String query = "UPDATE todo SET status = '" + status + "' WHERE id = " + id;
			stmt = conn.createStatement();
			stmt.execute(query);
		} catch (SQLException e) {
			System.out.println("SQL error");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {

			}
		}
	}

	public void archiveCompleted() {
		connect();
		Statement stmt = null;
		try {
			String query = "UPDATE todo SET status = 'archived' WHERE status = 'complete'";
			stmt = conn.createStatement();
			stmt.execute(query);
		} catch (SQLException e) {
			System.out.println("SQL error");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {

			}
		}
	}

}
