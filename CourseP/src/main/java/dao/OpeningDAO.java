package dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import domain.Opening; 

public class OpeningDAO { 
    private Session session;
    public OpeningDAO(Session session) {
        this.session = session;
    }

    public Opening createOpening(Opening open) { 
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(open);
        transaction.commit();
        return open;
    }

    public Opening updateOpening(Opening open) { 
        Transaction transaction = session.beginTransaction();
        session.merge(open);
        transaction.commit();
        return open;
    }

    public void deleteOpening(Opening open) { 
        Transaction transaction = session.beginTransaction();
        session.delete(open);
        transaction.commit();
    }

    public void deleteOpeningById(Long openId) { 
        Opening open = (Opening) session.get(Opening.class, openId);
        deleteOpening(open);
    }

    public List<Opening> getAllOpenings() { 
        SQLQuery query = session.createSQLQuery(
                "select * from opening").addEntity(Opening.class); 
        List<Opening> openList = query.list();
        return openList;
    }

    /*public List<Open> getOpensByName(String name) { 
        Criteria criteria = session.createCriteria(Open.class) 
                .add(Restrictions.eq("name", name));
        return criteria.list();
    }*/
    
    public Opening getOpeningById(Long openId) { 
        Opening open = (Opening) session.get(Opening.class, openId);
        return open;
    }
}
