package databean;

import java.util.List;
import dao.HibernateDAOChess;
import domain.Tournament;

public class TournamentListDatabean {

	private List<Tournament> tournamentList;

	public TournamentListDatabean() {
		tournamentList = HibernateDAOChess.getInstance().getTournamentDAO()
				.getAllTournamentsWithMatchNumber();
	}

	public List<Tournament> getTournamentList() {
		return tournamentList;
	}

	public void setTournamentList(List<Tournament> tournamentList) {
		this.tournamentList = tournamentList;
	}
}
