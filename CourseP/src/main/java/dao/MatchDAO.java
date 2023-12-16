package dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import domain.Match; 

public class MatchDAO { 
    private Session session;
    public MatchDAO(Session session) {
        this.session = session;
    }

    public Match createMatch(Match match) { 
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(match);
        transaction.commit();
        return match;
    }

    public Match updateMatch(Match match) { 
        Transaction transaction = session.beginTransaction();
        session.merge(match);
        transaction.commit();
        return match;
    }

    public void deleteMatch(Match match) { 
        Transaction transaction = session.beginTransaction();
        session.delete(match);
        transaction.commit();
    }

    public void deleteMatchById(Long matchId) { 
        Match match = (Match) session.get(Match.class, matchId);
        deleteMatch(match);
    }

    public List<Match> getAllMatches() { 
        SQLQuery query = session.createSQLQuery(
                "select * from `match`").addEntity(Match.class); 
        List<Match> matchList = query.list();
        return matchList;
    }

   /*public List<Match> getMatchesByName(String name) { 
        Criteria criteria = session.createCriteria(Match.class) 
                .add(Restrictions.eq("name", name));
        return criteria.list();
    }*/
    
    public Match getMatchById(Long matchId) { 
        Match match = (Match) session.get(Match.class, matchId);
        return match;
    }
}
