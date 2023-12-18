package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import domain.Match;

public class MatchDAO {
	private Session session;

	public MatchDAO(Session session) {
		this.session = session;
	}

	/**
	 * This method create new entity
	 */
	public Match createMatch(Match match) {
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(match);
		transaction.commit();
		return match;
	}

	/**
	 * This method update existing product
	 */
	public Match updateMatch(Match match) {
		Transaction transaction = session.beginTransaction();
		session.merge(match);
		transaction.commit();
		return match;
	}

	/**
	 * This method delete existing product
	 */
	public void deleteMatch(Match match) {
		Transaction transaction = session.beginTransaction();
		session.delete(match);
		transaction.commit();
	}

	/**
	 * This method remove entity by id
	 */
	public void deleteMatchById(Long matchId) {
		Match match = (Match) session.get(Match.class, matchId);
		deleteMatch(match);
	}

	/**
	 * This method return all entities
	 */
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
}
