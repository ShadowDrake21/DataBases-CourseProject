package servlet;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.TitleService;
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
			throws IOException {
		req.setCharacterEncoding("UTF-8");
		String actionType = req.getParameter("actiontype");
		if ("addtournamentpart".equalsIgnoreCase(actionType)) {
			req.setCharacterEncoding("UTF-8");
			String tournament_part_player = req.getParameter("id_player");
			String tournament_part_tournament = req
					.getParameter("id_tournament");
			String tournament_part_registration = req
					.getParameter("registration");
			String tournament_part_place = req.getParameter("place");

			tournamentPartService.addTournamentPart(tournament_part_player,
					tournament_part_tournament, tournament_part_registration,
					tournament_part_place);
		} else if ("deletetournamentpart".equalsIgnoreCase(actionType)) {
			String tournament_part_id = req.getParameter("tournament_part_id");

			tournamentPartService.deleteTournamentPart(tournament_part_id);
		} else if ("updatetournamentpart".equalsIgnoreCase(actionType)) {
			String tournament_part_id = req.getParameter("tournament_part_id");
			String tournament_part_player = req.getParameter("id_player");
			String tournament_part_tournament = req
					.getParameter("id_tournament");
			String tournament_part_registration = req
					.getParameter("registration");
			String tournament_part_place = req.getParameter("place");

			tournamentPartService.updateTournamentPart(tournament_part_id,
					tournament_part_player, tournament_part_tournament,
					tournament_part_registration, tournament_part_place);
		}

		resp.sendRedirect("tournamentpart.jsp");
	}
}
