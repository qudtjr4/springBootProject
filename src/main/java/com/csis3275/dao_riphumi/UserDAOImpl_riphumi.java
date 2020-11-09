package com.csis3275.dao_riphumi;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.csis3275.model_riphumi.LoginDTO;
import com.csis3275.model_riphumi.UserMapper_riphumi;
import com.csis3275.model_riphumi.User_riphumi;

@Component
public class UserDAOImpl_riphumi {
	
	JdbcTemplate jdbcTemplate;

	private final String SQL_FIND = "SELECT * FROM users WHERE id = ?";
	private final String SQL_GET_USER = "SELECT * FROM users WHERE username = ? and password = ?";
	private final String SQL_DELETE = "DELETE FROM users WHERE id = ?";
	private final String SQL_UPDATE = "UPDATE users set username= ?, email = ?, address = ?, phoneNum = ?, dateOfBirth = ?, typeId = ? WHERE id = ?";
	private final String SQL_INSERT = "insert into users(id, username, password, email, address, phoneNum, dateOfBirth, typeId, status) values(?,?,?,?,?,?,?,?,?)";
	private final String SQL_GET_ALL = "SELECT * FROM users";
	private final String SQL_UPDATE_PASSWORD = "UPDATE Users SET password = ? WHERE username = ?";
	private final String SQL_GET_USERS_STATUS_FALSE = "SELECT * FROM users WHERE status = false";
	private final String SQL_UPDATE_STATUS = "UPDATE users set status = true WHERE id = ?";
	
	@Autowired
	public UserDAOImpl_riphumi(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public User_riphumi getUserByUsername(String username) {
		return jdbcTemplate.queryForObject(SQL_FIND, new Object[] { username }, new UserMapper_riphumi());
	}
	
	public User_riphumi getUserByID(int id) {
		return jdbcTemplate.queryForObject(SQL_FIND, new Object[] { id }, new UserMapper_riphumi());
	}


	public boolean deleteUser(int id) {
		return jdbcTemplate.update(SQL_DELETE, id) > 0;
	}

	public boolean updateUser(User_riphumi user) {
		return jdbcTemplate.update(SQL_UPDATE, user.getUsername(), user.getEmail(), user.getAddress(), user.getPhoneNum(), user.getDateOfBirth(), user.getTypeId(), user.getId()) > 0;
	}

	public boolean createUser(User_riphumi user) {
		return jdbcTemplate.update(SQL_INSERT, user.getId(), user.getUsername(), user.getPassword(), user.getEmail(), user.getAddress(), user.getPhoneNum(), user.getDateOfBirth(), user.getTypeId(), user.isStatus()) > 0;
	}
	
	public List<User_riphumi> getAllUsers() {
		return jdbcTemplate.query(SQL_GET_ALL, new UserMapper_riphumi());
	}
	
	public boolean isAvailable(User_riphumi enteredUser) {
		List<User_riphumi> users = getAllUsers();
		for (User_riphumi user : users) {
			if (user.getUsername().equals(enteredUser.getUsername()))
				return false;
		}
		return true;
	}
	
	public User_riphumi login(LoginDTO enteredUser) {
		
		try {
			User_riphumi user = jdbcTemplate.queryForObject(SQL_GET_USER,new Object[] { enteredUser.getUsername(),enteredUser.getPassword() }  , new UserMapper_riphumi());
			return user;
		}catch(EmptyResultDataAccessException e) {
			return null;
		}
		
		
	}
	
	public boolean checkUser(String id, String email) {
		String SQL_CHECK_USER = "SELECT * FROM Users WHERE username = '"+id+"' and email = '"+email+"'";
		return jdbcTemplate.query(SQL_CHECK_USER, new UserMapper_riphumi()).size() > 0;
	}
	
	public boolean setPassword(String tempPassword, String id) {
		return jdbcTemplate.update(SQL_UPDATE_PASSWORD, tempPassword , id) > 0;
	}
	
	public List<User_riphumi> getUsers_status() {
		return jdbcTemplate.query(SQL_GET_USERS_STATUS_FALSE, new UserMapper_riphumi());
	}

	public boolean updateStatus(int id) {
		return jdbcTemplate.update(SQL_UPDATE_STATUS, id) > 0;
	}
}
