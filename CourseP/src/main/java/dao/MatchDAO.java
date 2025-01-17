package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import domain.Match;
import domain.Title;

public class MatchDAO {
	private Session session;

	public MatchDAO(Session session) {
		this.session = session;
	}

	public Match createMatch(Match match) {
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(match);
		transaction.commit();
		return match;
	}

	public Match updateMatch(Match match) {
		Transaction transaction = session.beginTransaction();
		session.merge(match);
		transaction.commit();
		return match;
	}

	public void deleteMatch(Match match) {
		Transaction transaction = session.beginTransaction();
		session.delete(match);
		transaction.commit();
	}

	public void deleteMatchById(Long matchId) {
		Match match = (Match) session.get(Match.class, matchId);
		deleteMatch(match);
	}

	public List<Match> getAllMatches() {
		SQLQuery query = session.createSQLQuery("select * from `match`")
				.addEntity(Match.class);
		List<Match> matchList = query.list();
		return matchList;
	}

	public Match getMatchById(Long matchId) {
		Match match = (Match) session.get(Match.class, matchId);
		return match;
	}

	public List<Match> getAllMatchesWithTournamentName() {
		SQLQuery query = session.createSQLQuery("SELECT m.*, t.tournament_name "
				+ "FROM `match` m INNER JOIN tournament t ON m.id_tournament = t.id_tournament ORDER BY m.id_match ASC")
				.addEntity(Match.class).addScalar("tournament_name");
		List<Object[]> results = query.list();

		List<Match> matchList = new ArrayList<>();
		for (Object[] result : results) {
			Match match = (Match) result[0];
			match.setTournamentName((String) result[1]);
			matchList.add(match);
		}

		return matchList;
	}

	public List<Match> getMatchesByTournamentId(Long tournamentId) {
		SQLQuery query = (SQLQuery) session
				.createSQLQuery("SELECT m.*, t.tournament_name "
						+ "FROM `match` m "
						+ "INNER JOIN tournament t ON m.id_tournament = t.id_tournament "
						+ "WHERE m.id_tournament = :tournamentId "
						+ "ORDER BY m.id_match ASC")
				.addEntity(Match.class).addScalar("tournament_name")
				.setParameter("tournamentId", tournamentId);

		List<Object[]> results = query.list();

		List<Match> matchList = new ArrayList<>();
		for (Object[] result : results) {
			Match match = (Match) result[0];
			match.setTournamentName((String) result[1]);
			matchList.add(match);
		}

		return matchList;
	}

	public List<Match> searchMatch(String field, String value) {
		String queryString = "SELECT m.*, t.tournament_name "
				+ "FROM `match` m "
				+ "INNER JOIN tournament t ON m.id_tournament = t.id_tournament "
				+ "WHERE m." + field + " = :value " + "ORDER BY m.id_match ASC";

		SQLQuery query = (SQLQuery) session.createSQLQuery(queryString)
				.addEntity(Match.class).addScalar("tournament_name")
				.setParameter("value", value);

		List<Object[]> results = query.list();

		List<Match> matchList = new ArrayList<>();
		for (Object[] result : results) {
			Match match = (Match) result[0];
			match.setTournamentName((String) result[1]);
			matchList.add(match);
		}

		return matchList;
	}
}
