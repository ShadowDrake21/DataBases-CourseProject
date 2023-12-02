package dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import domain.Tourn; 

public class TournDAO { 
    private Session session;
    public TournDAO(Session session) {
        this.session = session;
    }

    public Tourn createTourn(Tourn tourn) { 
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(tourn);
        transaction.commit();
        return tourn;
    }

    public Tourn updateTourn(Tourn tourn) { 
        Transaction transaction = session.beginTransaction();
        session.merge(tourn);
        transaction.commit();
        return tourn;
    }

    public void deleteTourn(Tourn tourn) { 
        Transaction transaction = session.beginTransaction();
        session.delete(tourn);
        transaction.commit();
    }

    public void deleteTournById(Long tournId) { 
        Tourn tourn = (Tourn) session.get(Tourn.class, tournId);
        deleteTourn(tourn);
    }

    public List<Tourn> getAllTourns() {
        SQLQuery query = session.createSQLQuery(
                "select * from tournament").addEntity(Tourn.class); 
        List<Tourn> tournList = query.list();
        return tournList;
    }

    /*public List<Tourn> getTournsByName(String name) { 
        Criteria criteria = session.createCriteria(Tourn.class) 
                .add(Restrictions.eq("name", name));
        return criteria.list();
    }*/
    
    public Tourn getTournById(Long tournId) { 
        Tourn tourn = (Tourn) session.get(Tourn.class, tournId);
        return tourn;
    }
}
