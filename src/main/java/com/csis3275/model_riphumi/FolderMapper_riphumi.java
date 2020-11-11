package com.csis3275.model_riphumi;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class FolderMapper_riphumi implements RowMapper<Folder_riphumi>{

	@Override
	public Folder_riphumi mapRow(ResultSet rs, int rowNum) throws SQLException {
		Folder_riphumi folder = new Folder_riphumi();
		folder.setId(rs.getInt("id"));
		folder.setFatherId(rs.getInt("parentId"));
		folder.setName(rs.getString("name"));
		folder.setCreateDate(rs.getDate("createDate"));
		return folder;
	}

}
