package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HibernateDAOChess;
import domain.OpeningUsage;
import service.OpeningUsageService;

public class OpeningUsageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private OpeningUsageService openingusageService;

	@Override
	public void init() {
		openingusageService = new OpeningUsageService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String actionType = req.getParameter("actiontype");

		if ("addopeningusage".equalsIgnoreCase(actionType)) {
			try {
				req.setCharacterEncoding("UTF-8");
				String id_opening = req.getParameter("id_opening");
				String id_player = req.getParameter("id_player");
				String usage_points = req.getParameter("usage_points");
				openingusageService.addOpeningUsage(id_opening, id_player,
						usage_points);
				req.getRequestDispatcher("openingusage.jsp").forward(req, resp);
			} catch (Exception e) {
				req.setAttribute("error", e.getMessage());
				req.getRequestDispatcher("openingusage.jsp").forward(req, resp);
			}
		} else if ("deleteopeningusage".equalsIgnoreCase(actionType)) {
			String id_opening_usage = req.getParameter("id_opening_usage");
			openingusageService.deleteOpeningUsage(id_opening_usage);
			req.getRequestDispatcher("openingusage.jsp").forward(req, resp);

		} else if ("updateopeningusage".equalsIgnoreCase(actionType)) {
			try {
				String id_opening_usage = req.getParameter("id_opening_usage");
				String id_opening = req.getParameter("id_opening");
				String id_player = req.getParameter("id_player");
				String usage_points = req.getParameter("usage_points");
				openingusageService.updateOpeningUsage(id_opening_usage,
						id_opening, id_player, usage_points);
				req.getRequestDispatcher("openingusage.jsp").forward(req, resp);
			} catch (Exception e) {
				req.setAttribute("error", e.getMessage());
				req.getRequestDispatcher("updateopeningusage.jsp").forward(req,
						resp);
			}
		} else if ("searchopeningusage".equalsIgnoreCase(actionType)) {
			String field = req.getParameter("field");
			String value = req.getParameter("value");
			List<OpeningUsage> searchO = HibernateDAOChess.getInstance()
					.getOpeningUsageDAO().searchOpeningsUsages(field, value);
			req.setAttribute("searchResults", searchO);
			req.getRequestDispatcher("openingusage.jsp").forward(req, resp);
		}
	}
}
