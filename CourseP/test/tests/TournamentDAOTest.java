package tests;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;

import dao.HibernateDAOChess;
import domain.Tournament;

class TournamentDAOTest {

	@Test
	public void whenGetAllThenAllShouldBePresent() {
		// given
		// when
		List<Tournament> tournamentList = HibernateDAOChess.getInstance()
				.getTournamentDAO().getAllTournaments();

		// then
		assertEquals(17, tournamentList.size());
		for (Tournament tournament : tournamentList) {
			assertNotNull(tournament);
			assertNotNull(tournament.getId());
			assertNotNull(tournament.getName());
			System.out.println(tournament);
		}
	}

	@Test
	public void outputAllMatches() {
		List<Tournament> tournamentList = HibernateDAOChess.getInstance()
				.getTournamentDAO().getAllTournaments();

		for (Tournament tournament : tournamentList) {
			assertNotNull(tournament);
			System.out.println(tournament.getMatches());
		}
	}

	@Test
	public void outputAllPlayers() {
		List<Tournament> tournamentList = HibernateDAOChess.getInstance()
				.getTournamentDAO().getAllTournaments();

		for (Tournament tournament : tournamentList) {
			assertNotNull(tournament);
			System.out.println(tournament.getTournamentPart());
		}
	}

	@Test
	public void outputAllMatchesInOneTournament() {
		List<Tournament> tournamentList = HibernateDAOChess.getInstance()
				.getTournamentDAO().getAllTournaments();

		System.out.println(tournamentList.get(0).getMatches());
	}
}
