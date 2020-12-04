package com.csis3275.controller_riphumi;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.http.HttpHeaders;
import java.nio.file.FileStore;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.csis3275.dao_riphumi.FileDAOImpl_riphumi;
import com.csis3275.dao_riphumi.FolderDAOImpl_riphumi;
import com.csis3275.model_riphumi.File_riphumi;
import com.csis3275.model_riphumi.Folder_riphumi;

@Controller
@RequestMapping("/")
public class FileExplorerController {
	@Autowired
	FolderDAOImpl_riphumi folderDaoImpl;

	@Autowired
	FileDAOImpl_riphumi fileDaoImpl;

	private Folder_riphumi root;
	private int currentFolderId;
	public HashMap<Integer, String> path;
	public Date currentDate = Calendar.getInstance().getTime();

	@GetMapping("fileExplorer")
	public String fileExplorer(@RequestParam("id") int id, Model model, HttpServletRequest request) {
		HttpSession loginSession = request.getSession();
		if (loginSession.getAttribute("login") == null) {
			return "redirect:/login";
		} else {
			Map<String, Object> loginMap = null;
			loginMap = new HashMap<>();
			loginMap = (Map<String, Object>) loginSession.getAttribute("login");
			int idUser = (int) loginMap.get("id");
		}

		Folder_riphumi tree = folderDaoImpl.getEntireFolder(id);
		if (tree.getParentId() == 0) {
			root = tree;
		}
		currentFolderId = id;
		model.addAttribute("folders", tree);
		model.addAttribute("file", new File_riphumi());
		model.addAttribute("path", findPath(root, currentFolderId));
		return "fileExplorer/fileExplorer";
	}

	@GetMapping("findFolder")
	public ResponseEntity<Folder_riphumi> getCurrentFolder(@RequestParam("id") int id, Model model) {
		Folder_riphumi tree = folderDaoImpl.getEntireFolder(id);
		model.addAttribute("folders", tree);
		model.addAttribute("file", new File_riphumi());
		model.addAttribute("path", findPath(root, currentFolderId));
//		ObjectMapper mapper = new ObjectMapper();
//		String json = mapper.writeValueAsString(tree);
		return new ResponseEntity<Folder_riphumi>(tree, HttpStatus.OK);
	}

	@SuppressWarnings("null")
	public Map<Integer, String> findPath(Folder_riphumi folder, int id) {
		Map<Integer, String> temp = new HashMap<Integer, String>();
		if (folder.getId() == id) {
			temp.put(folder.getId(), folder.getName());
			return temp;
		}

		if (!folder.getFolderList().isEmpty()) {
			for (Folder_riphumi f : folder.getFolderList()) {
				if (f.getId() != id) {
					Map<Integer, String> temp2 = new HashMap<Integer, String>();
					temp2 = findPath(f, id);
					if (!temp2.isEmpty()) {
						temp.put(folder.getId(), folder.getName());
						temp.putAll(temp2);
					}
				} else {
					temp.put(f.getId(), f.getName());
					temp.put(folder.getId(), folder.getName());
				}
			}
		}
		return temp;
	}

	@PostMapping("fileExplorer")
	public @ResponseBody Folder_riphumi addFolder(@RequestBody Folder_riphumi folder, Model model,
			HttpServletRequest request) {
		folder.setCreateDate(currentDate);
		folderDaoImpl.createFolder(folder);
		Folder_riphumi father = folderDaoImpl.getEntireFolder(currentFolderId);
		root = folderDaoImpl.getEntireFolder(root.getId());
		return folder;
	}

	@PostMapping("fileExplorer/AddFile")
	public ResponseEntity<String> addFile(@RequestParam("file") MultipartFile file, Model model,
			HttpServletRequest request) {

		// Create the forlder name, according to the Id and name of the folder.
		String path = request.getServletContext().getRealPath("files/" + root.getId() + "_" + root.getName());
		try {
			uploadFile(file, path); // call function to create file
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return new ResponseEntity<String>(path, HttpStatus.OK);
	}

	private void uploadFile(MultipartFile mf, String path) throws Exception {
		// Create a random ID, and create a new name for the file
		UUID uuid = UUID.randomUUID();
		String savedName = uuid.toString() + "_" + mf.getOriginalFilename();

		//
		Path fileString = Paths.get(path);
		File target = new File(fileString.toString(), savedName);
		target.setReadable(true);
		target.setWritable(true);

		File_riphumi newFile = new File_riphumi();
		newFile.setFolderId(currentFolderId);
		newFile.setName(mf.getOriginalFilename());
		newFile.setLocation(target.getAbsolutePath());
		newFile.setLastUpdate(currentDate);

		fileDaoImpl.createFile(newFile);

		if (!target.getParentFile().exists()) {
			target.getParentFile().mkdir();
		}
//		

		mf.transferTo(target);
	}

	@GetMapping("downloadFile")
	@ResponseBody
	public ResponseEntity<byte[]> downloadFile(@RequestParam int id, HttpServletRequest reques) throws Exception {
		File_riphumi fileInfo = fileDaoImpl.getFileById(id);
		byte[] fileBytes = null;
		try {
			fileBytes = Files.readAllBytes(Paths.get(fileInfo.getLocation()));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return ResponseEntity.ok().contentType(MediaType.APPLICATION_OCTET_STREAM).header(
				org.springframework.http.HttpHeaders.CONTENT_DISPOSITION,
				"attachement; filename = \"" + fileInfo.getName() + "\"").body(fileBytes);
	}
	
	@GetMapping("deleteFile")
	public ResponseEntity<String> deleteFile(@RequestParam("id") int id, Model model) {
		File_riphumi file = fileDaoImpl.getFileById(id);
		String success = "";
		try {
			fileDaoImpl.deleteFile(id);
			File fileDelete = Paths.get(file.getLocation()).toFile();
			fileDelete.delete();
			success = file.getName();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return new ResponseEntity<String>(success, HttpStatus.OK);
	}
	
	@GetMapping("deleteFolder")
	public ResponseEntity<Boolean> deleteFolder(@RequestParam("id") int id, Model model) {
		File_riphumi file = fileDaoImpl.getFileById(id);
		boolean success= false;
		try {
			fileDaoImpl.deleteFile(id);
			File fileDelete = Paths.get(file.getLocation()).toFile();
			success = fileDelete.delete();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return new ResponseEntity<Boolean>(success, HttpStatus.OK);
	}


}
