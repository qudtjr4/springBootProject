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
import com.csis3275.model_riphumi.FolderMapper_riphumi;
import com.csis3275.model_riphumi.Folder_riphumi;
import com.csis3275.model_riphumi.LoginDTO;
import com.csis3275.model_riphumi.UserMapper_riphumi;
import com.csis3275.model_riphumi.User_riphumi;
@Component
public class CourseDAOImpl {
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	FolderDAOImpl_riphumi folderDAOImpl;
	
	private final String SQL_INSERT_COURSE = "INSERT INTO course(courseID, courseName, courseShortName, startDate, endDate, folderID) values(?, ?, ?, ?, ?, ?)";
	private final String SQL_INSERT_COURSE_USER = "INSERT INTO course_user(courseID, username) values(?, ?)";
	private final String SQL_GET_COURSE_BY_ID = "SELECT * FROM course WHERE courseID = ?";
	private final String SQL_GET_STUDENT_BY_COURSE = "SELECT * FROM users u INNER JOIN course_user c ON u.username = c.username WHERE u.typeId = 1 AND c.courseId = ?";
	private final String SQL_GET_COURSES_BY_USER  = "SELECT c.courseID, c.courseName, c.courseShortName, c.startDate, c.endDate, c.folderID "
			+ "FROM course c INNER JOIN course_user cu on c.courseID = cu.courseID WHERE cu.username = ?";
	private final String SQL_GET_ALL_STUDENT = "SELECT * FROM users WHERE typeId = 1";

	@Autowired
	public CourseDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<Course> getCousesByUser(User_riphumi user){
		return jdbcTemplate.query(SQL_GET_COURSES_BY_USER, new Object[] { user.getUsername()}, new CourseMapper());
		}
	

	public boolean insertCourse(Course course, User_riphumi user, Folder_riphumi folder) {
		int folderID = folderDAOImpl.insertFolderAndGetKey(folder);
		boolean insertCourse = jdbcTemplate.update(SQL_INSERT_COURSE, course.getCourseID(), course.getCourseName(), course.getCourseShortName(), course.getStartDate(), course.getEndDate(), folderID) > 0;
		boolean insertCourseUser = jdbcTemplate.update(SQL_INSERT_COURSE_USER, course.getCourseID(), user.getUsername()) > 0;
		
		return insertCourse && insertCourseUser;
	}
	
	public List<User_riphumi> getAllStudents(){
		return jdbcTemplate.query(SQL_GET_ALL_STUDENT, new UserMapper_riphumi());
	}
	
	public boolean insertStudentToCourse(int courseId, String username) {
		return jdbcTemplate.update(SQL_INSERT_COURSE_USER, courseId, username) > 0;
	}
	
	public boolean insertStudent(Course course, User_riphumi user) {
		return jdbcTemplate.update(SQL_INSERT_COURSE_USER, course.getCourseID(), user.getUsername()) > 0;
	}
	
	
	public List<User_riphumi> getStudentsByCourse(int courseId){
		return jdbcTemplate.query(SQL_GET_STUDENT_BY_COURSE, new Object[] { courseId }, new UserMapper_riphumi());
		
		
	}
}
