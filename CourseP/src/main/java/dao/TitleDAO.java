package dao;

import org.hibernate.Session;

public class TitleDAO {
	private Session session;

	public TitleDAO(Session session) {
		this.session = session;
	}
}
