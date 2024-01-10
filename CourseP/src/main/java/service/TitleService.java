package service;

import java.util.List;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import dao.HibernateDAOChess;
import domain.Title;

@Path("title")
public class TitleService {
	@GET
	@Path("getAllTitles")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Title> getAllTitles() {
		return HibernateDAOChess.getInstance().getTitleDAO().getAllTitles();
	}

	@GET
	@Path("getAllTitlesWithPlayerName")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Title> getAllTitlesWithPlayerName() {
		return HibernateDAOChess.getInstance().getTitleDAO()
				.getAllTitlesWithPlayerName();
	}

	@PUT
	@Path("addTitle/name/{title_name}/year/{title_year}/player/{id_player}")
	public void addTitle(@PathParam("title_name") String title_name,
			@PathParam("title_year") String title_year,
			@PathParam("id_player") String id_player) {
		Title title = new Title();
		title.setName(title_name);
		title.setYear(Integer.parseInt(title_year));
		title.setIdPlayer(Long.parseLong(id_player));
		HibernateDAOChess.getInstance().getTitleDAO().createTitle(title);
	}

	@DELETE
	@Path("deleteTitle/{id_title}")
	public void deleteTitle(@PathParam("id_title") String id_title) {
		Long idTitle = Long.parseLong(id_title);
		HibernateDAOChess.getInstance().getTitleDAO().deleteTitleById(idTitle);
	}

	@POST
	@Path("updateTitle/id/{id_title}/name/{title_name}/year/{title_year}/player/{id_player}")
	public void updateTitle(@PathParam("id_title") String id_title,
			@PathParam("title_name") String title_name,
			@PathParam("title_year") String title_year,
			@PathParam("id_player") String id_player) {
		Long idTitle = Long.parseLong(id_title);
		Title title = HibernateDAOChess.getInstance().getTitleDAO()
				.getTitleById(idTitle);
		title.setName(title_name);
		title.setYear(Integer.parseInt(title_year));
		title.setIdPlayer(Long.parseLong(id_player));
		HibernateDAOChess.getInstance().getTitleDAO().updateTitle(title);
	}

}
