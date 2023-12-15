package domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import domain.Enums.TournamentConnection;
import domain.Enums.TournamentType;
import settings.StringToPlayerGenderConverter;
import settings.StringToTournamentConnection;
import settings.StringToTournamentType;

@Entity
@Table(name = "tournament")
public class Tournament {
	public Tournament() {
	}

	public Tournament(String type, String name, String start, String end,
			String connection, String country, String city, int prize,
			int numMatches, int players, int prizePlaces, String champion) {
		this.type = TournamentType.getTypeByInput(connection);
		this.name = name;
		this.start = start;
		this.end = end;
		this.connection = connection;
		this.country = country;
		this.city = city;
		this.prize = prize;
		this.numMatches = numMatches;
		this.players = players;
		this.prizePlaces = prizePlaces;
		this.champion = champion;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_tournament", unique = true, nullable = false)
	private Long id;

	@Column(name = "tournament_type", nullable = false)
	@Convert(converter = StringToTournamentType.class)
	private TournamentType type;

	@Column(name = "tournament_name", nullable = false)
	private String name;

	@Column(name = "tournament_start", nullable = false)
	private String start;

	@Column(name = "tournament_end", nullable = false)
	private String end;

	@Column(name = "tournament_connection", nullable = true)
	private String connection;

	@Column(name = "tournament_country", nullable = true)
	private String country;

	@Column(name = "tournament_city", nullable = true)
	private String city;

	@Column(name = "tournament_prize", nullable = false)
	private int prize;

	@Column(name = "tournament_matches", nullable = false)
	private int numMatches;

	@Column(name = "tournament_players", nullable = false)
	private int players;

	@Column(name = "tournament_prize_places", nullable = false)
	private int prizePlaces;

	@Column(name = "tournament_current_champ", nullable = true)
	private String champion;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "tournament")
	private List<Match> matches = new ArrayList<>();

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "tournament")
	private List<TournamentPart> tournamentPart = new ArrayList<>();

	@Transient
	private int matchNumber;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getType() {
		return type.getType();
	}

	public void setType(String type) {
		this.type = TournamentType.getTypeByInput(type);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getConnection() {
		return connection;
	}

	public void setConnection(String connection) {
		this.connection = connection;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getPrize() {
		return prize;
	}

	public void setPrize(int prize) {
		this.prize = prize;
	}

	public int getNumMatches() {
		return numMatches;
	}

	public void setNumMatches(int numMatches) {
		this.numMatches = numMatches;
	}

	public int getPlayers() {
		return players;
	}

	public void setPlayers(int players) {
		this.players = players;
	}

	public int getPrizePlaces() {
		return prizePlaces;
	}

	public void setPrizePlaces(int prizePlaces) {
		this.prizePlaces = prizePlaces;
	}

	public String getChampion() {
		return champion;
	}

	public void setChampion(String champion) {
		this.champion = champion;
	}

	public List<Match> getMatches() {
		return matches;
	}

	public void setMatches(List<Match> matches) {
		this.matches = matches;
	}

	public List<TournamentPart> getTournamentPart() {
		return tournamentPart;
	}

	public void setTournamentPart(List<TournamentPart> tournamentPart) {
		this.tournamentPart = tournamentPart;
	}

	public int getMatchNumber() {
		return matchNumber;
	}

	public void setMatchNumber(int matchNumber) {
		this.matchNumber = matchNumber;
	}

	@Override
	public String toString() {
		return "Tournament [id=" + id + ", type=" + type.getType() + ", name="
				+ name + ", start=" + start + ", end=" + end + ", connection="
				+ connection + ", country=" + country + ", city=" + city
				+ ", prize=" + prize + ", numMatches=" + numMatches
				+ ", players=" + players + ", prizePlaces=" + prizePlaces
				+ ", champion=" + champion + ",\n matches.size()="
				+ matches.size() + ", tournamentPart.size()="
				+ tournamentPart.size() + "]";
	}

}
