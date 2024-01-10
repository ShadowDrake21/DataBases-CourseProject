package dao;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

	public List<Player> getPlayersByTournamentId(Long tournamentId) {
		SQLQuery query = (SQLQuery) session.createSQLQuery(
				"SELECT p.*, tp.tournament_participation_registration "
						+ "FROM player p "
						+ "INNER JOIN tournament_participation tp ON p.id_player = tp.id_player "
						+ "WHERE tp.id_tournament = :tournamentId "
						+ "ORDER BY p.id_player ASC")
				.addEntity(Player.class)
				.addScalar("tournament_participation_registration")
				.setParameter("tournamentId", tournamentId);

		List<Object[]> results = query.list();

		List<Player> playerList = new ArrayList<>();
		for (Object[] result : results) {
			Player player = (Player) result[0];
			Date registration = (Date) result[1];
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String strRegistration = dateFormat.format(registration);

			player.setRegistration(strRegistration);
			playerList.add(player);
		}

		return playerList;
	}

	public List<Player> getPlayersByOpeningId(Long openingId) {
		SQLQuery query = (SQLQuery) session
				.createSQLQuery("SELECT p.*, ou.opening_usage_points "
						+ "FROM player p "
						+ "INNER JOIN opening_usage ou ON p.id_player = ou.id_player "
						+ "WHERE ou.id_opening = :openingId "
						+ "ORDER BY p.id_player ASC")
				.addEntity(Player.class).addScalar("opening_usage_points")
				.setParameter("openingId", openingId);

		List<Object[]> results = query.list();

		List<Player> playerList = new ArrayList<>();
		for (Object[] result : results) {
			Player player = (Player) result[0];
			int openingUsagePoints = (Integer) result[1];
			player.setOpeningUsagePoints(openingUsagePoints);
			playerList.add(player);
		}

		return playerList;
	}

	public List<Player> searchPlayers(String field, String value) {
		String queryString = "SELECT p.*, "
				+ "(SELECT COUNT(*) FROM title t WHERE t.id_player = p.id_player) as title_count, "
				+ "(SELECT COUNT(*) FROM opening_usage ou WHERE ou.id_player = p.id_player) as opening_count, "
				+ "(SELECT COUNT(DISTINCT tp.id_tournament) FROM tournament_participation tp WHERE tp.id_player = p.id_player) as tournament_count "
				+ "FROM player p " + "WHERE p." + field + " = :value";

		SQLQuery query = (SQLQuery) session.createSQLQuery(queryString)
				.addEntity(Player.class).addScalar("title_count")
				.addScalar("opening_count").addScalar("tournament_count")
				.setParameter("value", value);

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
