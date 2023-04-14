package hotel.management.v1.member.dto;

import hotel.management.v1.member.entity.Level;
import hotel.management.v1.member.entity.Member;
import hotel.management.v1.member.entity.Role;
import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access=AccessLevel.PRIVATE)
public class MemberDto {
	
	@Data
	public static class Join {
		private String username;
		private String name;
		private String tel;
		private String password;
		private String email;
		private String personalId;
		
		public Member toEntity() {
			return Member.builder().username(username).name(name).tel(tel)
					.password(password).email(email).personalId(personalId)
					.userLevel(Level.BRONZE).role(Role.USER)
					.build();
		}
	}
}
