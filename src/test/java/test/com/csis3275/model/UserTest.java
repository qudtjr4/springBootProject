package test.com.csis3275.model;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Date;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.csis3275.model_riphumi.User_riphumi;

class UserTest {

	User_riphumi user;
	
	@BeforeEach
	void setUp() throws Exception {
	
		user = new User_riphumi();
		user.setAddress("13 Central Ave,Surrey, BC");
		user.setDateOfBirth(new java.sql.Date(1993, 04, 25));
		user.setEmail("q@gmail.com");
		user.setPassword("1234");
		user.setPhoneNum("778-877-1111");
		user.setStatus(true);
		user.setTypeId(0);
		user.setUsername("Min");
		user.setId(100);
	}

	@Test
	void getUserNameTest() {
		assertEquals("Min", user.getUsername());
	}
	
	@Test
	void getDateOfBirthTest() {
		assertEquals(new Date(1993, 04, 25), user.getDateOfBirth());
	}
	@Test
	void getUserEmailTest() {
		assertEquals("q@gmail.com", user.getEmail());
	}
	@Test
	void getUserPasswordTest() {
		assertEquals("1234", user.getPassword());
	}
	@Test
	void getUserPhoneNumTest() {
		assertEquals("778-877-1111", user.getPhoneNum());
	}
	@Test
	void getUserTypeIdTest() {
		assertEquals(0, user.getTypeId());
	}
	
	@Test
	void getUserAddressTest() {
		assertEquals("13 Central Ave,Surrey, BC", user.getAddress());
	}
	@Test
	void userStatusTest() {
		assertTrue(user.isStatus());
	}

}
