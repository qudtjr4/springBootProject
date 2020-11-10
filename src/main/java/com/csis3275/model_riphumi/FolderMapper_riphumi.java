package com.csis3275.model_riphumi;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class FolderMapper_riphumi implements RowMapper<Folder_riphumi>{

	@Override
	public Folder_riphumi mapRow(ResultSet rs, int rowNum) throws SQLException {
		Folder_riphumi folder = new Folder_riphumi();
		folder.setId(Integer.parseInt(rs.getString("id")));
		folder.setFatherId(Integer.parseInt(rs.getString("parentId")));
		folder.setName(rs.getString("name"));
		folder.setCreateDate(rs.getString("createDate"));
		return folder;
	}

}
