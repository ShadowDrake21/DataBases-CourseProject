package service;

import java.util.List;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import dao.HibernateDAOChess;
import domain.Opening;

@Path("opening")
public class OpeningService {
	@GET
	@Path("getAllOpenings")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Opening> getAllOpenings() {
		return HibernateDAOChess.getInstance().getOpeningDAO().getAllOpenings();
	}
	
	@PUT
	@Path("addOpening/name/{opening_name}/category/{opening_category}/year/{opening_year}/player/{famous_player}")
	public void addOpening(@PathParam("opening_name") String opening_name,
			@PathParam("opening_category") String opening_category,
			@PathParam("opening_year") String opening_year,
			@PathParam("famous_player") String famous_player) {
		Opening opening = new Opening();
		opening.setName(opening_name);
		opening.setCategory(opening_category);
		opening.setYear(Integer.parseInt(opening_year));
		opening.setPlayer(famous_player);
		HibernateDAOChess.getInstance().getOpeningDAO().createOpening(opening);
	}

	@DELETE
	@Path("deleteOpening/{id_opening}")
	public void deleteOpening(@PathParam("id_opening") String id_opening) {
		Long idOpening = Long.parseLong(id_opening);
		HibernateDAOChess.getInstance().getOpeningDAO().deleteOpeningById(idOpening);
	}

	@POST
	@Path("updateOpening/id/{id_opening}/name/{opening_name}/category/{opening_category}/year/{opening_year}/player/{famous_player}")
	public void updateOpening(@PathParam("id_opening") String id_opening,
			@PathParam("opening_name") String opening_name,
			@PathParam("opening_category") String opening_category,
			@PathParam("opening_year") String opening_year,
			@PathParam("famous_player") String famous_player) {
		Long idOpening = Long.parseLong(id_opening);
		Opening opening = HibernateDAOChess.getInstance().getOpeningDAO()
				.getOpeningById(idOpening);
		opening.setName(opening_name);
		opening.setCategory(opening_category);
		opening.setYear(Integer.parseInt(opening_year));
		opening.setPlayer(famous_player);
		HibernateDAOChess.getInstance().getOpeningDAO().updateOpening(opening);
	}
}
