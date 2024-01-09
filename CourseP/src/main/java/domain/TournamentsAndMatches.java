package domain;

public class TournamentsAndMatches {
	private Long id_tournament;
	private String tournament_type;
	private String tournament_name;
	private String tournament_start;
	private String tournament_end;
	private String tournament_connection;
	private Long tournament_prize;
	private Long tournament_matches;
	private Long tournament_players;
	private String tournament_current_champ;
	
	private Long id_match;
	private String match_player;
	private String match_opponent;
	private String match_date;
	private String match_score_1;
	private String match_score_2;
	
	public Long getId_match() {
		return id_match;
	}
	public void setId_match(Long id_match) {
		this.id_match = id_match;
	}
	public String getMatch_player() {
		return match_player;
	}
	public void setMatch_player(String match_player) {
		this.match_player = match_player;
	}
	public String getMatch_opponent() {
		return match_opponent;
	}
	public void setMatch_opponent(String match_opponent) {
		this.match_opponent = match_opponent;
	}
	public String getMatch_date() {
		return match_date;
	}
	public void setMatch_date(String match_date) {
		this.match_date = match_date;
	}
	public String getMatch_score_1() {
		return match_score_1;
	}
	public void setMatch_score_1(String match_score_1) {
		this.match_score_1 = match_score_1;
	}
	public String getMatch_score_2() {
		return match_score_2;
	}
	public void setMatch_score_2(String match_score_2) {
		this.match_score_2 = match_score_2;
	}
	public Long getId_tournament() {
		return id_tournament;
	}
	public void setId_tournament(Long id_tournament) {
		this.id_tournament = id_tournament;
	}
	public String getTournament_type() {
		return tournament_type;
	}
	public void setTournament_type(String tournament_type) {
		this.tournament_type = tournament_type;
	}
	public String getTournament_name() {
		return tournament_name;
	}
	public void setTournament_name(String tournament_name) {
		this.tournament_name = tournament_name;
	}
	public String getTournament_start() {
		return tournament_start;
	}
	public void setTournament_start(String tournament_start) {
		this.tournament_start = tournament_start;
	}
	public String getTournament_end() {
		return tournament_end;
	}
	public void setTournament_end(String tournament_end) {
		this.tournament_end = tournament_end;
	}
	public String getTournament_connection() {
		return tournament_connection;
	}
	public void setTournament_connection(String tournament_connection) {
		this.tournament_connection = tournament_connection;
	}
	public Long getTournament_prize() {
		return tournament_prize;
	}
	public void setTournament_prize(Long tournament_prize) {
		this.tournament_prize = tournament_prize;
	}
	public Long getTournament_matches() {
		return tournament_matches;
	}
	public void setTournament_matches(Long tournament_matches) {
		this.tournament_matches = tournament_matches;
	}
	public Long getTournament_players() {
		return tournament_players;
	}
	public void setTournament_players(Long tournament_players) {
		this.tournament_players = tournament_players;
	}
	public String getTournament_current_champ() {
		return tournament_current_champ;
	}
	public void setTournament_current_champ(String tournament_current_champ) {
		this.tournament_current_champ = tournament_current_champ;
	}
	
	@Override
	public String toString() {
		return "TournamentsAndMatches [id_tournament=" + id_tournament + ", tournament_type=" + tournament_type
				+ ", tournament_name=" + tournament_name + ", tournament_start=" + tournament_start
				+ ", tournament_end=" + tournament_end + ", tournament_connection=" + tournament_connection
				+ ", tournament_prize=" + tournament_prize + ", tournament_matches=" + tournament_matches
				+ ", tournament_players=" + tournament_players + ", tournament_current_champ=" + tournament_current_champ + ", id_match=" + id_match
				+ ", match_player=" + match_player + ", match_opponent=" + match_opponent + ", match_date=" + match_date
				+ ", match_score_1=" + match_score_1 + ", match_score_2=" + match_score_2 + "]";
	}
}
