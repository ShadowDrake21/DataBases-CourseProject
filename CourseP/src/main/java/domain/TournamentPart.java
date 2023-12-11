package domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "tournament_participation")
public class TournamentPart {
	public TournamentPart() {
	}

	public TournamentPart(Long idPlayer, Long idTournament, Date registration,
			int place) {
		this.idPlayer = idPlayer;
		this.idTournament = idTournament;
		this.registration = registration;
		this.place = place;
	}

	@ManyToOne
	@JoinColumn(name = "id_player", insertable = false, updatable = false)
	private Player player;

	@ManyToOne
	@JoinColumn(name = "id_tournament", insertable = false, updatable = false)
	private Tournament tournament;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_tournament_participation", unique = true, nullable = false)
	private Long id;

	@Column(name = "id_player", nullable = false)
	private Long idPlayer;

	@Column(name = "id_tournament", nullable = false)
	private Long idTournament;

	@Column(name = "tournament_participation_registration", nullable = true)
	private Date registration;

	@Column(name = "tournament_participation_place", nullable = false)
	private int place;

	@Transient
	private String playerName;

	@Transient
	private String tournamentName;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getIdPlayer() {
		return idPlayer;
	}

	public void setIdPlayer(Long idPlayer) {
		this.idPlayer = idPlayer;
	}

	public Long getIdTournament() {
		return idTournament;
	}

	public void setIdTournament(Long idTournament) {
		this.idTournament = idTournament;
	}

	public Date getRegistration() {
		return registration;
	}

	public void setRegistration(Date registration) {
		this.registration = registration;
	}

	public int getPlace() {
		return place;
	}

	public void setPlace(int place) {
		this.place = place;
	}

	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}

	public void setTournamentName(String tournamentName) {
		this.tournamentName = tournamentName;

	}

	public String getPlayerName() {
		return playerName;
	}

	public String getTournamentName() {
		return tournamentName;
	}

	@Override
	public String toString() {
		return "TournamentPart [player=" + player + ", tournament=" + tournament
				+ ", id=" + id + ", idPlayer=" + idPlayer + ", idTournament="
				+ idTournament + ", registration=" + registration + ", place="
				+ place + "]";
	}
}
