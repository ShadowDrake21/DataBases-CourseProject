package dao;

import org.hibernate.Session;

public class TournamentDAO {
	private Session session;

	public TournamentDAO(Session session) {
		this.session = session;
	}
}
