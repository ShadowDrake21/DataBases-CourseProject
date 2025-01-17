package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import domain.User;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println("username: " + username);
		System.out.println("Password: " + password);

		UserDAO userDAO = (UserDAO) getServletContext().getAttribute("userDAO");

		if (authenticateUser(userDAO, username, password)) {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("password", password);

			response.sendRedirect("success.jsp");
		} else {
			response.sendRedirect("failure.jsp");
		}
	}

	private boolean authenticateUser(UserDAO userDAO, String username,
			String password) {
		List<User> users = userDAO.getUsersByName(username);

		System.out.println(users);
		return !users.isEmpty() && users.get(0).getPassword().equals(password);
	}
}