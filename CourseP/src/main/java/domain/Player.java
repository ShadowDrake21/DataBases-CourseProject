package domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Type;

import domain.Enums.PlayerGender;
import settings.StringToPlayerGenderConverter;

@Entity
@Table(name = "player")
public class Player {
	public Player() {
	}

	public Player(String name, String gender, String birthday, String country,
			String nationality, int rate, int matches, int wins) {
		this.name = name;
		this.gender = PlayerGender.getGenderByInput(gender);
		this.birthday = birthday;
		this.country = country;
		this.nationality = nationality;
		this.rate = rate;
		this.matches = matches;
		this.wins = wins;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_player", unique = true, nullable = false)
	private Long id;

	@Column(name = "player_name", nullable = false)
	private String name;

	@Column(name = "player_gender", nullable = false)
	@Convert(converter = StringToPlayerGenderConverter.class)
	private PlayerGender gender;

	@Column(name = "player_birthday", nullable = false)
	private String birthday;

	@Column(name = "player_country", nullable = false)
	private String country;

	@Column(name = "player_nationality", nullable = true)
	private String nationality;

	@Column(name = "player_rate", nullable = false)
	private int rate;

	@Column(name = "player_matches", nullable = false)
	private int matches;

	@Column(name = "player_wins", nullable = false)
	private int wins;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "player")
	private List<Title> titles = new ArrayList<>();

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "player")
	private List<OpeningUsage> openingUsage = new ArrayList<>();

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "player")
	private List<TournamentPart> tournamentPart = new ArrayList<>();

	@Transient
	private int titleNumber;

	@Transient
	private int openingNumber;

	@Transient
	private int tournamentNumber;

	@Transient
	private String registration;

	@Transient
	private int openingUsagePoints;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender.getGender();
	}

	public void setGender(String gender) {
		this.gender = PlayerGender.getGenderByInput(gender);
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public int getMatches() {
		return matches;
	}

	public void setMatches(int matches) {
		this.matches = matches;
	}

	public int getWins() {
		return wins;
	}

	public void setWins(int wins) {
		this.wins = wins;
	}

	public List<Title> getTitles() {
		return titles;
	}

	public void setTitles(List<Title> titles) {
		this.titles = titles;
	}

	public List<OpeningUsage> getOpeningUsage() {
		return openingUsage;
	}

	public void setOpeningUsage(List<OpeningUsage> openingUsage) {
		this.openingUsage = openingUsage;
	}

	public List<TournamentPart> getTournamentPart() {
		return tournamentPart;
	}

	public void setTournamentPart(List<TournamentPart> tournamentPart) {
		this.tournamentPart = tournamentPart;
	}

	public int getTitleNumber() {
		return titleNumber;
	}

	public void setTitleNumber(int titleNumber) {
		this.titleNumber = titleNumber;
	}

	public int getOpeningNumber() {
		return openingNumber;
	}

	public void setOpeningNumber(int openingNumber) {
		this.openingNumber = openingNumber;
	}

	public int getTournamentNumber() {
		return tournamentNumber;
	}

	public void setTournamentNumber(int tournamentNumber) {
		this.tournamentNumber = tournamentNumber;
	}

	public String getRegistration() {
		return registration;
	}

	public void setRegistration(String registration) {
		this.registration = registration;
	}

	public int getOpeningUsagePoints() {
		return openingUsagePoints;
	}

	public void setOpeningUsagePoints(int openingUsagePoints) {
		this.openingUsagePoints = openingUsagePoints;
	}

	@Override
	public String toString() {
		return "Player [id=" + id + ", name=" + name + ", gender=" + getGender()
				+ ", birthday=" + birthday + ", country=" + country
				+ ",nationality=" + nationality + ", rate=" + rate
				+ ", matches=" + matches + ", wins=" + wins + ", titles.size()="
				+ titles.size() + ", openingUsage.size()=" + openingUsage.size()
				+ ", tournamentParticipation.size()=" + tournamentPart.size()
				+ "]\n\n";
	}

}
