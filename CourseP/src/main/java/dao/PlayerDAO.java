package dao;

import java.math.BigInteger;
import java.util.ArrayList;
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
	public List<Player> getPlayersByName(String name) {
		Criteria criteria = session.createCriteria(Player.class)
				.add(Restrictions.eq("player_name", name));
		return criteria.list();
	}

	public Player getPlayerById(Long idPlayer) {
		Player player = (Player) session.get(Player.class, idPlayer);
		return player;
	}

	public List<Player> getAllPlayersWithAllAdditionalInfo() {
		SQLQuery query = session.createSQLQuery("SELECT p.*, "
				+ "(SELECT COUNT(*) FROM title t WHERE t.id_player = p.id_player) as title_count, "
				+ "(SELECT COUNT(*) FROM opening_usage ou WHERE ou.id_player = p.id_player) as opening_count, "
				+ "(SELECT COUNT(DISTINCT tp.id_tournament) FROM tournament_participation tp WHERE tp.id_player = p.id_player) as tournament_count "
				+ "FROM player p").addEntity(Player.class)
				.addScalar("title_count").addScalar("opening_count")
				.addScalar("tournament_count");

		List<Object[]> results = query.list();

		List<Player> playerList = new ArrayList<>();
		for (Object[] result : results) {
			Player player = (Player) result[0];
			BigInteger titleNumber = (BigInteger) result[1];
			BigInteger openingNumber = (BigInteger) result[2];
			BigInteger tournamentNumber = (BigInteger) result[3];

			player.setTitleNumber(titleNumber.intValue());
			player.setOpeningNumber(openingNumber.intValue());
			player.setTournamentNumber(tournamentNumber.intValue());

			playerList.add(player);
		}

		return playerList;
	}

}
