package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.ManageStudent;

public class EditStudent extends HttpServlet {
	private static ManageStudent manageStudent = new ManageStudent();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int sId = Integer.parseInt(req.getParameter("studentId"));
		req.setAttribute("student", manageStudent.getStudent(sId));
		navigateToNextView(req, resp, "/AddStudent.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sName = req.getParameter("sName");
		String sClass = req.getParameter("sClass");
		int sDob = Integer.parseInt(req.getParameter("sDob"));
		int sId = Integer.parseInt(req.getParameter("sId"));
		String sLicenseCar = req.getParameter("licenseCar");
		manageStudent.editStudent(sId, sName, sClass, sDob, sLicenseCar);
		req.setAttribute("studentList", manageStudent.getListStudent());
		navigateToNextView(req, resp, "/Welcome.jsp");
	}

	public void navigateToNextView(HttpServletRequest request, HttpServletResponse response, String filePath)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher(filePath);
		dispatcher.forward(request, response);
	}
}
