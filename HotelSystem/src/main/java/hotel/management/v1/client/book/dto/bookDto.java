package hotel.management.v1.client.book.dto;

import lombok.Data;
import lombok.ToString;

public class bookDto {
	@Data
	@ToString
	public static class findRoom{
		Integer roomno;
		String gradename;
		String roomstatus;
	}
}
