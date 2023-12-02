package dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import domain.OpenUse; 

public class OpenUseDAO { 
    private Session session;
    public OpenUseDAO(Session session) {
        this.session = session;
    }

    public OpenUse createOpenUse(OpenUse openUse) { 
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(openUse);
        transaction.commit();
        return openUse;
    }

    public OpenUse updateOpenUse(OpenUse openUse) { 
        Transaction transaction = session.beginTransaction();
        session.merge(openUse);
        transaction.commit();
        return openUse;
    }

    public void deleteOpenUse(OpenUse openUse) { 
        Transaction transaction = session.beginTransaction();
        session.delete(openUse);
        transaction.commit();
    }

    public void deleteOpenUseById(Long openUseId) { 
        OpenUse openUse = (OpenUse) session.get(OpenUse.class, openUseId);
        deleteOpenUse(openUse);
    }

    public List<OpenUse> getAllOpenUses() { 
        SQLQuery query = session.createSQLQuery(
                "select * from opening_usage").addEntity(OpenUse.class); 
        List<OpenUse> openUseList = query.list();
        return openUseList;
    }

    /*public List<OpenUse> getOpenUsesByName(String name) { 
        Criteria criteria = session.createCriteria(OpenUse.class) 
                .add(Restrictions.eq("name", name));
        return criteria.list();
    }*/
    
    public OpenUse getOpenUseById(Long openUseId) { 
        OpenUse openUse = (OpenUse) session.get(OpenUse.class, openUseId);
        return openUse;
    }
}

