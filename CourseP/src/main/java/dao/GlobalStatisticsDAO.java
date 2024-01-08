package dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import domain.GlobalStatistics;
import domain.Title;

public class GlobalStatisticsDAO {
	private Session session;

	public GlobalStatisticsDAO(Session session) {
		this.session = session;
	}

//	public List<GlobalStatistics> getAllGlobalStatistics() {
////		Query tableCountQuery = session.createQuery(
////				"SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = chess");
////		List<Object[]> tableCount = tableCountQuery.list();
////		System.out.println("Number of tables in the database: " + tableCount);
//
////		// Get the total number of items in each table
//		Query itemCountQuery = session.createQuery(
//				"SELECT table_name, table_rows FROM information_schema.tables WHERE table_schema = chess");
//		List<Object[]> itemsInTables = itemCountQuery.list();
//
//		// Display the results
//		List<GlobalStatistics> globalStatisticsList = new ArrayList<>();
//		System.out.println("Table Statistics:");
//		for (Object[] row : itemsInTables) {
//			String tableName = (String) row[0];
//			Long rowCount = (Long) row[1];
//			System.out.println(
//					"Table: " + tableName + ", Number of items: " + rowCount);
//		}
//
//		return globalStatisticsList;
//	}
	public List<GlobalStatistics> getAllGlobalStatistics() {
		Query tableCountQuery = session.createSQLQuery(
				"SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'chess'");
		List<Object[]> tableCount = tableCountQuery.list();
		System.out.println("Number of tables in the database: " + tableCount);
		// Get the total number of items in each table
		// using native SQL query
		Query itemCountQuery = session.createSQLQuery(
				"SELECT table_name, table_rows FROM information_schema.tables WHERE table_schema = 'chess'");
		List<Object[]> itemsInTables = itemCountQuery.list();

		// Display the results
		List<GlobalStatistics> globalStatisticsList = new ArrayList<>();
		System.out.println("Table Statistics:");
		for (Object[] row : itemsInTables) {
			String tableName = (String) row[0];
			BigInteger rowCount = (BigInteger) row[1];

			// Check for null and handle it
			long rowCountValue = (rowCount != null) ? rowCount.longValue() : 0;

			System.out.println("Table: " + tableName + ", Number of items: "
					+ rowCountValue);

			// Assuming you have a constructor in
			// GlobalStatistics class
			GlobalStatistics globalStatistics = new GlobalStatistics(tableName,
					rowCountValue);
			globalStatisticsList.add(globalStatistics);
		}

		return globalStatisticsList;
	}
}
