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

	public List<GlobalStatistics> getAllGlobalStatistics() {
		// Get the total number of tables
		Query tableCountQuery = session.createSQLQuery(
				"SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'chess'");
		Long tableCount = ((BigInteger) tableCountQuery.uniqueResult())
				.longValue();
		System.out.println("Number of tables in the database: " + tableCount);

		// Get the total number of items and columns in
		// each table using native SQL query
		Query tableInfoQuery = session.createSQLQuery(
				"SELECT table_name, table_rows FROM information_schema.tables WHERE table_schema = 'chess'");
		List<Object[]> tablesInfo = tableInfoQuery.list();

		// Display the results
		List<GlobalStatistics> globalStatisticsList = new ArrayList<>();
		System.out.println("Table Statistics:");
		for (Object[] row : tablesInfo) {
			String tableName = (String) row[0];
			Long rowCount = ((BigInteger) row[1] != null)
					? ((BigInteger) row[1]).longValue()
					: 0L;

			// Get the count of columns for each table
			Query columnCountQuery = session.createSQLQuery(
					"SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'chess' AND table_name = :tableName");
			columnCountQuery.setParameter("tableName", tableName);
			int columnCount = ((BigInteger) columnCountQuery.uniqueResult())
					.intValue();

			GlobalStatistics globalStatistics = new GlobalStatistics(tableCount,
					tableName, rowCount, columnCount);
			globalStatisticsList.add(globalStatistics);
		}

		return globalStatisticsList;
	}
}
