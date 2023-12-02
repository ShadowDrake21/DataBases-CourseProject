package dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import domain.Title; 

public class TitleDAO { 
    private Session session;
    public TitleDAO(Session session) {
        this.session = session;
    }

    public Title createTitle(Title title) { 
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(title);
        transaction.commit();
        return title;
    }

    public Title updateTitle(Title title) { 
        Transaction transaction = session.beginTransaction();
        session.merge(title);
        transaction.commit();
        return title;
    }

    public void deleteTitle(Title title) { 
        Transaction transaction = session.beginTransaction();
        session.delete(title);
        transaction.commit();
    }

    public void deleteTitleById(Long titleId) { 
        Title title = (Title) session.get(Title.class, titleId);
        deleteTitle(title);
    }

    public List<Title> getAllTitles() { 
        SQLQuery query = session.createSQLQuery(
                "select * from title").addEntity(Title.class); 
        List<Title> titleList = query.list();
        return titleList;
    }

    /*public List<Title> getTitlesByName(String name) { 
        Criteria criteria = session.createCriteria(Title.class)
                .add(Restrictions.eq("name", name));
        return criteria.list();
    }*/
    
    public Title getTitleById(Long titleId) { 
        Title title = (Title) session.get(Title.class, titleId);
        return title;
    }
}
