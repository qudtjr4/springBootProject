package com.csis3275.model_riphumi;

import java.util.ArrayList;
import java.util.Date;

public class Folder_riphumi {
	private int id;
	private int parentId;
	private String name;
	private Date createDate;
	private ArrayList<Folder_riphumi> folderList;
	private ArrayList<File_riphumi> fileList;
	
	

	public Folder_riphumi() {
		super();
		this.folderList = new ArrayList<Folder_riphumi>();
		this.fileList = new ArrayList<File_riphumi>();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getFatherId() {
		return parentId;
	}

	public void setFatherId(int parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public ArrayList<Folder_riphumi> getFolderList() {
		return folderList;
	}

	public void setFolderList(ArrayList<Folder_riphumi> folderList) {
		this.folderList = folderList;
	}

	public ArrayList<File_riphumi> getFileList() {
		return fileList;
	}

	public void setFileList(ArrayList<File_riphumi> fileList) {
		this.fileList = fileList;
	}

	public void addFolder(Folder_riphumi folder) {
		this.folderList.add(folder);
	}

	public void addFile(File_riphumi file) {
		this.fileList.add(file);
	}

}
