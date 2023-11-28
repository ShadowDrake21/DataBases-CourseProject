package dao;

import org.hibernate.Session;

public class MatchDAO {
	private Session session;

	public MatchDAO(Session session) {
		this.session = session;
	}
}
