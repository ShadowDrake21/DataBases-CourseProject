package servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import domain.OpeningRaport;
import domain.Player;
import domain.TournamentsAndMatches;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

public class GenerateReportsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static DriverManagerDataSource connection = null;

	private String formatDate(Date date) {
		if (date == null) {
			return "";
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("EEE d MMM y");
		return dateFormat.format(date);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String reportType = request.getParameter("reportType");
		byte[] reportContent = null;

		if ("Generate Report 1".equals(reportType)) {
			reportContent = generateReport1();
		} else if ("Generate Report 2".equals(reportType)) {
			reportContent = generateReport2();
		} else if ("Generate Report 3".equals(reportType)) {
			reportContent = generateReport3();
		} else if ("Download".equals(reportType)) {
		}

		if (reportContent != null) {
			response.setContentType("application/pdf");
			response.setContentLength(reportContent.length);

			// Set Content-Disposition header to force
			// download
			response.setHeader("Content-Disposition",
					"attachment; filename=report.pdf");

			try (OutputStream outStream = response.getOutputStream()) {
				outStream.write(reportContent);
			}
		}
	}

	// Implement your report generation logic for each
	// report type
	private byte[] generateReport1() {
		try {
			String reportTemplatePath = "E:/3 year/1 semester/Databases/Labs/DB_Krapyvianskyi_Lab3/raports/Raport_players.jrxml";

			JasperReport jasperReport = JasperCompileManager
					.compileReport(reportTemplatePath);

			List<Player> reportData = getAllDataForReport1(connection);

			JasperCompileManager.compileReportToFile(reportTemplatePath);

			JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(
					reportData);

			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,
					null, dataSource);

			return JasperExportManager.exportReportToPdf(jasperPrint);
		} catch (JRException ex) {
			ex.printStackTrace();
			return null;
		}
	}

	private byte[] generateReport2() {
		try {
			String reportTemplatePath = "E:/3 year/1 semester/Databases/Labs/DB_Krapyvianskyi_Lab3/raports/Raport_Tournaments.jrxml";

			JasperReport jasperReport = JasperCompileManager
					.compileReport(reportTemplatePath);

			List<TournamentsAndMatches> reportData = getAllDataForReport2(
					connection);

			JasperCompileManager.compileReportToFile(reportTemplatePath);

			JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(
					reportData);

			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,
					null, dataSource);

			return JasperExportManager.exportReportToPdf(jasperPrint);
		} catch (JRException ex) {
			ex.printStackTrace();
			return null;
		}
	}

	private byte[] generateReport3() {
		try {
			String reportTemplatePath = "E:/3 year/1 semester/Databases/Labs/DB_Krapyvianskyi_Lab3/raports/Raport_WonPointsUsingOpening.jrxml";

			JasperReport jasperReport = JasperCompileManager
					.compileReport(reportTemplatePath);

			List<OpeningRaport> reportData = getAllDataForReport3(connection);

			System.out.println(reportData);

			JasperCompileManager.compileReportToFile(reportTemplatePath);

			JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(
					reportData);

			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,
					null, dataSource);

			return JasperExportManager.exportReportToPdf(jasperPrint);
		} catch (JRException ex) {
			ex.printStackTrace();
			return null;
		}
	}

	private List<Player> getAllDataForReport1(
			DriverManagerDataSource dataSource) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		String sql = "SELECT id_player, player_name, player_gender, player_birthday, player_country, player_nationality, player_rate, player_matches, player_wins FROM chess.player";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);

		List<Player> reportDataList = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			Player reportData = new Player();
			reportData.setId((Long) row.get("id_player"));
			reportData.setName((String) row.get("player_name"));
			reportData.setGender((String) row.get("player_gender"));
			reportData
					.setBirthday(formatDate((Date) row.get("player_birthday")));
			reportData.setCountry((String) row.get("player_country"));
			reportData.setNationality((String) row.get("player_nationality"));
			reportData.setRate((int) row.get("player_rate"));
			reportData.setMatches((int) row.get("player_matches"));
			reportData.setWins((int) row.get("player_wins"));
			reportDataList.add(reportData);
		}

		return reportDataList;
	}

	private List<TournamentsAndMatches> getAllDataForReport2(
			DriverManagerDataSource dataSource) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		String sql = "SELECT t.id_tournament, t.tournament_type, t.tournament_name, t.tournament_start, t.tournament_end, t.tournament_connection, t.tournament_prize, t.tournament_matches, t.tournament_players, t.tournament_current_champ, m.id_match, m.match_player, m.match_opponent, m.match_date, m.match_score_1, m.match_score_2 FROM chess.tournament t LEFT JOIN chess.match m ON t.id_tournament = m.id_tournament";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);

		List<TournamentsAndMatches> reportDataList = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			TournamentsAndMatches reportData = new TournamentsAndMatches();
			reportData.setId_tournament((Long) row.get("id_tournament"));
			reportData.setTournament_type((String) row.get("tournament_type"));
			reportData.setTournament_name((String) row.get("tournament_name"));
			reportData.setTournament_start(
					formatDate((Date) row.get("tournament_start")));
			reportData.setTournament_end(
					formatDate((Date) row.get("tournament_end")));
			reportData.setTournament_connection(
					(String) row.get("tournament_connection"));
			reportData.setTournament_prize((Long) row.get("tournament_prize"));
			reportData.setTournament_matches(
					(Long) row.get("tournament_matches"));
			reportData.setTournament_players(
					(Long) row.get("tournament_players"));
			reportData.setTournament_current_champ(
					(String) row.get("tournament_current_champ"));

			reportData.setId_match((Long) row.get("id_match"));
			reportData.setMatch_player((String) row.get("match_player"));
			reportData.setMatch_opponent((String) row.get("match_opponent"));
			reportData.setMatch_date(formatDate((Date) row.get("match_date")));
			reportData.setMatch_score_1((String) row.get("match_score_1"));
			reportData.setMatch_score_2((String) row.get("match_score_2"));
			reportDataList.add(reportData);
		}

		return reportDataList;
	}

	private List<OpeningRaport> getAllDataForReport3(
			DriverManagerDataSource dataSource) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		String sql = "SELECT o.id_opening, o.opening_name, o.opening_category, o.opening_year, o.opening_famous_player, ou.id_player, ou.opening_usage_points FROM chess.opening o LEFT JOIN chess.opening_usage ou ON o.id_opening = ou.id_opening";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);

		List<OpeningRaport> reportDataList = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			OpeningRaport reportData = new OpeningRaport();
			reportData.setId_opening((Long) row.get("id_opening"));
			reportData.setOpening_name((String) row.get("opening_name"));
			reportData
					.setOpening_category((String) row.get("opening_category"));
			reportData.setOpening_year((int) row.get("opening_year"));
			reportData.setOpening_famous_player(
					(String) row.get("opening_famous_player"));
			reportData.setId_player((Long) row.get("id_player"));
			reportData.setOpening_usage_points(
					(Long) row.get("opening_usage_points"));
			reportDataList.add(reportData);
		}

		return reportDataList;
	}
}