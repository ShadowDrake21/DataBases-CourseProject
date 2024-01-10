package databean;

import java.util.List;

import dao.HibernateDAOChess;
import domain.TournamentLog;

public class TournamentLogListDatabean {
	
	private List<TournamentLog> tournamentlogList;

	public TournamentLogListDatabean() {
		tournamentlogList = HibernateDAOChess.getInstance().getTournamentLogDAO().getAllTournamentLog();
	}

	public List<TournamentLog> getTournamentLogList() {
		return tournamentlogList;
	}

	public void setTournamentLogList(List<TournamentLog> tournamentlogList) {
		this.tournamentlogList = tournamentlogList;
	}

}
