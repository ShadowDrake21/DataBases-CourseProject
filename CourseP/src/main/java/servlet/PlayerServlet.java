package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			req.setCharacterEncoding("UTF-8");
			String player_name = req.getParameter("player_name");
			System.out.println("Player Gender Input: " + player_name);
			String player_gender = req.getParameter("player_gender");
			System.out.println("Player Gender Input: " + player_gender);
			String player_birthday = req.getParameter("player_birthday");
			String player_country = req.getParameter("player_country");
			String player_nationality = req.getParameter("player_nationality");
			String player_rate = req.getParameter("player_rate");
			String player_matches = req.getParameter("player_matches");
			String player_wins = req.getParameter("player_wins");

			playerService.addPlayer(player_name, player_gender, player_birthday,
					player_country, player_nationality, player_rate,
					player_matches, player_wins);
		} else if ("deleteplayer".equalsIgnoreCase(actionType)) {
			String player_id = req.getParameter("player_id");

			playerService.deletePlayer(player_id);
		} else if ("updateplayer".equalsIgnoreCase(actionType)) {
			String player_id = req.getParameter("player_id");
			String player_name = req.getParameter("player_name");
			String player_gender = req.getParameter("player_gender");
			String player_birthday = req.getParameter("player_birthday");
			String player_country = req.getParameter("player_country");
			String player_nationality = req.getParameter("player_nationality");
			String player_rate = req.getParameter("player_rate");
			String player_matches = req.getParameter("player_matches");
			String player_wins = req.getParameter("player_wins");

			playerService.updatePlayer(player_id, player_name, player_gender,
					player_birthday, player_country, player_nationality,
					player_rate, player_matches, player_wins);
		}

		resp.sendRedirect("player.jsp");
	}
}
