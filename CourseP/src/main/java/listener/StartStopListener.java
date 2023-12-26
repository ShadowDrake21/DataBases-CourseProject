package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import dao.HibernateDAOChess;
import dao.UserDAO;

public class StartStopListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		HibernateDAOChess.getInstance().getSession();

		UserDAO userDAO = new UserDAO(
				HibernateDAOChess.getInstance().getSession());
		arg0.getServletContext().setAttribute("userDAO", userDAO);
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		HibernateDAOChess.getInstance().closeSession();
	}

}