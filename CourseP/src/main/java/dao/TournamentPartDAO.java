package dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import domain.Title;
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

	public List<TournamentPart> getAllTournamentPartsWithPlayerAndTournamentName() {
		SQLQuery query = session
				.createSQLQuery("SELECT tp.*, p.player_name, t.tournament_name "
						+ "FROM tournament_participation tp "
						+ "INNER JOIN player p ON tp.id_player = p.id_player "
						+ "INNER JOIN tournament t ON tp.id_tournament = t.id_tournament ORDER BY tp.id_tournament_participation ASC")
				.addEntity(TournamentPart.class).addScalar("player_name")
				.addScalar("tournament_name");

		List<Object[]> results = query.list();

		List<TournamentPart> tournamentPartList = new ArrayList<>();
		for (Object[] result : results) {
			TournamentPart tournamentPart = (TournamentPart) result[0];
			tournamentPart.setPlayerName((String) result[1]);
			tournamentPart.setTournamentName((String) result[2]);
			tournamentPartList.add(tournamentPart);
		}

		return tournamentPartList;
	}
}
