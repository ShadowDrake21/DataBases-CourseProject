package databean;

import java.util.List;
import dao.HibernateDAOChess;
import domain.Tournament;

public class TournamentListDatabean {
    
    private List<Tournament> tournList;
    
    public TournamentListDatabean() {
        tournList = HibernateDAOChess.getInstance().getTournamentDAO()
                .getAllTournaments();
    }
    
    public List<Tournament> getTournamentList() {
        return tournList;
    }
    
    public void setTournamentList(List<Tournament> tournList) {
        this.tournList = tournList;
    }
}

