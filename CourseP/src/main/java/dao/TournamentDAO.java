package dao;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import domain.Player;
import domain.Title;
import domain.Tournament;

public class TournamentDAO {
	private Session session;

	public TournamentDAO(Session session) {
		this.session = session;
	}

	/**
	 * This method create new entity
	 */
	public Tournament createTournament(Tournament tournament) {
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(tournament);
		transaction.commit();
		return tournament;
	}

	/**
	 * This method update existing product
	 */
	public Tournament updateTournament(Tournament tournament) {
		Transaction transaction = session.beginTransaction();
		session.merge(tournament);
		transaction.commit();
		return tournament;
	}

	/**
	 * This method delete existing product
	 */
	public void deleteTournament(Tournament tournament) {
		Transaction transaction = session.beginTransaction();
		session.delete(tournament);
		transaction.commit();
	}

	/**
	 * This method remove entity by id
	 */
	public void deleteTournamentById(Long tournamentId) {
		Tournament tournament = (Tournament) session.get(Tournament.class,
				tournamentId);
		deleteTournament(tournament);
	}

	/**
	 * This method return all entities
	 */
	public List<Tournament> getAllTournaments() {
		SQLQuery query = session.createSQLQuery("select * from tournament")
				.addEntity(Tournament.class);
		List<Tournament> tournamentList = query.list();
		return tournamentList;
	}

	/**
	 * This method return all products by name This
	 * method is specific for Product domain object
	 * instead of other methods from this class All
	 * other methods can be moved to generic class and
	 * can be used for other domain objects.
	 */

	public Tournament getTournamentById(Long idTournament) {
		Tournament tournament = (Tournament) session.get(Tournament.class,
				idTournament);
		return tournament;
	}

	public List<Tournament> getTournamentsByName(String name) {
		Criteria criteria = session.createCriteria(Tournament.class)
				.add(Restrictions.eq("tournament_name", name));
		return criteria.list();
	}

	public List<Tournament> getAllTournamentsWithMatchNumber() {
		SQLQuery query = session
				.createSQLQuery("SELECT t.*, COUNT(m.id_match) as total "
						+ "FROM tournament t "
						+ "LEFT JOIN `match` m ON t.id_tournament = m.id_tournament "
						+ "GROUP BY t.id_tournament "
						+ "ORDER BY t.id_tournament ASC")
				.addEntity(Tournament.class).addScalar("total");

		List<Object[]> results = query.list();

		List<Tournament> tournamentList = new ArrayList<>();
		for (Object[] result : results) {
			Tournament tournament = (Tournament) result[0];
			BigInteger totalMatches = (BigInteger) result[1];
			tournament.setMatchNumber(totalMatches.intValue());
			tournamentList.add(tournament);
		}

		return tournamentList;
	}

	public List<Tournament> getTournamentsByPlayerId(Long playerId) {
		SQLQuery query = (SQLQuery) session.createSQLQuery(
				"SELECT t.*, tp.tournament_participation_registration "
						+ "FROM tournament t "
						+ "INNER JOIN tournament_participation tp ON t.id_tournament = tp.id_tournament "
						+ "WHERE tp.id_player = :playerId "
						+ "ORDER BY t.id_tournament ASC")
				.addEntity(Tournament.class)
				.addScalar("tournament_participation_registration")
				.setParameter("playerId", playerId);

		List<Object[]> results = query.list();

		List<Tournament> tournamentList = new ArrayList<>();
		for (Object[] result : results) {
			Tournament tournament = (Tournament) result[0];
			Date registration = (Date) result[1];
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String strRegistration = dateFormat.format(registration);

			tournament.setRegistration(strRegistration);
			tournamentList.add(tournament);
		}

		return tournamentList;
	}

	public List<Tournament> searchTournament(String field, String value) {
		String queryString = "SELECT t.*, COUNT(m.id_match) as total "
				+ "FROM tournament t "
				+ "LEFT JOIN `match` m ON t.id_tournament = m.id_tournament "
				+ "WHERE t." + field + " = :value "
				+ "GROUP BY t.id_tournament " + "ORDER BY t.id_tournament ASC";

		SQLQuery query = (SQLQuery) session.createSQLQuery(queryString)
				.addEntity(Tournament.class).addScalar("total")
				.setParameter("value", value);

		List<Object[]> results = query.list();

		List<Tournament> tournamentList = new ArrayList<>();
		for (Object[] result : results) {
			Tournament tournament = (Tournament) result[0];
			BigInteger totalMatches = (BigInteger) result[1];
			tournament.setMatchNumber(totalMatches.intValue());
			tournamentList.add(tournament);
		}

		return tournamentList;
	}
}
