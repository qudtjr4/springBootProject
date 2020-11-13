package com.csis3275.dao_riphumiTest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.csis3275.dao_riphumi.CourseDAOImpl;
import com.csis3275.dao_riphumi.UserDAOImpl_riphumi;
import com.csis3275.model_riphumi.Course;
import com.csis3275.model_riphumi.Folder_riphumi;
import com.csis3275.model_riphumi.User_riphumi;
import com.google.gson.annotations.Until;

@RunWith(SpringRunner.class)
@SpringBootTest()
@AutoConfigureTestDatabase
class CourseDAOImplTest {
	@Autowired
	CourseDAOImpl courseDaoImpl;
	@Autowired
	UserDAOImpl_riphumi userDaoImpl;
	Course csis3275;
	User_riphumi instructor;
	Folder_riphumi courseFolder;
	
	@BeforeEach
	void setUp() throws Exception {
		csis3275 = new Course();
		
		csis3275.setCourseID(UUID.randomUUID().toString());
		csis3275.setCourseName("Software Engineering");
		csis3275.setCourseShortName("CSIS 3275");
		csis3275.setStartDate(new Date(2020, 4, 25));
		csis3275.setEndDate(new Date(2020,12,12));
		
		instructor = new User_riphumi();
		instructor.setUsername("instructor");
		instructor.setPassword("123");
		instructor.setEmail("abc@gmail.com");
		instructor.setAddress("Vancouver");
		instructor.setPhoneNum("01326565");
		instructor.setDateOfBirth(new java.sql.Date(Calendar.getInstance().getTime().getTime()));
		instructor.setTypeId(0);
		instructor.setStatus(true);
		
		courseFolder = new Folder_riphumi();
		courseFolder.setParentId(0);
		courseFolder.setName("Software Engineering");
		courseFolder.setCreateDate(new Date());
	}
	
	@Test
	void testInsertUser() {
		assertTrue(userDaoImpl.createUser(instructor));
	}
	
	@Test
	void testInsertCourseAndFolder() {
		assertTrue(courseDaoImpl.insertCourse(csis3275, instructor, courseFolder));
	}
	
	@Test
	void getCourseByUser() {
		assertThat(courseDaoImpl.getCousesByUser(instructor).size()>0);
	}

}
