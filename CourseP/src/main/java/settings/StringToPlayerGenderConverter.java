package settings;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import domain.Enums.PlayerGender;

@Converter(autoApply = true)
public class StringToPlayerGenderConverter
		implements AttributeConverter<PlayerGender, String> {

	@Override
	public String convertToDatabaseColumn(PlayerGender attribute) {
		return attribute == null ? null : attribute.getGender();
	}

	@Override
	public PlayerGender convertToEntityAttribute(String dbData) {
		return dbData == null ? null : PlayerGender.getGenderByInput(dbData);
	}
}