package databean;

import java.util.List;
import dao.HibernateDAOChess;
import domain.TournPart;

public class TournPartListDatabean {
    
    private List<TournPart> tournPartList;
    
    public TournPartListDatabean() {
        tournPartList = HibernateDAOChess.getInstance().getTournPartDAO()
                .getAllTournParts();
    }
    
    public List<TournPart> getTournPartList() {
        return tournPartList;
    }
    
    public void setTournPartList(List<TournPart> tournPartList) {
        this.tournPartList = tournPartList;
    }
}
