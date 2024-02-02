import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ToDoController
 */
@WebServlet(name = "ToDoServlet", urlPatterns = { "/ToDoController" })
public class ToDoController extends HttpServlet {

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ToDoController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ToDoDao tdDao = new ToDoDao();
		List<ToDo> openList = tdDao.list("open");
		List<ToDo> completeList = tdDao.list("complete");
		request.setAttribute("openList", openList);
		request.setAttribute("completeList", completeList);

		RequestDispatcher rd = request.getRequestDispatcher("/ToDoView.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ToDoDao tdDao = new ToDoDao();
		String description = request.getParameter("description");
		String deleteId = request.getParameter("deleteId");
		String openId = request.getParameter("openId");
		String completeId = request.getParameter("completeId");
		String archive = request.getParameter("archive");
		if (description != null) {
			tdDao.add(description);
		} else if (deleteId != null) {
			tdDao.delete(Integer.parseInt(deleteId));
		} else if (openId != null) {
			tdDao.changeStatus(Integer.parseInt(openId), "complete");
		} else if (completeId != null) {
			tdDao.changeStatus(Integer.parseInt(completeId), "open");
		} else if (archive.equals("true")) {
			tdDao.archiveCompleted();
		}
		doGet(request, response);
	}

}