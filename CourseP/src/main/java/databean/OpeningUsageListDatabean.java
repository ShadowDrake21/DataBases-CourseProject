package databean;

import java.util.List;
import dao.HibernateDAOChess;
import domain.OpeningUsage;

public class OpeningUsageListDatabean {
    
    private List<OpeningUsage> openUseList;
    
    public OpeningUsageListDatabean() {
        openUseList = HibernateDAOChess.getInstance().getOpeningUsageDAO()
                .getAllOpeningUsage();
    }
    
    public List<OpeningUsage> getOpeningUsageList() {
        return openUseList;
    }
    
    public void setOpeningUsageList(List<OpeningUsage> openUseList) {
        this.openUseList = openUseList;
    }
}
