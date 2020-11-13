package com.csis3275.model_riphumi;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;

public class CourseMapper implements RowMapper<Course> {

	@Override
	public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
		Course course = new Course();
		course.setCourseID(rs.getString("courseID"));
		course.setCourseName(rs.getString("courseName"));
		course.setCourseShortName(rs.getString("courseShortName"));
		course.setStartDate(rs.getDate("startDate"));
		course.setEndDate(rs.getDate("endDate"));
		course.setFolderID(rs.getInt("folderID"));
		return course;
	}
	
}
