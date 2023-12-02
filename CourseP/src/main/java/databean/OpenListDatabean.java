package databean;

import java.util.List;
import dao.HibernateDAOChess;
import domain.Open;

public class OpenListDatabean {
    
    private List<Open> openList;
    
    public OpenListDatabean() {
        openList = HibernateDAOChess.getInstance().getOpenDAO()
                .getAllOpens();
    }
    
    public List<Open> getOpenList() {
        return openList;
    }
    
    public void setOpenList(List<Open> openList) {
        this.openList = openList;
    }
}
