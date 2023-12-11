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
import domain.TournamentPart;

@Path("tournamentpart")
public class TournamentPartService {
	public Date formateInputDate(String strDate) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd",
				Locale.ENGLISH);
		return formatter.parse(strDate);
	}

	@GET
	@Path("getAllTournamentParts")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TournamentPart> getAllTournamentParts() {
		return HibernateDAOChess.getInstance().getTournamentPartDAO()
				.getAllTournamentParts();
	}

	@PUT
	@Path("addTournamentPart/player/{id_player}/tournament/{id_tournament}/registration/{registration}/place/{place}")
	public void addTournamentPart(@PathParam("id_player") String id_player,
			@PathParam("id_tournament") String id_tournament,
			@PathParam("registration") String registration,
			@PathParam("place") String place) {
		TournamentPart tournamentPart = new TournamentPart();
		tournamentPart.setIdPlayer(Long.parseLong(id_player));
		tournamentPart.setIdTournament(Long.parseLong(id_tournament));
		try {
			tournamentPart.setRegistration(formateInputDate(registration));
			System.out.println("date: " + formateInputDate(registration));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		tournamentPart.setPlace(Integer.parseInt(place));
		HibernateDAOChess.getInstance().getTournamentPartDAO()
				.createTournamentPart(tournamentPart);
	}

	@DELETE
	@Path("deleteTournamentPart/{id_tournament_part}")
	public void deleteTournamentPart(
			@PathParam("id_tournament_part") String id_tournament_part) {
		Long idTournamentPart = Long.parseLong(id_tournament_part);
		HibernateDAOChess.getInstance().getTournamentPartDAO()
				.deleteTournamentPartById(idTournamentPart);
	}

	@POST
	@Path("updateTournamentPart/id/{id_tournament_part}/player/{id_player}/tournament/{id_tournament}/registration/{registration}/place/{place}")
	public void updateTournamentPart(
			@PathParam("id_tournament_part") String id_tournament_part,
			@PathParam("id_player") String id_player,
			@PathParam("id_tournament") String id_tournament,
			@PathParam("registration") String registration,
			@PathParam("place") String place) {
		Long idTournamentPart = Long.parseLong(id_tournament_part);
		TournamentPart tournamentPart = HibernateDAOChess.getInstance()
				.getTournamentPartDAO().getTournamentPartById(idTournamentPart);
		tournamentPart.setIdPlayer(Long.parseLong(id_player));
		tournamentPart.setIdTournament(Long.parseLong(id_tournament));
		try {
			tournamentPart.setRegistration(formateInputDate(registration));
			System.out.println("date: " + formateInputDate(registration));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		tournamentPart.setPlace(Integer.parseInt(place));
		HibernateDAOChess.getInstance().getTournamentPartDAO()
				.updateTournamentPart(tournamentPart);
	}
}
