package dao;

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

	/**
	 * This method create new entity
	 */
	public Opening createOpening(Opening opening) {
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(opening);
		transaction.commit();
		return opening;
	}

	/**
	 * This method update existing product
	 */
	public Opening updateOpening(Opening opening) {
		Transaction transaction = session.beginTransaction();
		session.merge(opening);
		transaction.commit();
		return opening;
	}

	/**
	 * This method delete existing product
	 */
	public void deleteOpening(Opening opening) {
		Transaction transaction = session.beginTransaction();
		session.delete(opening);
		transaction.commit();
	}

	/**
	 * This method remove entity by id
	 */
	public void deleteOpeningById(Long openingId) {
		Opening opening = (Opening) session.get(Opening.class, openingId);
		deleteOpening(opening);
	}

	/**
	 * This method return all entities
	 */
	public List<Opening> getAllOpenings() {
		SQLQuery query = session.createSQLQuery("select * from opening")
				.addEntity(Opening.class);
		List<Opening> openingList = query.list();
		return openingList;
	}

	/**
	 * This method return all products by name This
	 * method is specific for Product domain object
	 * instead of other methods from this class All
	 * other methods can be moved to generic class and
	 * can be used for other domain objects.
	 */
	public List<Opening> getOpeningsByName(String name) {
		Criteria criteria = session.createCriteria(Opening.class)
				.add(Restrictions.eq("opening_name", name));
		return criteria.list();
	}
}
