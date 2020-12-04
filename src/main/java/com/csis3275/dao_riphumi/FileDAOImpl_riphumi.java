package com.csis3275.dao_riphumi;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import com.csis3275.model_riphumi.FileMapper_riphumi;
import com.csis3275.model_riphumi.File_riphumi;

@Component
public class FileDAOImpl_riphumi {
	JdbcTemplate jdbcTemplate;
	
	private final String SQL_FIND = "SELECT * FROM files WHERE id = ?";
	private final String SQL_DELETE = "DELETE FROM files WHERE id = ?";
	private final String SQL_UPDATE = "UPDATE files set folderId = ?, location = ?, name = ?, createDate = ? WHERE id = ?";
	private final String SQL_INSERT = "insert into files(folderId, location, name, createDate) values(?,?,?,?)";
	private final String SQL_GET_ALL = "SELECT * FROM files WHERE folderId = ?";
	
	@Autowired
	public FileDAOImpl_riphumi(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public File_riphumi getFileById(int id) {
		return jdbcTemplate.queryForObject(SQL_FIND, new Object[] { id }, new FileMapper_riphumi());
	}
	
	public boolean deleteFile(int id) {
		return jdbcTemplate.update(SQL_DELETE, id) > 0;
	}
	
	public boolean updateFile(File_riphumi file) {
		return jdbcTemplate.update(SQL_UPDATE, file.getFolderId(), file.getLocation(), file.getName(), file.getLastUpdate()) > 0;
	}
	
	public int createFile(File_riphumi file) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(
		    new PreparedStatementCreator() {
		        public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
		            PreparedStatement ps =
		                connection.prepareStatement(SQL_INSERT, new String[] {"id"});
		            ps.setLong(1, file.getFolderId());
					ps.setString(2, file.getLocation());
					ps.setString(3, file.getName());
					ps.setDate(4, new java.sql.Date(file.getLastUpdate().getTime()));
		            return ps;
		        }
		    },
		    keyHolder);
		return (int) keyHolder.getKey();
	}
	public List<File_riphumi> getAllChildren(int folderId) {
		return jdbcTemplate.query(SQL_GET_ALL, new Object[] {folderId}, new FileMapper_riphumi());
	}
}
