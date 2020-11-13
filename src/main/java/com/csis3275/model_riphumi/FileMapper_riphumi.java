package com.csis3275.model_riphumi;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class FileMapper_riphumi implements RowMapper<File_riphumi>{

	@Override
	public File_riphumi mapRow(ResultSet rs, int rowNum) throws SQLException {
		File_riphumi file = new File_riphumi();
		file.setId(Integer.parseInt(rs.getString("id")));
		file.setFolderId(Integer.parseInt(rs.getString("folderId")));
		file.setLocation(rs.getString("location"));
		file.setName(rs.getString("name"));
		file.setLastUpdate(rs.getDate("createDate"));
		return null;
	}

}
