package dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import domain.TournPart; 

public class TournPartDAO { 
    private Session session;
    public TournPartDAO(Session session) {
        this.session = session;
    }

    public TournPart createTournPart(TournPart tournPart) { 
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(tournPart);
        transaction.commit();
        return tournPart;
    }

    public TournPart updateTournPart(TournPart tournPart) { 
        Transaction transaction = session.beginTransaction();
        session.merge(tournPart);
        transaction.commit();
        return tournPart;
    }

    public void deleteTournPart(TournPart tournPart) { 
        Transaction transaction = session.beginTransaction();
        session.delete(tournPart);
        transaction.commit();
    }

    public void deleteTournPartById(Long tournPartId) { 
        TournPart tournPart = (TournPart) session.get(TournPart.class, tournPartId);
        deleteTournPart(tournPart);
    }

    public List<TournPart> getAllTournParts() { 
        SQLQuery query = session.createSQLQuery(
                "select * from tournament_participation").addEntity(TournPart.class); 
        List<TournPart> tournPartList = query.list();
        return tournPartList;
    }

    /*public List<TournPart> getTournPartsByName(String name) { 
        Criteria criteria = session.createCriteria(TournPart.class) 
                .add(Restrictions.eq("name", name));
        return criteria.list();
    }*/
    
    public TournPart getTournPartById(Long tournPartId) { 
        TournPart tournPart = (TournPart) session.get(TournPart.class, tournPartId);
        return tournPart;
    }
}

