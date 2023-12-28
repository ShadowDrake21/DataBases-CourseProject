package settings;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import domain.Enums.MatchScore;

@Converter(autoApply = true)
public class StringToMatchScore
		implements AttributeConverter<MatchScore, String> {

	@Override
	public String convertToDatabaseColumn(MatchScore attribute) {
		return attribute == null ? null : attribute.getScore();
	}

	@Override
	public MatchScore convertToEntityAttribute(String dbData) {
		return dbData == null ? null : MatchScore.getScoreByInput(dbData);
	}
}