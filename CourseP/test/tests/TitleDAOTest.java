package tests;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;

import dao.HibernateDAOChess;
import domain.Title;

class TitleDAOTest {

	@Test
	public void whenGetAllThenAllShouldBePresent() {
		// given
		// when
		List<Title> titleList = HibernateDAOChess.getInstance().getTitleDAO()
				.getAllTitles();

		// then
		assertEquals(24, titleList.size());
		for (Title title : titleList) {
			assertNotNull(title);
			assertNotNull(title.getId());
			assertNotNull(title.getName());
			System.out.println(title);
		}
	}

}
