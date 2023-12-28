package settings;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import domain.Enums.TournamentType;

@Converter(autoApply = true)
public class StringToTournamentType
		implements AttributeConverter<TournamentType, String> {

	@Override
	public String convertToDatabaseColumn(TournamentType attribute) {
		return attribute == null ? null : attribute.getType();
	}

	@Override
	public TournamentType convertToEntityAttribute(String dbData) {
		return dbData == null ? null : TournamentType.getTypeByInput(dbData);
	}
}