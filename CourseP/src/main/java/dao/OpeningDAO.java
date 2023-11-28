package dao;

import org.hibernate.Session;

public class OpeningDAO {
	private Session session;

	public OpeningDAO(Session session) {
		this.session = session;
	}
}
