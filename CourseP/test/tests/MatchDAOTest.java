package tests;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;

import dao.HibernateDAOChess;
import domain.Match;

class MatchDAOTest {

	@Test
	public void whenGetAllThenAllShouldBePresent() {
		// given
		// when
		List<Match> matchList = HibernateDAOChess.getInstance().getMatchDAO()
				.getAllMatches();

		// then
		assertEquals(42, matchList.size());
		for (Match match : matchList) {
			assertNotNull(match);
			assertNotNull(match.getId());
			assertNotNull(match.getIdTournament());
			System.out.println(match);
		}
	}

}
