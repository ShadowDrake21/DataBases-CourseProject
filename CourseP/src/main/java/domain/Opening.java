package domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import domain.Enums.OpeningCategory;

@Entity
@Table(name = "opening")
public class Opening {
	public Opening() {
	}

	public Opening(int id, String name, String category, short year,
			String player) {
		this.id = id;
		this.name = name;
		this.category = OpeningCategory.getCategoryByInput(category);
		this.year = year;
		this.player = player;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_opening", unique = true, nullable = false)
	private int id;

	@Column(name = "opening_name", nullable = false)
	private String name;

	@Column(name = "opening_category", nullable = false)
	private OpeningCategory category;

	@Column(name = "opening_year", nullable = true)
	private short year;

	@Column(name = "opening_famous_player", nullable = true)
	private String player;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "opening")
	private List<Opening> openingUsage = new ArrayList<>();

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
		return category.getCategory();
	}

	public void setCategory(String category) {
		this.category = OpeningCategory.getCategoryByInput(category);
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
