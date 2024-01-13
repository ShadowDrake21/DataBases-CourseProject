package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import domain.Player;
import domain.Title;

public class TitleDAO {
	private Session session;

	public TitleDAO(Session session) {
		this.session = session;
	}

	public Title createTitle(Title title) {
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(title);
		transaction.commit();
		return title;
	}

	public Title updateTitle(Title title) {
		Transaction transaction = session.beginTransaction();
		session.merge(title);
		transaction.commit();
		return title;
	}

	public void deleteTitle(Title title) {
		Transaction transaction = session.beginTransaction();
		session.delete(title);
		transaction.commit();
	}

	public void deleteTitleById(Long titleId) {
		Title player = (Title) session.get(Title.class, titleId);
		deleteTitle(player);
	}

	public List<Title> getAllTitles() {
		SQLQuery query = session.createSQLQuery("select * from title")
				.addEntity(Title.class);
		List<Title> titleList = query.list();
		return titleList;
	}

	public Title getTitleById(Long idTitle) {
		Title title = (Title) session.get(Title.class, idTitle);
		return title;
	}

	public List<Title> getTitlesByName(String name) {
		Criteria criteria = session.createCriteria(Title.class)
				.add(Restrictions.eq("title_name", name));
		return criteria.list();
	}

	public List<Title> getAllTitlesWithPlayerName() {
		SQLQuery query = session.createSQLQuery("SELECT t.*, p.player_name "
				+ "FROM title t INNER JOIN player p ON t.id_player = p.id_player ORDER BY t.id_title ASC")
				.addEntity(Title.class).addScalar("player_name");
		List<Object[]> results = query.list();

		List<Title> titleList = new ArrayList<>();
		for (Object[] result : results) {
			Title title = (Title) result[0];
			title.setPlayerName((String) result[1]);
			titleList.add(title);
		}

		return titleList;
	}

	public List<Title> getTitlesByPlayerId(Long playerId) {
		SQLQuery query = (SQLQuery) session
				.createSQLQuery("SELECT t.*, p.player_name " + "FROM title t "
						+ "INNER JOIN player p ON t.id_player = p.id_player "
						+ "WHERE t.id_player = :playerId "
						+ "ORDER BY t.id_title ASC")
				.addEntity(Title.class).addScalar("player_name")
				.setParameter("playerId", playerId);

		List<Object[]> results = query.list();
		System.out.println(results.toString());

		List<Title> titleList = new ArrayList<>();
		for (Object[] result : results) {
			Title title = (Title) result[0];
			title.setPlayerName((String) result[1]);
			titleList.add(title);
			System.out.println(title);
		}

		return titleList;
	}

	public List<Title> searchTitle(String field, String value) {
		String queryString = "SELECT t.*, p.player_name " + "FROM title t "
				+ "INNER JOIN player p ON t.id_player = p.id_player "
				+ "WHERE t." + field + " =:value " + "ORDER BY t.id_title ASC";

		SQLQuery query = (SQLQuery) session.createSQLQuery(queryString)
				.addEntity(Title.class).addScalar("player_name")
				.setParameter("value", value);

		List<Object[]> results = query.list();

		List<Title> titleList = new ArrayList<>();
		for (Object[] result : results) {
			Title title = (Title) result[0];
			title.setPlayerName((String) result[1]);
			titleList.add(title);
		}

		return titleList;
	}
}
