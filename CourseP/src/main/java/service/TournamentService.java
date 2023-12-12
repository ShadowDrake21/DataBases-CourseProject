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
import domain.Tournament;

@Path("tournament")
public class TournamentService {
	public Date formateInputDate(String strDate) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd",
				Locale.ENGLISH);
		return formatter.parse(strDate);
	}

	@GET
	@Path("getAllTournaments")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Tournament> getAllTournaments() {
		return HibernateDAOChess.getInstance().getTournamentDAO()
				.getAllTournaments();
	}

	@PUT
	@Path("addTournament/type/{tournament_type}/name/{tournament_name}/start/{tournament_start}/end/{tournament_end}/country/{tournament_country}/prize/{tournament_prize}/matches/{tournament_matches}/players/{tournament_players}/champion/{tournament_current_champ}")
	public void addTournament(
			@PathParam("tournament_type") String tournament_type,
			@PathParam("tournament_name") String tournament_name,
			@PathParam("tournament_start") String tournament_start,
			@PathParam("tournament_end") String tournament_end,
//			@PathParam("tournament_connection") String tournament_connection,
			@PathParam("tournament_country") String tournament_country,
//			@PathParam("tournament_city") String tournament_city,
			@PathParam("tournament_prize") String tournament_prize,
			@PathParam("tournament_matches") String tournament_matches,
			@PathParam("tournament_players") String tournament_players,
//			@PathParam("tournament_prize_places") String tournament_prize_places,
			@PathParam("tournament_current_champ") String tournament_current_champ) {
		Tournament tournament = new Tournament();
		tournament.setType(tournament_type);
		tournament.setName(tournament_name);
		try {
			tournament.setStart(formateInputDate(tournament_start));
			tournament.setEnd(formateInputDate(tournament_end));
		} catch (ParseException e) {
			e.printStackTrace();
		}
//		tournament.setConnection(tournament_connection);
		tournament.setCountry(tournament_country);
//		tournament.setCity(tournament_city);
		tournament.setPrize(Integer.parseInt(tournament_prize));
		tournament.setNumMatches(Integer.parseInt(tournament_matches));
		tournament.setPlayers(Integer.parseInt(tournament_players));
//		tournament.setPrizePlaces(Integer.parseInt(tournament_prize_places));
		tournament.setChampion(tournament_current_champ);
		HibernateDAOChess.getInstance().getTournamentDAO()
				.createTournament(tournament);
	}

	@DELETE
	@Path("deleteTournament/{id_tournament}")
	public void deleteTournament(
			@PathParam("id_tournament") String id_tournament) {
		Long idTournament = Long.parseLong(id_tournament);
		HibernateDAOChess.getInstance().getTournamentDAO()
				.deleteTournamentById(idTournament);
	}

	@POST
	@Path("updateTournament/id/{id_tournament}/type/{tournament_type}/name/{tournament_name}/start/{tournament_start}/end/{tournament_end}/country/{tournament_country}/prize/{tournament_prize}/matches/{tournament_matches}/players/{tournament_players}/champion/{tournament_current_champ}")
	public void updateTournament(
			@PathParam("id_tournament") String id_tournament,
			@PathParam("tournament_type") String tournament_type,
			@PathParam("tournament_name") String tournament_name,
			@PathParam("tournament_start") String tournament_start,
			@PathParam("tournament_end") String tournament_end,
//			@PathParam("tournament_connection") String tournament_connection,
			@PathParam("tournament_country") String tournament_country,
//			@PathParam("tournament_city") String tournament_city,
			@PathParam("tournament_prize") String tournament_prize,
			@PathParam("tournament_matches") String tournament_matches,
			@PathParam("tournament_players") String tournament_players,
//			@PathParam("tournament_prize_places") String tournament_prize_places,
			@PathParam("tournament_current_champ") String tournament_current_champ) {
		Long idTournament = Long.parseLong(id_tournament);
		Tournament tournament = HibernateDAOChess.getInstance()
				.getTournamentDAO().getTournamentById(idTournament);
		tournament.setType(tournament_type);
		tournament.setName(tournament_name);
		try {
			tournament.setStart(formateInputDate(tournament_start));
			tournament.setEnd(formateInputDate(tournament_end));
		} catch (ParseException e) {
			e.printStackTrace();
		}
//		tournament.setConnection(tournament_connection);
		tournament.setCountry(tournament_country);
//		tournament.setCity(tournament_city);
		tournament.setPrize(Integer.parseInt(tournament_prize));
		tournament.setNumMatches(Integer.parseInt(tournament_matches));
		tournament.setPlayers(Integer.parseInt(tournament_players));
//		tournament.setPrizePlaces(Integer.parseInt(tournament_prize_places));
		tournament.setChampion(tournament_current_champ);
		HibernateDAOChess.getInstance().getTournamentDAO()
				.updateTournament(tournament);
	}
}
