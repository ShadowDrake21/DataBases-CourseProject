package domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import domain.Enums.MatchScore;
import settings.StringToMatchScore;
import settings.StringToTournamentConnection;

@Entity
@Table(name = "`match`")
public class Match {
	public Match() {
	}

	public Match(Long id, Long idTournament, String player1, String player2,
			String date, String score1, String score2) {
		this.id = id;
		this.idTournament = idTournament;
		this.player1 = player1;
		this.player2 = player2;
		this.date = date;
		this.score1 = MatchScore.getScoreByInput(score1);
		this.score2 = MatchScore.getScoreByInput(score2);
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_tournament", referencedColumnName = "id_tournament", insertable = false, updatable = false)
	private Tournament tournament;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_match", unique = true, nullable = false)
	private Long id;

	@Column(name = "id_tournament", nullable = false)
	private Long idTournament;

	@Column(name = "match_player", nullable = false)
	private String player1;

	@Column(name = "match_opponent", nullable = false)
	private String player2;

	@Column(name = "match_date", nullable = true)
	private String date;

	@Column(name = "match_score_1", nullable = true)
	@Convert(converter = StringToMatchScore.class)
	private MatchScore score1;

	@Column(name = "match_score_2", nullable = true)
	@Convert(converter = StringToMatchScore.class)
	private MatchScore score2;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getIdTournament() {
		return idTournament;
	}

	public void setIdTournament(Long idTournament) {
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getScore1() {
		return score1.getScore();
	}

	public void setScore1(String score1) {
		this.score1 = MatchScore.getScoreByInput(score1);
	}

	public String getScore2() {
		return score2.getScore();
	}

	public void setScore2(String score2) {
		this.score2 = MatchScore.getScoreByInput(score2);
	}

	@Override
	public String toString() {
		return "Match [tournament=" + tournament + ", id=" + id
				+ ", idTournament=" + idTournament + ", player1=" + player1
				+ ", player2=" + player2 + ", date=" + date + ", score1="
				+ score1.getScore() + ", score2=" + score2.getScore() + "]";
	}
}
