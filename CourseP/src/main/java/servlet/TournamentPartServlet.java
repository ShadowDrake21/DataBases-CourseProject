package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HibernateDAOChess;
import domain.TournamentPart;
import service.TournamentPartService;

public class TournamentPartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private TournamentPartService tournamentPartService;

	@Override
	public void init() {
		tournamentPartService = new TournamentPartService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String actionType = req.getParameter("actiontype");
		if ("addtournamentpart".equalsIgnoreCase(actionType)) {
			try {
				req.setCharacterEncoding("UTF-8");
				String tournament_part_player = req.getParameter("id_player");
				String tournament_part_tournament = req
						.getParameter("id_tournament");
				String tournament_part_registration = req
						.getParameter("registration");
				String tournament_part_place = req.getParameter("place");

				tournamentPartService.addTournamentPart(tournament_part_player,
						tournament_part_tournament,
						tournament_part_registration, tournament_part_place);
				req.getRequestDispatcher("tournamentpart.jsp").forward(req,
						resp);
			} catch (Exception e) {
				req.setAttribute("error", e.getMessage());
				req.getRequestDispatcher("tournamentpart.jsp").forward(req,
						resp);
			}
		} else if ("deletetournamentpart".equalsIgnoreCase(actionType)) {
			String tournament_part_id = req.getParameter("tournament_part_id");

			tournamentPartService.deleteTournamentPart(tournament_part_id);
			req.getRequestDispatcher("tournamentpart.jsp").forward(req, resp);
		} else if ("updatetournamentpart".equalsIgnoreCase(actionType)) {
			try {
				String tournament_part_id = req
						.getParameter("tournament_part_id");
				String tournament_part_player = req.getParameter("id_player");
				String tournament_part_tournament = req
						.getParameter("id_tournament");
				String tournament_part_registration = req
						.getParameter("registration");
				String tournament_part_place = req.getParameter("place");

				tournamentPartService.updateTournamentPart(tournament_part_id,
						tournament_part_player, tournament_part_tournament,
						tournament_part_registration, tournament_part_place);
				req.getRequestDispatcher("tournamentpart.jsp").forward(req,
						resp);
			} catch (Exception e) {
				req.setAttribute("error", e.getMessage());
				req.getRequestDispatcher("updatetournamentpart.jsp")
						.forward(req, resp);
			}
		} else if ("searchtournamentpart".equalsIgnoreCase(actionType)) {
			String field = req.getParameter("field");
			String value = req.getParameter("value");
			List<TournamentPart> searchP = HibernateDAOChess.getInstance()
					.getTournamentPartDAO().searchTournament(field, value);
			req.setAttribute("searchResults", searchP);
			req.getRequestDispatcher("tournamentpart.jsp").forward(req, resp);
		}

	}
}
