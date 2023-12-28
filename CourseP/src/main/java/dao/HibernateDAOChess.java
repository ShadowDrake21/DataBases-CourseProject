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

	private PlayerDAO playerDAO;
	private UserDAO userDAO;
	private TournamentDAO tournamentDAO;
	private OpeningDAO openingDAO;
	private TitleDAO titleDAO;
	private MatchDAO matchDAO;
	private OpeningUsageDAO openingUsageDAO;
	private TournamentPartDAO tournamentPartDAO;
	private TournamentLogDAO tournamentLogDAO;

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
			configuration.setProperty(Environment.DRIVER,
					"com.mysql.cj.jdbc.Driver");
			configuration.setProperty(Environment.URL,
					"jdbc:mysql://localhost:3306/chess");
			configuration.setProperty(Environment.USER, "root");
			configuration.setProperty(Environment.PASS, "PolishDream_04");
			configuration.setProperty(Environment.DIALECT,
					"org.hibernate.dialect.MySQL5Dialect");
			configuration.setProperty(Environment.HBM2DDL_AUTO, "none");
			configuration.setProperty(Environment.SHOW_SQL, "true");
			configuration.addAnnotatedClass(User.class)
					.addAnnotatedClass(Player.class)
					.addAnnotatedClass(Title.class)
					.addAnnotatedClass(Match.class)
					.addAnnotatedClass(Opening.class)
					.addAnnotatedClass(Tournament.class)
					.addAnnotatedClass(OpeningUsage.class)
					.addAnnotatedClass(TournamentPart.class)
					.addAnnotatedClass(TournamentLog.class);
			StandardServiceRegistryBuilder serviceRegistryBuilder = new StandardServiceRegistryBuilder();
			serviceRegistryBuilder.applySettings(configuration.getProperties());
			ServiceRegistry serviceRegistry = serviceRegistryBuilder.build();
			SessionFactory sessionFactory = configuration
					.buildSessionFactory(serviceRegistry);
			session = sessionFactory.openSession();
		}
		return session;
	}

	public UserDAO getUserDAO() {
		if (null == userDAO) {
			userDAO = new UserDAO(getSession());
		}
		return userDAO;
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

	public MatchDAO getMatchDAO() {
		if (null == matchDAO) {
			matchDAO = new MatchDAO(getSession());
		}
		return matchDAO;
	}

	public OpeningUsageDAO getOpeningUsageDAO() {
		if (null == openingUsageDAO) {
			openingUsageDAO = new OpeningUsageDAO(getSession());
		}
		return openingUsageDAO;
	}

	public OpeningDAO getOpeningDAO() {
		if (null == openingDAO) {
			openingDAO = new OpeningDAO(getSession());
		}
		return openingDAO;
	}

	public TournamentPartDAO getTournamentPartDAO() {
		if (null == tournamentPartDAO) {
			tournamentPartDAO = new TournamentPartDAO(getSession());
		}
		return tournamentPartDAO;
	}

	public TournamentDAO getTournamentDAO() {
		if (null == tournamentDAO) {
			tournamentDAO = new TournamentDAO(getSession());
		}
		return tournamentDAO;
	}

	public TournamentLogDAO getTournamentLogDAO() {
		if (null == tournamentLogDAO) {
			tournamentLogDAO = new TournamentLogDAO(getSession());
		}
		return tournamentLogDAO;
	}

	public void closeSession() {
		getSession().close();
	}

}
