package databean;

import java.util.List;
import dao.HibernateDAOChess;
import domain.Tourn;

public class TournListDatabean {
    
    private List<Tourn> tournList;
    
    public TournListDatabean() {
        tournList = HibernateDAOChess.getInstance().getTournDAO()
                .getAllTourns();
    }
    
    public List<Tourn> getTournList() {
        return tournList;
    }
    
    public void setTournList(List<Tourn> tournList) {
        this.tournList = tournList;
    }
}

