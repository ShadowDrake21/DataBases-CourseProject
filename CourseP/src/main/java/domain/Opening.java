package domain;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "opening")
public class Opening {
	public Opening() {
	}

	public Opening(int id, String name, String category, short year,
			String player) {
		this.id = id;
		this.name = name;
		this.category = category;
		this.year = year;
		this.player = player;
	}

	private int id;
	private String name;
	private String category;
	private short year;
	private String player;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public short getYear() {
		return year;
	}

	public void setYear(short year) {
		this.year = year;
	}

	public String getPlayer() {
		return player;
	}

	public void setPlayer(String player) {
		this.player = player;
	}
}
