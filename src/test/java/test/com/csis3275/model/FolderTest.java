package test.com.csis3275.model;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.csis3275.model_riphumi.File_riphumi;
import com.csis3275.model_riphumi.Folder_riphumi;

class FolderTest {
	Folder_riphumi folder;
	
	@BeforeEach
	void setUp() throws Exception {
		folder = new Folder_riphumi();
		
		folder.setId(14);
		folder.setName("Software Engineering");
		folder.setParentId(0);
		
		ArrayList<Folder_riphumi> folderList = new ArrayList<Folder_riphumi>();
		Folder_riphumi folder1 = new Folder_riphumi();
		Folder_riphumi folder2 = new Folder_riphumi();
		Folder_riphumi folder3 = new Folder_riphumi();
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
		
	}

	@Test
	void getFolerIDTest() {
		assertEquals(14, folder.getId());
	}
	
	@Test
	void getFolderNameTest() {
		assertEquals("Software Engineering", folder.getName());
	}
	
	@Test
	void getParentIdTest() {
		assertEquals(0, folder.getParentId());
	}
	
	@Test
	void getFolderListTest() {
		assertTrue(!folder.getFolderList().isEmpty());
	}
	
	@Test
	void getFileListTest() {
		assertTrue(!folder.getFileList().isEmpty());
	}

}
