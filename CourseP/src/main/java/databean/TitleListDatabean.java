package databean;

import java.util.List;
import dao.HibernateDAOChess;
import domain.Title;

public class TitleListDatabean {

	private List<Title> titleList;

	public TitleListDatabean() {
		titleList = HibernateDAOChess.getInstance().getTitleDAO()
				.getAllTitlesWithPlayerName();
	}

	public List<Title> getTitleList() {
		return titleList;
	}

	public void setTitleList(List<Title> titleList) {
		this.titleList = titleList;
	}
}
