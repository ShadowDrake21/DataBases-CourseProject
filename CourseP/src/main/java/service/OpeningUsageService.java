package service;

import java.util.List;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import dao.HibernateDAOChess;
import domain.OpeningUsage;

@Path("openingusage")
public class OpeningUsageService {
	@GET
	@Path("getAllOpeningUsage")
	@Produces(MediaType.APPLICATION_JSON)
	public List<OpeningUsage> getAllOpeningUsage() {
		return HibernateDAOChess.getInstance().getOpeningUsageDAO()
				.getAllOpeningUsages();
	}

	@PUT
	@Path("addOpeningUsage/idOpening/{id_opening}/idPlayer/{id_player}/point/{usage_points}")
	public void addOpeningUsage(@PathParam("id_opening") String id_opening,
			@PathParam("id_player") String id_player,
			@PathParam("usage_points") String usage_points) {
		OpeningUsage openinguse = new OpeningUsage();
		openinguse.setIdOpening(Long.parseLong(id_opening));
		openinguse.setIdPlayer(Long.parseLong(id_player));
		openinguse.setPoints(Integer.parseInt(usage_points));
		HibernateDAOChess.getInstance().getOpeningUsageDAO()
				.createOpeningUsage(openinguse);
	}

	@DELETE
	@Path("deleteOpeningUsage/{id_opening_usage}")
	public void deleteOpeningUsage(
			@PathParam("id_opening_usage") String id_opening_usage) {
		Long idOpeningUse = Long.parseLong(id_opening_usage);
		HibernateDAOChess.getInstance().getOpeningUsageDAO()
				.deleteOpeningUsageById(idOpeningUse);
	}

	@POST
	@Path("updateOpeningUsage/id/{id_opening_usage}/idOpening/{id_opening}/idPlayer/{id_player}/point/{usage_points}")
	public void updateOpeningUsage(
			@PathParam("id_opening_usage") String id_opening_usage,
			@PathParam("id_opening") String id_opening,
			@PathParam("id_player") String id_player,
			@PathParam("usage_points") String usage_points) {
		Long idOpeningUse = Long.parseLong(id_opening_usage);
		OpeningUsage openinguse = HibernateDAOChess.getInstance()
				.getOpeningUsageDAO().getOpeningUsageById(idOpeningUse);
		openinguse.setIdOpening(Long.parseLong(id_opening));
		openinguse.setIdPlayer(Long.parseLong(id_player));
		openinguse.setPoints(Integer.parseInt(usage_points));
		HibernateDAOChess.getInstance().getOpeningUsageDAO()
				.updateOpeningUsage(openinguse);
	}
}
