package dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import domain.OpeningUsage;
import domain.TournamentPart;

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

	public List<OpeningUsage> getAllOpeningUsagesWithOpeningAndPlayerName() {
		SQLQuery query = session
				.createSQLQuery("SELECT os.*, op.opening_name, p.player_name "
						+ "FROM opening_usage os "
						+ "INNER JOIN opening op ON op.id_opening = os.id_opening "
						+ "INNER JOIN player p ON os.id_player = p.id_player ORDER BY os.id_opening_usage ASC")
				.addEntity(OpeningUsage.class).addScalar("opening_name")
				.addScalar("player_name");

		List<Object[]> results = query.list();

		List<OpeningUsage> openingUsageList = new ArrayList<>();
		for (Object[] result : results) {
			OpeningUsage openingUsage = (OpeningUsage) result[0];
			openingUsage.setOpeningName((String) result[1]);
			openingUsage.setPlayerName((String) result[2]);
			openingUsageList.add(openingUsage);
		}

		return openingUsageList;
	}

	public List<OpeningUsage> searchOpeningsUsages(String field, String value) {
		String queryString = "SELECT os.*, op.opening_name, p.player_name "
				+ "FROM opening_usage os "
				+ "INNER JOIN opening op ON op.id_opening = os.id_opening "
				+ "INNER JOIN player p ON os.id_player = p.id_player "
				+ "WHERE os." + field + "=:value "
				+ "ORDER BY os.id_opening_usage ASC";

		SQLQuery query = (SQLQuery) session.createSQLQuery(queryString)
				.addEntity(OpeningUsage.class).addScalar("opening_name")
				.addScalar("player_name").setParameter("value", value);

		List<Object[]> results = query.list();

		List<OpeningUsage> openingUsageList = new ArrayList<>();
		for (Object[] result : results) {
			OpeningUsage openingUsage = (OpeningUsage) result[0];
			openingUsage.setOpeningName((String) result[1]);
			openingUsage.setPlayerName((String) result[2]);
			openingUsageList.add(openingUsage);
		}

		return openingUsageList;
	}
}
