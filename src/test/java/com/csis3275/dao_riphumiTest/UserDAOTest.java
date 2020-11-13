package com.csis3275.dao_riphumiTest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import java.util.Date;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.csis3275.dao_riphumi.UserDAOImpl_riphumi;
import com.csis3275.model_riphumi.User_riphumi;



@RunWith(SpringRunner.class)
@SpringBootTest()
@AutoConfigureTestDatabase
class UserDAOTest {

	@Autowired
	UserDAOImpl_riphumi dao;
	
	User_riphumi user;
	
	
	@BeforeEach
	void setUp() throws Exception {
		user = new User_riphumi();
		user.setAddress("13 Central Ave,Surrey, BC");
		user.setDateOfBirth(new java.sql.Date(1993/04/20));
		user.setEmail("q@gmail.com");
		user.setPassword("1234");
		user.setPhoneNum("778-877-1111");
		user.setStatus(true);
		user.setTypeId(0);
		user.setUsername("Min");
		user.setId(222);
	}

	@Test
	void userCreateTest() {
		user.setUsername("Minseok");
		assertTrue(dao.createUser(user));
	}
	
	@Test
	void getUsersTest() {
		assertTrue(dao.getAllUsers().size()>0);
	}
	
	@Test
	void userUpdateTest() {
		dao.createUser(user);
		user.setAddress("abc Ave, Burnaby, BC");
		assertTrue(dao.updateUser(user));
	}
	
	@Test
	void userDeleteTest() {
		dao.createUser(user);
		assertTrue(dao.deleteUser(user.getId()));
	}
	

}
