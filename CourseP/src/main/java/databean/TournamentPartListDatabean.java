package databean;

import java.util.List;
import dao.HibernateDAOChess;
import domain.TournamentPart;

public class TournamentPartListDatabean {

	private List<TournamentPart> tournamentPartList;

	public TournamentPartListDatabean() {
		tournamentPartList = HibernateDAOChess.getInstance()
				.getTournamentPartDAO().getAllTournamentParts();
	}

	public List<TournamentPart> getTournamentPartList() {
		return tournamentPartList;
	}

	public void setTournamentPartList(List<TournamentPart> tournamentPartList) {
		this.tournamentPartList = tournamentPartList;
	}
}
