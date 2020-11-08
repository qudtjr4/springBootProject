package com.csis3275.dao_riphumi;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.csis3275.model_riphumi.Course;
import com.csis3275.model_riphumi.CourseMapper;
import com.csis3275.model_riphumi.LoginDTO;
import com.csis3275.model_riphumi.UserMapper_riphumi;
import com.csis3275.model_riphumi.User_riphumi;
@Component
public class CourseDAOImpl {
	JdbcTemplate jdbcTemplate;
	
	private final String SQL_INSERT_COURSE = "INSERT INTO course(courseID, courseName, courseShortName, startDate, endDate) values(?, ?, ?, ?, ?)";
	private final String SQL_INSERT_COURSE_USER = "INSERT INTO course_user(courseID, username) values(?, ?)";
	private final String SQL_GET_COURSE_BY_ID = "SELECT * FROM course WHERE courseID = ?";
	private final String SQL_GET_COURSES_BY_USER  = "SELECT c.courseID, c.courseName, c.courseShortName, c.startDate, c.endDate "
			+ "FROM course c INNER JOIN course_user cu on c.courseID = cu.courseID WHERE cu.username = ?";

	@Autowired
	public CourseDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<Course> getCousesByUser(User_riphumi user){
		return jdbcTemplate.query(SQL_GET_COURSES_BY_USER, new Object[] { user.getUsername()}, new CourseMapper());
		}

	public boolean insertCourse(Course course, User_riphumi user) {
		boolean insertCourse = jdbcTemplate.update(SQL_INSERT_COURSE, course.getCourseID(), course.getCourseName(), course.getCourseShortName(), course.getStartDate(), course.getEndDate()) > 0;
		boolean insertCourseUser = jdbcTemplate.update(SQL_INSERT_COURSE_USER, course.getCourseID(), user.getUsername()) > 0;
		return insertCourse && insertCourseUser;
	}
}
