package hotel.management.v1.client.book.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import hotel.management.v1.client.book.dto.BookDto.addRoomBook;
import hotel.management.v1.client.book.dto.BookDto.addbook;
import hotel.management.v1.client.book.dto.BookDto.data;
import hotel.management.v1.client.book.dto.BookDto.whtyouname;
import hotel.management.v1.client.book.dto.BookDto;

@Mapper
public interface BookDao {
	
	public List<BookDto.findRoom> findRoomFromAndTo(String from, String to);

	public Integer addBook(addbook ab);
	
	public Integer addRoomBooking(addRoomBook rb);

	public Integer addDinner(data data);

	public Integer addDinnerbook(String username, Integer resno);

	public Integer findByUsernameAndBookdate(String username, String bookdate);

	public Integer findByusername(String name);

	public data findBookdata(whtyouname name);
	




}