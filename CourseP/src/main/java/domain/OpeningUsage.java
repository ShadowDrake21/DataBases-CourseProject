package domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "opening_usage")
public class OpeningUsage {
	public OpeningUsage() {
	}

	public OpeningUsage(int id, int idOpening, int idPlayer, int points) {
		this.id = id;
		this.idOpening = idOpening;
		this.idPlayer = idPlayer;
		this.points = points;
	}

	@ManyToOne
	@JoinColumn(name = "id_player", insertable = false, updatable = false)
	private Player player;

	@ManyToOne
	@JoinColumn(name = "id_opening", insertable = false, updatable = false)
	private Opening opening;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_opening_usage", unique = true, nullable = false)
	private int id;

	private int idOpening;

	private int idPlayer;

	@Column(name = "opening_usage_points", nullable = true)
	private int points;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdOpening() {
		return idOpening;
	}

	public void setIdOpening(int idOpening) {
		this.idOpening = idOpening;
	}

	public int getIdPlayer() {
		return idPlayer;
	}

	public void setIdPlayer(int idPlayer) {
		this.idPlayer = idPlayer;
	}

	public int getPoints() {
		return points;
	}

	public void setPoints(int points) {
		this.points = points;
	}
}
