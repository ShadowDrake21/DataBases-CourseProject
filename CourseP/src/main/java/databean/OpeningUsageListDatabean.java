package databean;

import java.util.List;
import dao.HibernateDAOChess;
import domain.OpeningUsage;

public class OpeningUsageListDatabean {

	private List<OpeningUsage> openingUsageList;

	public OpeningUsageListDatabean() {
		openingUsageList = HibernateDAOChess.getInstance().getOpeningUsageDAO()
				.getAllOpeningUsagesWithOpeningAndPlayerName();
	}

	public List<OpeningUsage> getOpeningUsageList() {
		return openingUsageList;
	}

	public void setOpeningUsageList(List<OpeningUsage> openingUsageList) {
		this.openingUsageList = openingUsageList;
	}
}
