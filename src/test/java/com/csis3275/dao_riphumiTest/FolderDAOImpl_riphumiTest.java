package com.csis3275.dao_riphumiTest;


import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Calendar;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.csis3275.dao_riphumi.FolderDAOImpl_riphumi;
import com.csis3275.model_riphumi.File_riphumi;
import com.csis3275.model_riphumi.Folder_riphumi;

@RunWith(SpringRunner.class)
@SpringBootTest()
@AutoConfigureTestDatabase
class FolderDAOImpl_riphumiTest {
	@Autowired
	FolderDAOImpl_riphumi dao;
	
	Folder_riphumi folder;
	int id;
	
	@BeforeEach
	void setUp() throws Exception {
		id = 1;
		folder = new Folder_riphumi();
		folder.setId(id);
		folder.setName("Software Engineering");
		folder.setParentId(0);
		folder.setCreateDate(Calendar.getInstance().getTime());
		
		ArrayList<Folder_riphumi> folderList = new ArrayList<Folder_riphumi>();
		Folder_riphumi folder1 = new Folder_riphumi();
		folder1.setName("Content");
		folder1.setParentId(0);
		Folder_riphumi folder2 = new Folder_riphumi();
		folder2.setName("Assinments");
		folder2.setParentId(0);
		Folder_riphumi folder3 = new Folder_riphumi();
		folder3.setName("Lectures");
		folder3.setParentId(0);
		folderList.add(folder1);
		folderList.add(folder2);
		folderList.add(folder3);
		folder.setFolderList(folderList);
		
		ArrayList<File_riphumi> fileList = new ArrayList<File_riphumi>();
		File_riphumi file1 = new File_riphumi();
		File_riphumi file2 = new File_riphumi();
		File_riphumi file3 = new File_riphumi();
		fileList.add(file1);
		fileList.add(file2);
		fileList.add(file3);
		folder.setFileList(fileList);
		dao.getFolderById(id);
	}

	@Test
	void getFoldeByIDTest() {
		assertThat(dao.getFolderById(id));
	}
	
	@Test
	void createFolderAndGetIdTest() {
		assertThat(dao.insertFolderAndGetKey(folder));
	}
	

	@Test
	void updateFolderTest() {
		folder.setName("CSIS-3275 Software Engineering");
		folder.setCreateDate(Calendar.getInstance().getTime());
		assertThat(dao.getFolderById(id));
	}
	
	@Test 
	void getAllChildrenTest() {
		assertThat(dao.getAllChildren(id).size()>0);
	}
	
	@Test
	void getEntireFolderTest() {
		assertThat(dao.getEntireFolder(id));
	}
	
	@Test
	void deleteFolderTest() {
		assertTrue(dao.deleteFolder(id));
	}

}
