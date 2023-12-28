package databean;

import java.util.List;
import dao.HibernateDAOChess;
import domain.Match;

public class MatchListDatabean {

	private List<Match> matchList;

	public MatchListDatabean() {
		matchList = HibernateDAOChess.getInstance().getMatchDAO()
				.getAllMatchesWithTournamentName();
	}

	public List<Match> getMatchList() {
		return matchList;
	}

	public void setMatchList(List<Match> matchList) {
		this.matchList = matchList;
	}
}
