package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import domain.Title;

public class TitleDAO {
	private Session session;

	public TitleDAO(Session session) {
		this.session = session;
	}

	/**
	 * This method create new entity
	 */
	public Title createTitle(Title title) {
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(title);
		transaction.commit();
		return title;
	}

	/**
	 * This method update existing product
	 */
	public Title updateTitle(Title title) {
		Transaction transaction = session.beginTransaction();
		session.merge(title);
		transaction.commit();
		return title;
	}

	/**
	 * This method delete existing product
	 */
	public void deleteTitle(Title title) {
		Transaction transaction = session.beginTransaction();
		session.delete(title);
		transaction.commit();
	}

	/**
	 * This method remove entity by id
	 */
	public void deleteTitleById(Long titleId) {
		Title player = (Title) session.get(Title.class, titleId);
		deleteTitle(player);
	}

	/**
	 * This method return all entities
	 */
	public List<Title> getAllTitles() {
		SQLQuery query = session.createSQLQuery("select * from title")
				.addEntity(Title.class);
		List<Title> titleList = query.list();
		return titleList;
	}

	/**
	 * This method return all products by name This
	 * method is specific for Product domain object
	 * instead of other methods from this class All
	 * other methods can be moved to generic class and
	 * can be used for other domain objects.
	 */
	public List<Title> getTitlesByName(String name) {
		Criteria criteria = session.createCriteria(Title.class)
				.add(Restrictions.eq("title_name", name));
		return criteria.list();
	}
}
