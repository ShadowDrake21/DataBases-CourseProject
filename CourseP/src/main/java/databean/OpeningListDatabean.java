package databean;

import java.util.List;
import dao.HibernateDAOChess;
import domain.Opening;

public class OpeningListDatabean {
    
    private List<Opening> openList;
    
    public OpeningListDatabean() {
        openList = HibernateDAOChess.getInstance().getOpeningDAO()
                .getAllOpenings();
    }
    
    public List<Opening> getOpeningList() {
        return openList;
    }
    
    public void setOpeningList(List<Opening> openList) {
        this.openList = openList;
    }
}
