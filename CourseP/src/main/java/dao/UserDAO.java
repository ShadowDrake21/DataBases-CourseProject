package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import domain.Player;
import domain.User;

public class UserDAO {
	private Session session;

	public UserDAO(Session session) {
		this.session = session;
	}

	public List<User> getUsersByName(String name) {
		Criteria criteria = session.createCriteria(User.class)
				.add(Restrictions.eq("username", name));
		System.out.println(criteria);
		return criteria.list();
	}

	public List<User> getAllUsers() {
		SQLQuery query = session.createSQLQuery("select * from users")
				.addEntity(User.class);
		List<User> userList = query.list();
		return userList;
	}
}
