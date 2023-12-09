package dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import domain.Tournament; 

public class TournamentDAO { 
    private Session session;
    public TournamentDAO(Session session) {
        this.session = session;
    }

    public Tournament createTournament(Tournament tourn) { 
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(tourn);
        transaction.commit();
        return tourn;
    }

    public Tournament updateTournament(Tournament tourn) { 
        Transaction transaction = session.beginTransaction();
        session.merge(tourn);
        transaction.commit();
        return tourn;
    }

    public void deleteTournament(Tournament tourn) { 
        Transaction transaction = session.beginTransaction();
        session.delete(tourn);
        transaction.commit();
    }

    public void deleteTournamentById(Long tournId) { 
        Tournament tourn = (Tournament) session.get(Tournament.class, tournId);
        deleteTournament(tourn);
    }

    public List<Tournament> getAllTournaments() {
        SQLQuery query = session.createSQLQuery(
                "select * from tournament").addEntity(Tournament.class); 
        List<Tournament> tournList = query.list();
        return tournList;
    }

    /*public List<Tourn> getTournsByName(String name) { 
        Criteria criteria = session.createCriteria(Tourn.class) 
                .add(Restrictions.eq("name", name));
        return criteria.list();
    }*/
    
    public Tournament getTournamentById(Long tournId) { 
        Tournament tourn = (Tournament) session.get(Tournament.class, tournId);
        return tourn;
    }
}
