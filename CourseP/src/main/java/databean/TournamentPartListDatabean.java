package databean;

import java.util.List;
import dao.HibernateDAOChess;
import domain.TournamentPart;

public class TournamentPartListDatabean {
    
    private List<TournamentPart> tournPartList;
    
    public TournamentPartListDatabean() {
        tournPartList = HibernateDAOChess.getInstance().getTournamentPartDAO()
                .getAllTournamentParts();
    }
    
    public List<TournamentPart> getTournamentPartList() {
        return tournPartList;
    }
    
    public void setTournamentPartList(List<TournamentPart> tournPartList) {
        this.tournPartList = tournPartList;
    }
}
