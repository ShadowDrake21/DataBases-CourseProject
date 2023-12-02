package dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import domain.Open; 

public class OpenDAO { 
    private Session session;
    public OpenDAO(Session session) {
        this.session = session;
    }

    public Open createOpen(Open open) { 
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(open);
        transaction.commit();
        return open;
    }

    public Open updateOpen(Open open) { 
        Transaction transaction = session.beginTransaction();
        session.merge(open);
        transaction.commit();
        return open;
    }

    public void deleteOpen(Open open) { 
        Transaction transaction = session.beginTransaction();
        session.delete(open);
        transaction.commit();
    }

    public void deleteOpenById(Long openId) { 
        Open open = (Open) session.get(Open.class, openId);
        deleteOpen(open);
    }

    public List<Open> getAllOpens() { 
        SQLQuery query = session.createSQLQuery(
                "select * from opening").addEntity(Open.class); 
        List<Open> openList = query.list();
        return openList;
    }

    /*public List<Open> getOpensByName(String name) { 
        Criteria criteria = session.createCriteria(Open.class) 
                .add(Restrictions.eq("name", name));
        return criteria.list();
    }*/
    
    public Open getOpenById(Long openId) { 
        Open open = (Open) session.get(Open.class, openId);
        return open;
    }
}
