package databean;

import java.util.List;
import dao.HibernateDAOChess;
import domain.OpenUse;

public class OpenUseListDatabean {
    
    private List<OpenUse> openUseList;
    
    public OpenUseListDatabean() {
        openUseList = HibernateDAOChess.getInstance().getOpenUseDAO()
                .getAllOpenUses();
    }
    
    public List<OpenUse> getOpenUseList() {
        return openUseList;
    }
    
    public void setOpenUseList(List<OpenUse> openUseList) {
        this.openUseList = openUseList;
    }
}
