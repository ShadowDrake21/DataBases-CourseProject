package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

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
	public List<Tournament> getTournamentsByName(String name) {
		Criteria criteria = session.createCriteria(Tournament.class)
				.add(Restrictions.eq("tournament_name", name));
		return criteria.list();
	}
}
