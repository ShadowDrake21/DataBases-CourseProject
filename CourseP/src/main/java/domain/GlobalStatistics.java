package domain;

public class GlobalStatistics {

	private String tableName;
	private Long itemCount;

	// Constructors, getters, and setters

	public GlobalStatistics() {
	}

	public GlobalStatistics(String tableName, Long itemCount) {
		this.tableName = tableName;
		this.itemCount = itemCount;
	}

	// Getters and Setters

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public Long getItemCount() {
		return itemCount;
	}

	public void setItemCount(Long itemCount) {
		this.itemCount = itemCount;
	}
}
