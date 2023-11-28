package dao;

import org.hibernate.Session;

public class TournamentPartDAO {
	private Session session;

	public TournamentPartDAO(Session session) {
		this.session = session;
	}
}
