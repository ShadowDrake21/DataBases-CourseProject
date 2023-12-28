package settings;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import domain.Enums.OpeningCategory;

@Converter(autoApply = true)
public class StringToOpeningCategoryConverter

		implements AttributeConverter<OpeningCategory, String> {

	@Override
	public String convertToDatabaseColumn(OpeningCategory attribute) {
		return attribute == null ? null : attribute.getCategory();
	}

	@Override
	public OpeningCategory convertToEntityAttribute(String dbData) {
		return dbData == null ? null
				: OpeningCategory.getCategoryByInput(dbData);
	}
}