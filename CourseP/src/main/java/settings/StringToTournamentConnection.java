package settings;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import domain.Enums.TournamentConnection;

@Converter(autoApply = true)
public class StringToTournamentConnection
		implements AttributeConverter<TournamentConnection, String> {

	@Override
	public String convertToDatabaseColumn(TournamentConnection attribute) {
		return attribute == null ? null : attribute.getConnection();
	}

	@Override
	public TournamentConnection convertToEntityAttribute(String dbData) {
		return dbData == null ? null
				: TournamentConnection.getConnectionByInput(dbData);
	}
}