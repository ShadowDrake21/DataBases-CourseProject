package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PlayerService;
import service.TitleService;

public class TitleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private TitleService titleService;

	@Override
	public void init() {
		titleService = new TitleService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		req.setCharacterEncoding("UTF-8");
		String actionType = req.getParameter("actiontype");
		if ("addtitle".equalsIgnoreCase(actionType)) {
			req.setCharacterEncoding("UTF-8");
			String title_name = req.getParameter("title_name");
			System.out.println("Title Name Input: " + title_name);
			String title_year = req.getParameter("title_year");
			System.out.println("Title Year Input: " + title_year);
			String id_player = req.getParameter("id_player");

			titleService.addTitle(title_name, title_year, id_player);
		} else if ("deletetitle".equalsIgnoreCase(actionType)) {
			String title_id = req.getParameter("title_id");

			titleService.deleteTitle(title_id);
		} else if ("updatetitle".equalsIgnoreCase(actionType)) {
			String title_id = req.getParameter("title_id");
			String title_name = req.getParameter("title_name");
			System.out.println("Title Name Input: " + title_name);
			String title_year = req.getParameter("title_year");
			System.out.println("Title Year Input: " + title_year);
			String id_player = req.getParameter("id_player");

			titleService.updateTitle(title_id, title_name, title_year,
					id_player);
		}

		resp.sendRedirect("title.jsp");
	}
}
