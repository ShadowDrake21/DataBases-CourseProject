package dao;

import java.util.List;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import domain.OpeningUsage;

public class OpeningUsageDAO {
	private Session session;

	public OpeningUsageDAO(Session session) {
		this.session = session;
	}

	public OpeningUsage createOpeningUsage(OpeningUsage openUse) {
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(openUse);
		transaction.commit();
		return openUse;
	}

	public OpeningUsage updateOpeningUsage(OpeningUsage openUse) {
		Transaction transaction = session.beginTransaction();
		session.merge(openUse);
		transaction.commit();
		return openUse;
	}

	public void deleteOpeningUsage(OpeningUsage openUse) {
		Transaction transaction = session.beginTransaction();
		session.delete(openUse);
		transaction.commit();
	}

	public void deleteOpeningUsageById(Long openingUsageId) {
		OpeningUsage openingUsage = (OpeningUsage) session
				.get(OpeningUsage.class, openingUsageId);
		deleteOpeningUsage(openingUsage);
	}

	public List<OpeningUsage> getAllOpeningUsages() {
		SQLQuery query = session.createSQLQuery("select * from opening_usage")
				.addEntity(OpeningUsage.class);
		List<OpeningUsage> openingUsageList = query.list();
		return openingUsageList;
	}

	public OpeningUsage getOpeningUsageById(Long openingUsageId) {
		OpeningUsage openingUsage = (OpeningUsage) session
				.get(OpeningUsage.class, openingUsageId);
		return openingUsage;
	}
}
