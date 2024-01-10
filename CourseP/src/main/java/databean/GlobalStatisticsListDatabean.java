package databean;

import java.util.List;

import dao.HibernateDAOChess;
import domain.GlobalStatistics;
import domain.Match;

public class GlobalStatisticsListDatabean {
	private List<GlobalStatistics> globalStatisticsList;

	public GlobalStatisticsListDatabean() {
		globalStatisticsList = HibernateDAOChess.getInstance()
				.getGlobalStatisticsDAO().getAllGlobalStatistics();
	}

	public List<GlobalStatistics> getGlobalStatisticsList() {
		return globalStatisticsList;
	}

	public void setGlobalStatisticsList(
			List<GlobalStatistics> globalStatisticsList) {
		this.globalStatisticsList = globalStatisticsList;
	}
}