package domain;

public class Enums {
	public enum PlayerGender {
		MALE("Male"), FEMALE("Female");

		private final String gender;

		PlayerGender(String gender) {
			this.gender = gender;
		}

		public static PlayerGender getGenderByInput(String input) {
			for (PlayerGender gender : values()) {
				if (gender.getGender().equalsIgnoreCase(input)) {
					return gender;
				}
			}

			throw new IllegalArgumentException(
					"No gender found. Your input: [" + input + "]");
		}

		public String getGender() {
			return gender;
		}

		public static PlayerGender fromDatabaseValue(String dbValue) {
			for (PlayerGender gender : values()) {
				if (gender.getGender().equals(dbValue)) {
					return gender;
				}
			}

			throw new IllegalArgumentException(
					"No gender found for database value: [" + dbValue + "]");
		}
	}

	public enum OpeningCategory {
		OPEN("Відкритий"), HALFOPEN("Напіввідкритий"), CLOSE("Закритий"),
		FLANK("Фланговий");

		private final String category;

		OpeningCategory(String category) {
			this.category = category;
		}

		public static OpeningCategory getCategoryByInput(String input) {
			for (OpeningCategory category : values()) {
				if (category.getCategory().equalsIgnoreCase(input)) {
					return category;
				}
			}

			throw new IllegalArgumentException(
					"No category found. Your input: [" + input + "]");
		}

		public String getCategory() {
			return category;
		}
	}

	public enum TournamentType {
		Tournament("Турнір"), Championship("Чемпіонат"), Olympics("Олімпіада");

		private final String type;

		TournamentType(String type) {
			this.type = type;
		}

		public static TournamentType getTypeByInput(String input) {
			for (TournamentType type : values()) {
				if (type.getType().equalsIgnoreCase(input)) {
					return type;
				}
			}

			throw new IllegalArgumentException(
					"No type found. Your input: [" + input + "]");
		}

		public String getType() {
			return type;
		}
	}

	public enum TournamentConnection {
		Online("Онлайн"), Offline("Офлайн");

		private final String connection;

		TournamentConnection(String connection) {
			this.connection = connection;
		}

		public static TournamentConnection getConnectionByInput(String input) {
			for (TournamentConnection connection : values()) {
				if (connection.getConnection().equalsIgnoreCase(input)) {
					return connection;
				}
			}

			throw new IllegalArgumentException(
					"No connection found. Your input: [" + input + "]");
		}

		public String getConnection() {
			return connection;
		}
	}

	public enum MatchScore {
		WIN("1"), DRAW("0.5"), LOSS("0");

		private final String score;

		MatchScore(String score) {
			this.score = score;
		}

		public static MatchScore getScoreByInput(String input) {
			for (MatchScore score : values()) {
				if (score.getScore().equals(input)) {
					return score;
				}
			}

			throw new IllegalArgumentException(
					"No score found. Your input: [" + input + "]");
		}

		public String getScore() {
			return score;
		}
	}
}
