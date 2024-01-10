package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import dao.HibernateDAOChess;
import domain.TournamentLog;

@Path("tournamentlog")
public class TournamentLogService {
	public Date formateInputDate(String strDate) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd",
				Locale.ENGLISH);
		return formatter.parse(strDate);
	}

	@GET
	@Path("getAllTournamentLog")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TournamentLog> getAllTournamentLog() {
		return HibernateDAOChess.getInstance().getTournamentLogDAO()
				.getAllTournamentLog();
	}
}