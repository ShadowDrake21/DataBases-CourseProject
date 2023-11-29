package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import domain.Player;

public class PlayerDAO {
	private Session session;

	public PlayerDAO(Session session) {
		this.session = session;
	}

	/**
	 * This method create new entity
	 */
	public Player createPlayer(Player player) {
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(player);
		transaction.commit();
		return player;
	}

	/**
	 * This method update existing product
	 */
	public Player updatePlayer(Player player) {
		Transaction transaction = session.beginTransaction();
		session.merge(player);
		transaction.commit();
		return player;
	}

	/**
	 * This method delete existing product
	 */
	public void deletePlayer(Player player) {
		Transaction transaction = session.beginTransaction();
		session.delete(player);
		transaction.commit();
	}

	/**
	 * This method remove entity by id
	 */
	public void deletePlayerById(Long playerId) {
		Player player = (Player) session.get(Player.class, playerId);
		deletePlayer(player);
	}

	/**
	 * This method return all entities
	 */
	public List<Player> getAllPlayers() {
		SQLQuery query = session.createSQLQuery("select * from player")
				.addEntity(Player.class);
		List<Player> playerList = query.list();
		return playerList;
	}

	/**
	 * This method return all products by name This
	 * method is specific for Product domain object
	 * instead of other methods from this class All
	 * other methods can be moved to generic class and
	 * can be used for other domain objects.
	 */
	public List<Player> getPlayersByTitle(String name) {
		Criteria criteria = session.createCriteria(Player.class)
				.add(Restrictions.eq("player_name", name));
		return criteria.list();
	}
}
