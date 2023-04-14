package hotel.management.v1.manager.dto;

import java.sql.Date;
import java.time.LocalDate;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor(access=AccessLevel.PRIVATE)
public class ManagerDto {
    @Data
    @ToString
    @Builder
	public static class bookList {
        private String booker;
        private String bookTel;
        private Integer roomNo;
        private LocalDate bookDate;
        private String bookRoomGrade; //gradename이 예약에 있어야한다.
        private LocalDate checkIn;
        private LocalDate checkOut;
        private Integer breakfast;
        private Integer resNo;
        private String bookStatus;
    }
    
    @Data
    @ToString
    @Builder
	public static class bookSearchCondition {
        private Boolean isStay;
        private Boolean isRestaurant;
        private String fromDate;
        private String toDate;
        private Integer roomNum;
        private String name;
        private Integer listType;
    }

    @Data
    @ToString
    @Builder
	public static class test {
        private Integer bookNo;
        private String userName;
        private Integer totalCount;
        private LocalDate bookDate;
        private String bookTel;
        private String booker;
    }
}
