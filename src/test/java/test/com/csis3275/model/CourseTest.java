package test.com.csis3275.model;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Date;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.csis3275.model_riphumi.Course;


class CourseTest {
	Course csis3275;
	
	@BeforeEach
	void setUp() throws Exception {
		csis3275 = new Course();
		
		csis3275.setCourseID("1");
		csis3275.setCourseName("Software Engineering");
		csis3275.setCourseShortName("CSIS 3275");
		csis3275.setStartDate(new Date(2020, 4, 25));
		csis3275.setEndDate(new Date(2020,12,12));
			
	}
	
	@Test
	void testCourseNameGetter() {
		assertEquals("Software Engineering", csis3275.getCourseName());
		
	}
	
	@Test
	void testCourseShortNameGetter() {
		assertEquals("CSIS 3275", csis3275.getCourseShortName());
	}
	
	@Test
	void testStartDateGetter() {
		assertEquals(new Date(2020, 4, 25), csis3275.getStartDate());
		
	}
	
	@Test
	void testEndDateGetter() {
		assertEquals(new Date(2020,12,12), csis3275.getEndDate());
	}
	
	@Test
	void testOpening() {
		assertTrue(csis3275.isOpening());
	}
}
