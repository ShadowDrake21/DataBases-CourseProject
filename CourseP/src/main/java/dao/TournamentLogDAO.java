package dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;

import domain.TournamentLog;

public class TournamentLogDAO {
	private Session session;

	public TournamentLogDAO(Session session) {
		this.session = session;
	}
	
	public List<TournamentLog> getAllTournamentLog() {
		SQLQuery query = session
				.createSQLQuery("select * from tournament_log")
				.addEntity(TournamentLog.class);
		List<TournamentLog> tournamentLogList = query.list();
		return tournamentLogList;
	}
}
