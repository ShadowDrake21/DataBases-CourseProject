package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HibernateDAOChess;
import domain.Player;
import service.PlayerService;

public class PlayerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PlayerService playerService;

	@Override
	public void init() {
		playerService = new PlayerService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String actionType = req.getParameter("actiontype");
		if ("addplayer".equalsIgnoreCase(actionType)) {
			try {
				req.setCharacterEncoding("UTF-8");
				String player_name = req.getParameter("player_name");
				String player_gender = req.getParameter("player_gender");
				String player_birthday = req.getParameter("player_birthday");
				String player_country = req.getParameter("player_country");
				String player_nationality = req
						.getParameter("player_nationality");
				String player_rate = req.getParameter("player_rate");
				String player_matches = req.getParameter("player_matches");
				String player_wins = req.getParameter("player_wins");

				playerService.addPlayer(player_name, player_gender,
						player_birthday, player_country, player_nationality,
						player_rate, player_matches, player_wins);
				req.getRequestDispatcher("player.jsp").forward(req, resp);
			} catch (Exception e) {
				req.setAttribute("error", e.getMessage());

				req.getRequestDispatcher("player.jsp").forward(req, resp);
			}
		} else if ("deleteplayer".equalsIgnoreCase(actionType)) {
			String player_id = req.getParameter("player_id");

			playerService.deletePlayer(player_id);
			req.getRequestDispatcher("player.jsp").forward(req, resp);
		} else if ("updateplayer".equalsIgnoreCase(actionType)) {
			try {
				String player_id = req.getParameter("player_id");
				String player_name = req.getParameter("player_name");
				String player_gender = req.getParameter("player_gender");
				String player_birthday = req.getParameter("player_birthday");
				String player_country = req.getParameter("player_country");
				String player_nationality = req
						.getParameter("player_nationality");
				String player_rate = req.getParameter("player_rate");
				String player_matches = req.getParameter("player_matches");
				String player_wins = req.getParameter("player_wins");

				playerService.updatePlayer(player_id, player_name,
						player_gender, player_birthday, player_country,
						player_nationality, player_rate, player_matches,
						player_wins);
				req.getRequestDispatcher("player.jsp").forward(req, resp);
			} catch (Exception e) {
				req.setAttribute("error", e.getMessage());
				req.getRequestDispatcher("updateplayer.jsp").forward(req, resp);
			}

		} else if ("searchplayer".equalsIgnoreCase(actionType)) {
			String field = req.getParameter("field");
			String value = req.getParameter("value");
			List<Player> searchP = HibernateDAOChess.getInstance()
					.getPlayerDAO().searchPlayers(field, value);
			req.setAttribute("searchResults", searchP);
			req.getRequestDispatcher("player.jsp").forward(req, resp);
		}
	}
}
