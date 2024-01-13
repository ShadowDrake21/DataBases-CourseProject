package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import domain.Opening;

public class OpeningDAO {
	private Session session;

	public OpeningDAO(Session session) {
		this.session = session;
	}

	public Opening createOpening(Opening opening) {
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(opening);
		transaction.commit();
		return opening;
	}

	public Opening updateOpening(Opening opening) {
		Transaction transaction = session.beginTransaction();
		session.merge(opening);
		transaction.commit();
		return opening;
	}

	public void deleteOpening(Opening opening) {
		Transaction transaction = session.beginTransaction();
		session.delete(opening);
		transaction.commit();
	}

	public void deleteOpeningById(Long openingId) {
		Opening opening = (Opening) session.get(Opening.class, openingId);
		deleteOpening(opening);
	}

	public List<Opening> getAllOpenings() {
		SQLQuery query = session.createSQLQuery("select * from opening")
				.addEntity(Opening.class);
		List<Opening> openingList = query.list();
		return openingList;
	}

	public List<Opening> getOpeningsByName(String name) {
		Criteria criteria = session.createCriteria(Opening.class)
				.add(Restrictions.eq("opening_name", name));
		return criteria.list();
	}

	public Opening getOpeningById(Long openId) {
		Opening open = (Opening) session.get(Opening.class, openId);
		return open;
	}

	public List<Opening> getOpeningsByPlayerId(Long playerId) {
		SQLQuery query = (SQLQuery) session
				.createSQLQuery("SELECT o.*, ou.opening_usage_points  "
						+ "FROM opening o "
						+ "INNER JOIN opening_usage ou ON o.id_opening = ou.id_opening "
						+ "WHERE ou.id_player = :playerId "
						+ "ORDER BY o.id_opening ASC")
				.addEntity(Opening.class).addScalar("opening_usage_points")
				.setParameter("playerId", playerId);

		List<Object[]> results = query.list();

		List<Opening> openingList = new ArrayList<>();
		for (Object[] result : results) {
			Opening opening = (Opening) result[0];
			int openingUsagePoints = (Integer) result[1];
			opening.setOpeningUsagePoints(openingUsagePoints);
			openingList.add(opening);
		}

		return openingList;
	}

	public List<Opening> searchOpenings(String field, String value) {
		SQLQuery query = session.createSQLQuery(
				"select * from opening where " + field + "='" + value + "'")
				.addEntity(Opening.class);
		List<Opening> openingList = query.list();
		return openingList;
	}
}
