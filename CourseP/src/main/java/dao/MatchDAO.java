package dao;

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
}
