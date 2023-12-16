package dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import domain.OpeningUsage; 

public class OpeningUsageDAO { 
    private Session session;
    public OpeningUsageDAO(Session session) {
        this.session = session;
    }

    public OpeningUsage createOpeningUsage(OpeningUsage openUse) { 
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(openUse);
        transaction.commit();
        return openUse;
    }

    public OpeningUsage updateOpeningUsage(OpeningUsage openUse) { 
        Transaction transaction = session.beginTransaction();
        session.merge(openUse);
        transaction.commit();
        return openUse;
    }

    public void deleteOpeningUsage(OpeningUsage openUse) { 
        Transaction transaction = session.beginTransaction();
        session.delete(openUse);
        transaction.commit();
    }

    public void deleteOpeningUsageById(Long openUseId) { 
        OpeningUsage openUse = (OpeningUsage) session.get(OpeningUsage.class, openUseId);
        deleteOpeningUsage(openUse);
    }

    public List<OpeningUsage> getAllOpeningUsages() { 
        SQLQuery query = session.createSQLQuery(
                "select * from opening_usage").addEntity(OpeningUsage.class); 
        List<OpeningUsage> openUseList = query.list();
        return openUseList;
    }

    /*public List<OpenUse> getOpenUsesByName(String name) { 
        Criteria criteria = session.createCriteria(OpenUse.class) 
                .add(Restrictions.eq("name", name));
        return criteria.list();
    }*/
    
    public OpeningUsage getOpeningUsageById(Long openUseId) { 
        OpeningUsage openUse = (OpeningUsage) session.get(OpeningUsage.class, openUseId);
        return openUse;
    }
}

