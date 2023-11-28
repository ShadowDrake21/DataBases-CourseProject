package dao;

import org.hibernate.Session;

public class TournamentLogDAO {
	private Session session;

	public TournamentLogDAO(Session session) {
		this.session = session;
	}
}
