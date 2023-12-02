package dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import domain.Player; 

public class PlayerDAO { 
    private Session session;
    public PlayerDAO(Session session) {
        this.session = session;
    }

    public Player createPlayer(Player player) { 
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(player);
        transaction.commit();
        return player;
    }

    public Player updatePlayer(Player player) { 
        Transaction transaction = session.beginTransaction();
        session.merge(player);
        transaction.commit();
        return player;
    }

    public void deletePlayer(Player player) { 
        Transaction transaction = session.beginTransaction();
        session.delete(player);
        transaction.commit();
    }

    public void deletePlayerById(Long playerId) { 
        Player player = (Player) session.get(Player.class, playerId);
        deletePlayer(player);
    }

    public List<Player> getAllPlayers() { 
        SQLQuery query = session.createSQLQuery(
                "select * from player").addEntity(Player.class); 
        List<Player> playerList = query.list();
        return playerList;
    }

    /*public List<Player> getPlayersByName(String name) { 
        Criteria criteria = session.createCriteria(Player.class) 
                .add(Restrictions.eq("name", name));
        return criteria.list();
    }*/
    
    public Player getPlayerById(Long playerId) { 
        Player player = (Player) session.get(Player.class, playerId);
        return player;
    }
}
