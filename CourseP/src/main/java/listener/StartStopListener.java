package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import dao.HibernateDAOChess;

public class StartStopListener implements ServletContextListener {
	
	@Override
	 public void contextInitialized(ServletContextEvent arg0) {
	 HibernateDAOChess.getInstance().getSession();
	 }
	
	 @Override
	 public void contextDestroyed(ServletContextEvent arg0) {
	 HibernateDAOChess.getInstance().closeSession();
	 }

}