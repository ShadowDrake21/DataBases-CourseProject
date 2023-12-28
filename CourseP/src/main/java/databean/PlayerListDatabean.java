package databean;

import java.util.List;
import dao.HibernateDAOChess;
import domain.Player;

public class PlayerListDatabean {

	private List<Player> playerList;

	public PlayerListDatabean() {
		playerList = HibernateDAOChess.getInstance().getPlayerDAO()
				.getAllPlayersWithAllAdditionalInfo();
	}

	public List<Player> getPlayerList() {
		return playerList;
	}

	public void setPlayerList(List<Player> playerList) {
		this.playerList = playerList;
	}
}
