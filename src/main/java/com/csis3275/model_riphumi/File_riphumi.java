package com.csis3275.model_riphumi;

import java.util.Date;

public class File_riphumi {

	private int id;
	private int folderId;
	private String location;
	private String name;
	private Date lastUpdate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFolderId() {
		return folderId;
	}
	public void setFolderId(int folderId) {
		this.folderId = folderId;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getLastUpdate() {
		return lastUpdate;
	}
	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
	
	
}
