package dao;

import java.util.List;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import domain.TournamentPart;

public class TournamentPartDAO {
	private Session session;

	public TournamentPartDAO(Session session) {
		this.session = session;
	}

	public TournamentPart createTournamentPart(TournamentPart tournamentPart) {
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(tournamentPart);
		transaction.commit();
		return tournamentPart;
	}

	public TournamentPart updateTournamentPart(TournamentPart tournamentPart) {
		Transaction transaction = session.beginTransaction();
		session.merge(tournamentPart);
		transaction.commit();
		return tournamentPart;
	}

	public void deleteTournamentPart(TournamentPart tournamentPart) {
		Transaction transaction = session.beginTransaction();
		session.delete(tournamentPart);
		transaction.commit();
	}

	public void deleteTournamentPartById(Long tournamentPartId) {
		TournamentPart tournamentPart = (TournamentPart) session
				.get(TournamentPart.class, tournamentPartId);
		deleteTournamentPart(tournamentPart);
	}

	public List<TournamentPart> getAllTournamentParts() {
		SQLQuery query = session
				.createSQLQuery("select * from tournament_participation")
				.addEntity(TournamentPart.class);
		List<TournamentPart> tournamentPartList = query.list();
		return tournamentPartList;
	}

	public TournamentPart getTournamentPartById(Long tournamentPartId) {
		TournamentPart tournamentPart = (TournamentPart) session
				.get(TournamentPart.class, tournamentPartId);
		return tournamentPart;
	}
}
