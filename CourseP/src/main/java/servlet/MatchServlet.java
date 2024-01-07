package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HibernateDAOChess;
import domain.Match;
import service.MatchService;

public class MatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MatchService matchService;

	@Override
	public void init() {
		matchService = new MatchService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String actionType = req.getParameter("actiontype");
		System.out.println(req);

		if ("addmatch".equalsIgnoreCase(actionType)) {
			try {
				req.setCharacterEncoding("UTF-8");
				String id_tournament = req.getParameter("id_tournament");
				String match_player = req.getParameter("match_player");
				String match_opponent = req.getParameter("match_opponent");
				String match_date = req.getParameter("match_date");
				String match_score_1 = req.getParameter("match_score_1");
				String match_score_2 = req.getParameter("match_score_2");

				if ((Integer.parseInt(match_score_1) != 0.5
						&& Integer.parseInt(match_score_1) == Integer
								.parseInt(match_score_2))
						|| ((Integer.parseInt(match_score_1) == 0.5
								|| Integer.parseInt(match_score_2) == 0.5)
								&& Integer.parseInt(match_score_1) != Integer
										.parseInt(match_score_2))) {
					req.setAttribute("error", "Invalid points");
					req.getRequestDispatcher("match.jsp").forward(req, resp);
					return;
				}

				matchService.addMatch(id_tournament, match_player,
						match_opponent, match_date, match_score_1,
						match_score_2);
				req.getRequestDispatcher("match.jsp").forward(req, resp);
			} catch (Exception e) {
				req.setAttribute("error", e.getMessage());
				req.getRequestDispatcher("match.jsp").forward(req, resp);

			}
		} else if ("deletematch".equalsIgnoreCase(actionType)) {
			String id_match = req.getParameter("id_match");
			matchService.deleteMatch(id_match);
			req.getRequestDispatcher("match.jsp").forward(req, resp);

		} else if ("updatematch".equalsIgnoreCase(actionType)) {
			try {
				String id_match = req.getParameter("id_match");
				String id_tournament = req.getParameter("id_tournament");
				String match_player = req.getParameter("match_player");
				String match_opponent = req.getParameter("match_opponent");
				String match_date = req.getParameter("match_date");
				String match_score_1 = req.getParameter("match_score_1");
				String match_score_2 = req.getParameter("match_score_2");
				matchService.updateMatch(id_match, id_tournament, match_player,
						match_opponent, match_date, match_score_1,
						match_score_2);
				req.getRequestDispatcher("match.jsp").forward(req, resp);
			} catch (Exception e) {
				req.setAttribute("error", e.getMessage());
				req.getRequestDispatcher("updatematch.jsp").forward(req, resp);
			}
		} else if ("searchmatch".equalsIgnoreCase(actionType)) {
			String field = req.getParameter("field");
			String value = req.getParameter("value");
			List<Match> searchM = HibernateDAOChess.getInstance().getMatchDAO()
					.searchMatch(field, value);
			req.setAttribute("searchResults", searchM);
			req.getRequestDispatcher("match.jsp").forward(req, resp);
		}
	}
}
