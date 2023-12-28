package tests;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;

import dao.HibernateDAOChess;
import domain.Player;

class PlayerDAOTest {

	@Test
	public void whenGetAllPlayersThenAllPlayersShouldBePresent() {
		// given
		// when
		List<Player> playerList = HibernateDAOChess.getInstance().getPlayerDAO()
				.getAllPlayers();

		// then
		assertEquals(10, playerList.size());
		for (Player player : playerList) {
			assertNotNull(player);
			assertNotNull(player.getId());
			assertNotNull(player.getName());
			System.out.println(player);
		}
	}

	@Test
	public void outputAllTitles() {
		// given
		// when
		List<Player> playerList = HibernateDAOChess.getInstance().getPlayerDAO()
				.getAllPlayers();

		for (Player player : playerList) {
			assertNotNull(player);
			System.out.println(player.getTitles());
		}
	}

	@Test
	public void outputAllTournaments() {
		// given
		// when
		List<Player> playerList = HibernateDAOChess.getInstance().getPlayerDAO()
				.getAllPlayers();

		for (Player player : playerList) {
			assertNotNull(player);
			System.out.println(player.getTournamentPart());
		}
	}

	@Test
	public void outputAllOpenings() {
		// given
		// when
		List<Player> playerList = HibernateDAOChess.getInstance().getPlayerDAO()
				.getAllPlayers();

		for (Player player : playerList) {
			assertNotNull(player);
			System.out.println(player.getOpeningUsage());
		}
	}

//	@Test
//	public void whenAddBookThenItShouldBePresentInDb() throws Exception {
//		// given
//		Book book = new Book("Test book title", "Test book author");
//
//		// when
//		HibernateDAOLibrary.getInstance().getBookDAO().createBook(book);
//
//		// then
//		List<Book> bookListAfter = HibernateDAOLibrary.getInstance()
//				.getBookDAO().getAllBooks();
//		int afterSize = bookListAfter.size();
//		assertNotNull(book.getId());
//		assertEquals(4, afterSize);
//	}
//
//	@Test
//	public void whenDeleteBookThenItShouldNotBePresentedInDB()
//			throws Exception {
//		// given
//		Book book = new Book("Test book title", "Test book author");
//		HibernateDAOLibrary.getInstance().getBookDAO().createBook(book);
//		// when
//		HibernateDAOLibrary.getInstance().getBookDAO().deleteBook(book);
//		// then
//		List<Book> bookListAfter = HibernateDAOLibrary.getInstance()
//				.getBookDAO().getAllBooks();
//		assertEquals(3, bookListAfter.size());
//		for (Book bookEnt : bookListAfter) {
//			assertNotEquals("Test book title", bookEnt.getTitle());
//			assertNotEquals("Test book author", bookEnt.getAuthor());
//		}
//	}
//
//	@Test
//	public void whenGetAllBooksByAuthorThenAllWithSuchAuthorShouldBePresent() {
//		// given
//		Book book1 = new Book("Test book title 1", "Specific book author");
//		Book book2 = new Book("Test book title 2", "Specific book author");
//		Book book3 = new Book("Test book title 3", "Specific book author");
//
//		HibernateDAOLibrary.getInstance().getBookDAO().createBook(book1);
//		HibernateDAOLibrary.getInstance().getBookDAO().createBook(book2);
//		HibernateDAOLibrary.getInstance().getBookDAO().createBook(book3);
//
//		// when
//		List<Book> bookListByName = HibernateDAOLibrary.getInstance()
//				.getBookDAO().getBooksByAuthor("Specific book author");
//
//		// then
//		assertEquals(3, bookListByName.size());
//		for (Book bookEnt : bookListByName) {
//			assertEquals("Specific book author", bookEnt.getAuthor());
//		}
//	}

}
