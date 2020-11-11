package com.csis3275.model_riphumi;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;



public class UserMapper_riphumi implements RowMapper<User_riphumi>{

	@Override
	public User_riphumi mapRow(ResultSet rs, int rowNum) throws SQLException {
		User_riphumi user = new User_riphumi();
		user.setId(Integer.parseInt(rs.getString("id")));
		user.setUsername(rs.getString("username"));
		user.setPassword(rs.getString("password"));
		user.setEmail(rs.getString("email"));
		user.setAddress(rs.getString("address"));
		user.setPhoneNum(rs.getString("phoneNum"));
		user.setDateOfBirth(rs.getDate("dateOfBirth"));
		user.setTypeId(Integer.parseInt(rs.getString("typeId")));
		user.setStatus(rs.getBoolean("status"));
		return user;
	}

}
