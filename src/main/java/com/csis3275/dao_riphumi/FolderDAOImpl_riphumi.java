package com.csis3275.dao_riphumi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import com.csis3275.model_riphumi.FolderMapper_riphumi;
import com.csis3275.model_riphumi.Folder_riphumi;

@Component
public class FolderDAOImpl_riphumi {
	JdbcTemplate jdbcTemplate;

	private final String SQL_FIND = "SELECT * FROM folders WHERE id = ?";
	private final String SQL_DELETE = "DELETE FROM folders WHERE id = ?";
	private final String SQL_UPDATE = "UPDATE folders set parentId= ?, name  = ?, createDate = ? WHERE id = ?";
	private final String SQL_INSERT = "insert into folders(parentId, name, createDate) values(?, ?, ?)";
	private final String SQL_GET_ALL = "SELECT * FROM folders WHERE parentId = ?";
	
	
	@Autowired
	public FolderDAOImpl_riphumi(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public Folder_riphumi getFolderById(int id) {
		return jdbcTemplate.queryForObject(SQL_FIND, new Object[] { id }, new FolderMapper_riphumi());
	}
	
	public boolean deleteFolder(int id) {
		return jdbcTemplate.update(SQL_DELETE, id) > 0;
	}
	
	public boolean updateFolder(Folder_riphumi folder) {
		return jdbcTemplate.update(SQL_UPDATE, folder.getFatherId(), folder.getName(), folder.getCreateDate()) > 0;
	}
	
	public boolean createFolder(Folder_riphumi folder) {
		return jdbcTemplate.update(SQL_INSERT, folder.getFatherId(),folder.getName(), folder.getCreateDate()) > 0;
	}
	
	public int insertFolderAndGetKey(Folder_riphumi folder) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(
		    new PreparedStatementCreator() {
		        public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
		            PreparedStatement ps =
		                connection.prepareStatement(SQL_INSERT, new String[] {"id"});
		            ps.setInt(1, folder.getFatherId()); 
		            ps.setString(2, folder.getName());
		            ps.setDate(3, new java.sql.Date(folder.getCreateDate().getTime()));
		            return ps;
		        }
		    },
		    keyHolder);
		System.out.println(keyHolder.getKey());
		return (int) keyHolder.getKey();
	}
	
	public List<Folder_riphumi> getAllChildren(int parentId) {
		return jdbcTemplate.query(SQL_GET_ALL, new Object[] {parentId}, new FolderMapper_riphumi());
	}
	
	public boolean hasChildren(int id) {
		return getAllChildren(id).isEmpty();
	}
	
	public Folder_riphumi getEntireFolder(int id) {
		Folder_riphumi folder = getFolderById(id);
		List<Folder_riphumi> list = getAllChildren(id);
		if (!list.isEmpty()) {
			for (Folder_riphumi child : list) {
				folder.addFolder(getEntireFolder(child.getId()));
			}
		}
		return folder;
	}
}
