package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;
import domain.*;

public class HibernateDAOChess {

    private static HibernateDAOChess instance;
    private MatchDAO matchDAO;
    private OpenDAO openDAO;
    private OpenUseDAO openUseDAO;
    private PlayerDAO playerDAO;
    private TitleDAO titleDAO;
    private TournDAO tournDAO;
    private TournPartDAO tournPartDAO;
    private Session session;

    public static HibernateDAOChess getInstance() {
        if (null == instance) {
            instance = new HibernateDAOChess();
        }
        return instance;
    }

    public Session getSession() {
        if (null == session) {
            Configuration configuration = new Configuration();
            configuration.setProperty(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
            configuration.setProperty(Environment.URL, "jdbc:mysql://localhost:3306/library_hibernate");
            configuration.setProperty(Environment.USER, "root");
            configuration.setProperty(Environment.PASS, "111111");
            configuration.setProperty(Environment.DIALECT, "org.hibernate.dialect.MySQL5Dialect");
            configuration.setProperty(Environment.HBM2DDL_AUTO, "none");
            configuration.setProperty(Environment.SHOW_SQL, "true");
                       
            configuration.addAnnotatedClass(Match.class); 
            configuration.addAnnotatedClass(Open.class);
            configuration.addAnnotatedClass(OpenUse.class); 
            configuration.addAnnotatedClass(Player.class);
            configuration.addAnnotatedClass(Title.class); 
            configuration.addAnnotatedClass(Tourn.class);
            configuration.addAnnotatedClass(TournPart.class); 
            StandardServiceRegistryBuilder serviceRegistryBuilder = 
            		new StandardServiceRegistryBuilder();
            serviceRegistryBuilder.applySettings(configuration.getProperties());
            ServiceRegistry serviceRegistry = serviceRegistryBuilder.build();
            SessionFactory sessionFactory = 
            		configuration.buildSessionFactory(serviceRegistry);
            session = sessionFactory.openSession();
        }
        return session;
    }

    public MatchDAO getMatchDAO() {
        if (null == matchDAO) {
            matchDAO = new MatchDAO(getSession());
        }
        return matchDAO;
    }
    
    public OpenDAO getOpenDAO() {
        if (null == openDAO) {
            openDAO = new OpenDAO(getSession());
        }
        return openDAO;
    }
  
    public OpenUseDAO getOpenUseDAO() {
        if (null == openUseDAO) {
            openUseDAO = new OpenUseDAO(getSession());
        }
        return openUseDAO;
    }
    
    public PlayerDAO getPlayerDAO() {
        if (null == playerDAO) {
            playerDAO = new PlayerDAO(getSession());
        }
        return playerDAO;
    }
    
    public TitleDAO getTitleDAO() {
        if (null == titleDAO) {
            titleDAO = new TitleDAO(getSession());
        }
        return titleDAO;
    }
    
    public TournDAO getTournDAO() {
        if (null == tournDAO) {
            tournDAO = new TournDAO(getSession());
        }
        return tournDAO;
    }
    
    public TournPartDAO getTournPartDAO() {
        if (null == tournPartDAO) {
            tournPartDAO = new TournPartDAO(getSession());
        }
        return tournPartDAO;
    }

    public void closeSession() {
		getSession().close();
	}
    
}