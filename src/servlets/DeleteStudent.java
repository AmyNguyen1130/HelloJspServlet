package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.ManageStudent;

public class DeleteStudent extends HttpServlet{
	private static ManageStudent manageStudent = new ManageStudent();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
 		int studentId = Integer.parseInt(req.getParameter("studentId"));
		manageStudent.deleteFromListStudent(studentId);
		req.setAttribute("studentList", manageStudent.getListStudent());
		RequestDispatcher dispatcher = this.getServletContext()
              .getRequestDispatcher("/Welcome.jsp");
        dispatcher.forward(req, resp);
	}
}
