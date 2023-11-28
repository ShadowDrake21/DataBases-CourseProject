package dao;

import org.hibernate.Session;

public class OpeningUsageDAO {
	private Session session;

	public OpeningUsageDAO(Session session) {
		this.session = session;
	}
}
