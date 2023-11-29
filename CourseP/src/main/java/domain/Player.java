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

import org.hibernate.annotations.Type;

import domain.Enums.PlayerGender;
import settings.StringToPlayerGenderConverter;

@Entity
@Table(name = "player")
public class Player {
	public Player() {
	}

	public Player(String name, String gender, Date birthday, String country,
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
	private int id;

	@Column(name = "player_name", nullable = false)
	private String name;

	@Column(name = "player_gender", nullable = false)
	@Convert(converter = StringToPlayerGenderConverter.class)
	private PlayerGender gender;

	@Column(name = "player_birthday", nullable = false)
	private Date birthday;

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

	public String getGender() {
		return gender.getGender();
	}

	public void setGender(String gender) {
		this.gender = PlayerGender.getGenderByInput(gender);
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
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

	@Override
	public String toString() {
		return "Player [id=" + id + ", name=" + name + ", gender=" + gender
				+ ", birthday=" + birthday + ", country=" + country
				+ ", nationality=" + nationality + ", rate=" + rate
				+ ", matches=" + matches + ", wins=" + wins + "]";
	}

}
