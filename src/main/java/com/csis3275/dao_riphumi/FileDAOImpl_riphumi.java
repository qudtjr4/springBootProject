package com.csis3275.dao_riphumi;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.csis3275.model_riphumi.FileMapper_riphumi;
import com.csis3275.model_riphumi.File_riphumi;
import com.csis3275.model_riphumi.Folder_riphumi;

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

	public File_riphumi getFolderById(int id) {
		return jdbcTemplate.queryForObject(SQL_FIND, new Object[] { id }, new FileMapper_riphumi());
	}
	
	public boolean deleteFolder(int id) {
		return jdbcTemplate.update(SQL_DELETE, id) > 0;
	}
	
	public boolean updateFolder(Folder_riphumi folder) {
		return jdbcTemplate.update(SQL_UPDATE, folder.getFatherId(), folder.getName(), folder.getCreateDate()) > 0;
	}
	
	public boolean createFolder(Folder_riphumi folder) {
		return jdbcTemplate.update(SQL_INSERT, folder.getFatherId(), folder.getName(), folder.getCreateDate()) > 0;
	}
	
	public List<File_riphumi> getAllChildren(int folderId) {
		return jdbcTemplate.query(SQL_GET_ALL, new Object[] {folderId}, new FileMapper_riphumi());
	}
}
