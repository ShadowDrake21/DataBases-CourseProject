package domain;

import java.util.Date;

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
@Table(name = "match")
public class Match {
	public Match() {
	}

	public Match(int id, int idTournament, String player1, String player2,
			Date date, String score1, String score2) {
		this.id = id;
		this.idTournament = idTournament;
		this.player1 = player1;
		this.player2 = player2;
		this.date = date;
		this.score1 = score1;
		this.score2 = score2;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_tournament", referencedColumnName = "id_tournament", insertable = false, updatable = false)
	private Tournament tournament;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_match", unique = true, nullable = false)
	private int id;

	@Column(name = "id_tournament", nullable = false)
	private int idTournament;

	@Column(name = "match_player", nullable = false)
	private String player1;

	@Column(name = "match_opponent", nullable = false)
	private String player2;

	@Column(name = "match_date", nullable = true)
	private Date date;

	@Column(name = "match_score_1", nullable = true)
	private String score1;

	@Column(name = "match_score_2", nullable = true)
	private String score2;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdTournament() {
		return idTournament;
	}

	public void setIdTournament(int idTournament) {
		this.idTournament = idTournament;
	}

	public String getPlayer1() {
		return player1;
	}

	public void setPlayer1(String player1) {
		this.player1 = player1;
	}

	public String getPlayer2() {
		return player2;
	}

	public void setPlayer2(String player2) {
		this.player2 = player2;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getScore1() {
		return score1;
	}

	public void setScore1(String score1) {
		this.score1 = score1;
	}

	public String getScore2() {
		return score2;
	}

	public void setScore2(String score2) {
		this.score2 = score2;
	}
}
