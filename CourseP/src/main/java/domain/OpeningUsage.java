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

	public OpeningUsage(Long id, Long idOpening, Long idPlayer, int points) {
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
	private Long id;

	@Column(name = "id_opening", nullable = false) // false !!!!
	private Long idOpening;

	@Column(name = "id_player", nullable = false) // false !!!!
	private Long idPlayer;

	@Column(name = "opening_usage_points", nullable = true)
	private int points;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getIdOpening() {
		return idOpening;
	}

	public void setIdOpening(Long idOpening) {
		this.idOpening = idOpening;
	}

	public Long getIdPlayer() {
		return idPlayer;
	}

	public void setIdPlayer(Long idPlayer) {
		this.idPlayer = idPlayer;
	}

	public int getPoints() {
		return points;
	}

	public void setPoints(int points) {
		this.points = points;
	}

	@Override
	public String toString() {
		return "OpeningUsage [player=" + player + ", opening=" + opening
				+ ", id=" + id + ", idOpening=" + idOpening + ", idPlayer="
				+ idPlayer + ", points=" + points + "]";
	}
}
