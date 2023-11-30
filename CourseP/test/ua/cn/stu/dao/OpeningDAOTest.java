package ua.cn.stu.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.Test;

import dao.HibernateDAOChess;
import domain.Opening;

public class OpeningDAOTest {
	@Test
	public void whenGetAllThenAllShouldBePresent() {
		// given
		// when
		List<Opening> openingList = HibernateDAOChess.getInstance()
				.getOpeningDAO().getAllOpenings();

		// then
		assertEquals(20, openingList.size());
		for (Opening opening : openingList) {
			assertNotNull(opening);
			assertNotNull(opening.getId());
			assertNotNull(opening.getName());
			System.out.println(opening);
		}
	}

	@Test
	public void outputAllPlayers() {
		// given
		// when
		List<Opening> openingList = HibernateDAOChess.getInstance()
				.getOpeningDAO().getAllOpenings();

		for (Opening opening : openingList) {
			assertNotNull(opening);
			System.out.println("OPENING " + opening.getOpeningUsage());
		}
	}
}
