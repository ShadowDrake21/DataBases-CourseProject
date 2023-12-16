package service;

import java.util.List;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import dao.HibernateDAOChess;
import domain.Match;

@Path("match")
public class MatchService {
	@GET
	@Path("getAllMatches")
	@Produces(MediaType.APPLICATION_JSON)	
	public List<Match> getAllMatches() {
		return HibernateDAOChess.getInstance().getMatchDAO().getAllMatches();
	}

	@PUT
	@Path("addMatch/idTournament/{id_tournament}/player1/{match_player}/player2/"
			+ "{match_opponent}/date/{match_date}/score1/{match_score_1}/score2/{match_score_2}")
	public void addMatch(@PathParam("id_tournament") String id_tournament,
			@PathParam("match_player") String match_player,
			@PathParam("match_opponent") String match_opponent,
			@PathParam("match_date") String match_date,
			@PathParam("match_score_1") String match_score_1,
			@PathParam("match_score_2") String match_score_2) {
		Match match = new Match();
		match.setIdTournament(Long.parseLong(id_tournament));
		match.setPlayer1(match_player);
		match.setPlayer2(match_opponent);
	    match.setDate(match_date);
		match.setScore1(match_score_1);
		match.setScore2(match_score_2);
		HibernateDAOChess.getInstance().getMatchDAO().createMatch(match);
	}

	@DELETE
	@Path("deleteMatch/{id_match}")
	public void deleteMatch(@PathParam("id_match") String id_match) {
		Long idMatch = Long.parseLong(id_match);
		HibernateDAOChess.getInstance().getMatchDAO().deleteMatchById(idMatch);
	}

	@POST
	@Path("updateOMatch/id/{id_match}/idTournament/{id_tournament}/player1/{match_player}/player2/"
			+ "{match_opponent}/date/{match_date}/score1/{match_score_1}/score2/{match_score_2}")
	public void updateMatch(@PathParam("id_match") String id_match,
			@PathParam("id_tournament") String id_tournament,
			@PathParam("match_player") String match_player,
			@PathParam("match_opponent") String match_opponent,
			@PathParam("match_date") String match_date,
			@PathParam("match_score_1") String match_score_1,
			@PathParam("match_score_2") String match_score_2){
		Long idMatch = Long.parseLong(id_match);
		Match match = HibernateDAOChess.getInstance().getMatchDAO()
				.getMatchById(idMatch);
		match.setIdTournament(Long.parseLong(id_tournament));
		match.setPlayer1(match_player);
		match.setPlayer2(match_opponent);		
		match.setDate(match_date);
		match.setScore1(match_score_1);
		match.setScore2(match_score_2);
		HibernateDAOChess.getInstance().getMatchDAO().updateMatch(match);
	}
}
