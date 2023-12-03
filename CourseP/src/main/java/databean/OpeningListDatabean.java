package databean;

import java.util.List;
import dao.HibernateDAOChess;
import domain.Opening;

public class OpeningListDatabean {

	private List<Opening> openingList;

	public OpeningListDatabean() {
		openingList = HibernateDAOChess.getInstance().getOpeningDAO()
				.getAllOpenings();
	}

	public List<Opening> getOpeningList() {
		return openingList;
	}

	public void setOpeningList(List<Opening> openingList) {
		this.openingList = openingList;
	}
}
