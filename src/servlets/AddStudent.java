package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.ManageStudent;

public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static ManageStudent manageStudent = new ManageStudent();

	public void displayHomeView(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("studentList", manageStudent.getListStudent());

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Welcome.jsp");
		dispatcher.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sName = req.getParameter("sName");
		String sClass = req.getParameter("sClass");
		int sDob = Integer.parseInt(req.getParameter("sDob"));
		String sLicenseCar = req.getParameter("licenseCar");
		manageStudent.addToListStudent(sName, sClass, sDob, sLicenseCar);
		displayHomeView(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		displayHomeView(req, resp);
	}
}
