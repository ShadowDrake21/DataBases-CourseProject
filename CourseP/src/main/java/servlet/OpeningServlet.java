package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HibernateDAOChess;
import domain.Opening;
import service.OpeningService;

public class OpeningServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private OpeningService openingService;

	@Override
	public void init() {
		openingService = new OpeningService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String actionType = req.getParameter("actiontype");

		if ("addopening".equalsIgnoreCase(actionType)) {
			try {
				req.setCharacterEncoding("UTF-8");
				String opening_name = req.getParameter("opening_name");
				String opening_category = req.getParameter("opening_category");
				String opening_year = req.getParameter("opening_year");
				String famous_player = req.getParameter("famous_player");
				openingService.addOpening(opening_name, opening_category,
						opening_year, famous_player);
				req.getRequestDispatcher("opening.jsp").forward(req, resp);
			} catch (Exception e) {
				req.setAttribute("error", e.getMessage());
				req.getRequestDispatcher("opening.jsp").forward(req, resp);
			}
		} else if ("deleteopening".equalsIgnoreCase(actionType)) {
			String id_opening = req.getParameter("id_opening");
			openingService.deleteOpening(id_opening);
			req.getRequestDispatcher("opening.jsp").forward(req, resp);
		} else if ("updateopening".equalsIgnoreCase(actionType)) {
			try {
				String id_opening = req.getParameter("id_opening");
				String opening_name = req.getParameter("opening_name");
				String opening_category = req.getParameter("opening_category");
				String opening_year = req.getParameter("opening_year");
				String famous_player = req.getParameter("famous_player");
				openingService.updateOpening(id_opening, opening_name,
						opening_category, opening_year, famous_player);
				req.getRequestDispatcher("opening.jsp").forward(req, resp);
			} catch (Exception e) {
				req.setAttribute("error", e.getMessage());
				req.getRequestDispatcher("updateopening.jsp").forward(req,
						resp);
			}
		} else if ("searchopening".equalsIgnoreCase(actionType)) {
			String field = req.getParameter("field");
			String value = req.getParameter("value");
			List<Opening> searchO = HibernateDAOChess.getInstance()
					.getOpeningDAO().searchOpenings(field, value);
			req.setAttribute("searchResults", searchO);
			req.getRequestDispatcher("opening.jsp").forward(req, resp);
		}
	}
}
