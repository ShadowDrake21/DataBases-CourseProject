package domain;

public class OpeningRaport {
	private Long id_opening;
	private String opening_name;
	private String opening_category;
	private int opening_year;
	private String opening_famous_player;
	private Long id_player;
	private Long opening_usage_points;
	public Long getId_opening() {
		return id_opening;
	}
	public void setId_opening(Long id_opening) {
		this.id_opening = id_opening;
	}
	public String getOpening_name() {
		return opening_name;
	}
	public void setOpening_name(String opening_name) {
		this.opening_name = opening_name;
	}
	public String getOpening_category() {
		return opening_category;
	}
	public void setOpening_category(String opening_category) {
		this.opening_category = opening_category;
	}
	public int getOpening_year() {
		return opening_year;
	}
	public void setOpening_year(int opening_year) {
		this.opening_year = opening_year;
	}
	public String getOpening_famous_player() {
		return opening_famous_player;
	}
	public void setOpening_famous_player(String opening_famous_player) {
		this.opening_famous_player = opening_famous_player;
	}
	public Long getId_player() {
		return id_player;
	}
	public void setId_player(Long id_player) {
		this.id_player = id_player;
	}
	public Long getOpening_usage_points() {
		return opening_usage_points;
	}
	public void setOpening_usage_points(Long opening_usage_points) {
		this.opening_usage_points = opening_usage_points;
	}
	
	@Override
	public String toString() {
		return "Openings [id_opening=" + id_opening + ", opening_name=" + opening_name + ", opening_category="
				+ opening_category + ", opening_year=" + opening_year + ", opening_famous_player="
				+ opening_famous_player + ", id_player=" + id_player + ", opening_usage_points=" + opening_usage_points
				+ "]";
	}
}
