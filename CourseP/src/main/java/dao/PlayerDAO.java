package dao;

import org.hibernate.Session;

public class PlayerDAO {
	private Session session;

	public PlayerDAO(Session session) {
		this.session = session;
	}
}
