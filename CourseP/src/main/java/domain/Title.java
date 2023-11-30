package domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "title")
public class Title {
	public Title() {
	}

	public Title(int id, String name, int year, int idPlayer) {
		this.id = id;
		this.name = name;
		this.year = year;
		this.idPlayer = idPlayer;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_player", referencedColumnName = "id_player", insertable = false, updatable = false)
	private Player player;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_title", unique = true, nullable = false)
	private int id;

	@Column(name = "title_name", nullable = false)
	private String name;

	@Column(name = "title_year", nullable = true)
	private int year;

	@Column(name = "id_player", nullable = true)
	private int idPlayer;

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

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getIdPlayer() {
		return idPlayer;
	}

	public void setIdPlayer(int idPlayer) {
		this.idPlayer = idPlayer;
	}

	@Override
	public String toString() {
		return "Title [player=" + player + ", id=" + id + ", name=" + name
				+ ", year=" + year + ", idPlayer=" + idPlayer + "]";
	}

}
