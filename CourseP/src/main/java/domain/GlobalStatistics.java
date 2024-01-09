package domain;

public class GlobalStatistics {
	private Long tableCount;
	private String tableName;
	private Long itemCount;
	private Integer columnCount; // New field

	// Constructors, getters, and setters

	public GlobalStatistics() {
	}

	public GlobalStatistics(Long tableCount, String tableName, Long itemCount,
			Integer columnCount) {
		this.tableCount = tableCount;
		this.tableName = tableName;
		this.itemCount = itemCount;
		this.columnCount = columnCount;
	}

	// Getters and Setters

	public Long getTableCount() {
		return tableCount;
	}

	public void setTableCount(Long tableCount) {
		this.tableCount = tableCount;
	}

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

	public Integer getColumnCount() {
		return columnCount;
	}

	public void setColumnCount(Integer columnCount) {
		this.columnCount = columnCount;
	}
}
