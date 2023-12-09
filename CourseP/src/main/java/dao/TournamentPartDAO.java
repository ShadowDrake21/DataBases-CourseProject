package dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import domain.TournamentPart; 

public class TournamentPartDAO { 
    private Session session;
    public TournamentPartDAO(Session session) {
        this.session = session;
    }

    public TournamentPart createTournamentPart(TournamentPart tournPart) { 
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(tournPart);
        transaction.commit();
        return tournPart;
    }

    public TournamentPart updateTournamentPart(TournamentPart tournPart) { 
        Transaction transaction = session.beginTransaction();
        session.merge(tournPart);
        transaction.commit();
        return tournPart;
    }

    public void deleteTournamentPart(TournamentPart tournPart) { 
        Transaction transaction = session.beginTransaction();
        session.delete(tournPart);
        transaction.commit();
    }

    public void deleteTournamentPartById(Long tournPartId) { 
        TournamentPart tournPart = (TournamentPart) session.get(TournamentPart.class, tournPartId);
        deleteTournamentPart(tournPart);
    }

    public List<TournamentPart> getAllTournamentParts() { 
        SQLQuery query = session.createSQLQuery(
                "select * from tournament_participation").addEntity(TournamentPart.class); 
        List<TournamentPart> tournPartList = query.list();
        return tournPartList;
    }

    /*public List<TournPart> getTournPartsByName(String name) { 
        Criteria criteria = session.createCriteria(TournPart.class) 
                .add(Restrictions.eq("name", name));
        return criteria.list();
    }*/
    
    public TournamentPart getTournamentPartById(Long tournPartId) { 
        TournamentPart tournPart = (TournamentPart) session.get(TournamentPart.class, tournPartId);
        return tournPart;
    }
}

