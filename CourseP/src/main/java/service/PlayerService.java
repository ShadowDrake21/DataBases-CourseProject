package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import dao.HibernateDAOChess;
import domain.Player;

@Path("player")
public class PlayerService {
	@GET
	@Path("getAllPlayers")
	@Produces(MediaType.APPLICATION_JSON)
	public Date formateInputDate(String strDate) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("dd-mm-yyyy",
				Locale.ENGLISH);
		return formatter.parse(strDate);
	}

	public List<Player> getAllPlayers() {
		return HibernateDAOChess.getInstance().getPlayerDAO().getAllPlayers();
	}

	@PUT
	@Path("addPlayer/name/{player_name}/gender/{player_gender}/birthday/{player_birthday}/country/{player_country}/nationality/{player_nationality}/rate/{player_rate}/matches/{player_matches}/wins/{player_wins}")
	public void addPlayer(@PathParam("player_name") String player_name,
			@PathParam("player_gender") String player_gender,
			@PathParam("player_birthday") String player_birthday,
			@PathParam("player_country") String player_country,
			@PathParam("player_nationality") String player_nationality,
			@PathParam("player_rate") String player_rate,
			@PathParam("player_matches") String player_matches,
			@PathParam("player_wins") String player_wins) {
		Player player = new Player();
		player.setName(player_name);
		player.setGender(player_gender);
		try {
			player.setBirthday(formateInputDate(player_birthday));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		player.setCountry(player_country);
		player.setNationality(player_nationality);
		player.setRate(Integer.parseInt(player_rate));
		player.setMatches(Integer.parseInt(player_matches));
		player.setWins(Integer.parseInt(player_wins));
		HibernateDAOChess.getInstance().getPlayerDAO().createPlayer(player);
	}

	@DELETE
	@Path("deletePlayer/{id_player}")
	public void deletePlayer(@PathParam("id_player") String id_player) {
		Long idPlayer = Long.parseLong(id_player);
		HibernateDAOChess.getInstance().getPlayerDAO()
				.deletePlayerById(idPlayer);
	}

	@POST
	@Path("updatePlayer/id/{id_player}/name/{player_name}/gender/{player_gender}/birthday/{player_birthday}/country/{player_country}/nationality/{player_nationality}/rate/{player_rate}/matches/{player_matches}/wins/{player_wins}")
	public void updatePlayer(@PathParam("id_player") String id_player,
			@PathParam("player_name") String player_name,
			@PathParam("player_gender") String player_gender,
			@PathParam("player_birthday") String player_birthday,
			@PathParam("player_country") String player_country,
			@PathParam("player_nationality") String player_nationality,
			@PathParam("player_rate") String player_rate,
			@PathParam("player_matches") String player_matches,
			@PathParam("player_wins") String player_wins) {
		Long idPlayer = Long.parseLong(id_player);
		Player player = HibernateDAOChess.getInstance().getPlayerDAO()
				.getPlayerById(idPlayer);
		player.setName(player_name);
		player.setGender(player_gender);
		try {
			player.setBirthday(formateInputDate(player_birthday));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		player.setCountry(player_country);
		player.setNationality(player_nationality);
		player.setRate(Integer.parseInt(player_wins));
		player.setMatches(Integer.parseInt(player_matches));
		player.setWins(Integer.parseInt(player_wins));
		HibernateDAOChess.getInstance().getPlayerDAO().updatePlayer(player);
	}
}
