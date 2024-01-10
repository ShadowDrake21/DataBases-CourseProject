package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HibernateDAOChess;
import domain.Tournament;
import service.TournamentService;

public class TournamentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private TournamentService tournamentService;

	@Override
	public void init() {
		tournamentService = new TournamentService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String actionType = req.getParameter("actiontype");
		if ("addtournament".equalsIgnoreCase(actionType)) {
			try {
				req.setCharacterEncoding("UTF-8");
				String tournament_type = req.getParameter("tournament_type");
				String tournament_name = req.getParameter("tournament_name");
				String tournament_start = req.getParameter("tournament_start");
				String tournament_end = req.getParameter("tournament_end");
				String tournament_country = req
						.getParameter("tournament_country");
				String tournament_prize = req.getParameter("tournament_prize");
				String tournament_matches = req
						.getParameter("tournament_matches");
				String tournament_players = req
						.getParameter("tournament_players");
				String tournament_current_champ = req
						.getParameter("tournament_current_champ");

				tournamentService.addTournament(tournament_type,
						tournament_name, tournament_start, tournament_end,
						tournament_country, tournament_prize,
						tournament_matches, tournament_players,
						tournament_current_champ);
				req.getRequestDispatcher("tournament.jsp").forward(req, resp);
			} catch (Exception e) {
				req.setAttribute("error", e.getMessage());
				req.getRequestDispatcher("tournament.jsp").forward(req, resp);
			}
		} else if ("deletetournament".equalsIgnoreCase(actionType)) {
			String tournament_id = req.getParameter("tournament_id");

			tournamentService.deleteTournament(tournament_id);
			req.getRequestDispatcher("tournament.jsp").forward(req, resp);
		} else if ("updatetournament".equalsIgnoreCase(actionType)) {
			try {
				String tournament_id = req.getParameter("tournament_id");
				String tournament_type = req.getParameter("tournament_type");
				String tournament_name = req.getParameter("tournament_name");
				String tournament_start = req.getParameter("tournament_start");
				String tournament_end = req.getParameter("tournament_end");
				String tournament_country = req
						.getParameter("tournament_country");
				String tournament_prize = req.getParameter("tournament_prize");
				String tournament_matches = req
						.getParameter("tournament_matches");
				String tournament_players = req
						.getParameter("tournament_players");
				String tournament_current_champ = req
						.getParameter("tournament_current_champ");

				tournamentService.updateTournament(tournament_id,
						tournament_type, tournament_name, tournament_start,
						tournament_end, tournament_country, tournament_prize,
						tournament_matches, tournament_players,
						tournament_current_champ);
				req.getRequestDispatcher("tournament.jsp").forward(req, resp);
			} catch (Exception e) {
				req.setAttribute("error", e.getMessage());
				req.getRequestDispatcher("updatetournament.jsp").forward(req,
						resp);
			}
		} else if ("searchtournament".equalsIgnoreCase(actionType)) {
			String field = req.getParameter("field");
			String value = req.getParameter("value");
			List<Tournament> searchP = HibernateDAOChess.getInstance()
					.getTournamentDAO().searchTournament(field, value);
			req.setAttribute("searchResults", searchP);
			req.getRequestDispatcher("tournament.jsp").forward(req, resp);
		}

	}
}