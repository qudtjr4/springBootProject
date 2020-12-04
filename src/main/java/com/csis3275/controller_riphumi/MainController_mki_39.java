package com.csis3275.controller_riphumi;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.csis3275.dao_riphumi.CourseDAOImpl;
import com.csis3275.dao_riphumi.UserDAOImpl_riphumi;
import com.csis3275.model_riphumi.Course;
import com.csis3275.model_riphumi.LoginDTO;
import org.springframework.web.multipart.MultipartFile;

import com.csis3275.dao_riphumi.FolderDAOImpl_riphumi;
import com.csis3275.model_riphumi.File_riphumi;
import com.csis3275.model_riphumi.Folder_riphumi;
import com.csis3275.model_riphumi.User_riphumi;

@Controller
@RequestMapping("/")
public class MainController_mki_39 {
	@Autowired
	UserDAOImpl_riphumi userDaoImpl;
	@Autowired
	CourseDAOImpl courseDAOImpl;
	@Autowired
	FolderDAOImpl_riphumi folderDaoImpl;
	
	private Folder_riphumi root;
	private int currentFolderId;
	public HashMap<Integer, String> path;
	
//	@Resource(name = "files")
//	private String files; 
	

	@ModelAttribute("user")
	public User_riphumi setupLoginForm() {
		return new User_riphumi();
	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String mainView(HttpSession session, Model model, HttpServletRequest request) {

		HttpSession loginSession = request.getSession();
		if (loginSession.getAttribute("login") == null) {
			return "redirect:/login";
		} else {
			Map<String, Object> loginMap = null;
			loginMap = new HashMap<>();
			loginMap = (Map<String, Object>) loginSession.getAttribute("login");
			int id = (int) loginMap.get("id");
			User_riphumi user = userDaoImpl.getUserByID(id);

			List<Course> courses = courseDAOImpl.getCousesByUser(user);

			model.addAttribute("courses", courses);
			return "mainView";
		}
	}

	@GetMapping("editProfile")
	public String showEditUser(HttpSession session, Model model, HttpServletRequest request) {

		HttpSession loginSession = request.getSession();
		if (loginSession.getAttribute("login") == null) {
			return "redirect:/login";
		} else {
			Map<String, Object> loginMap = null;
			loginMap = new HashMap<>();
			loginMap = (Map<String, Object>) loginSession.getAttribute("login");
			int id = (int) loginMap.get("id");

			System.out.println(id + "idididididididdidididi");
			User_riphumi user = userDaoImpl.getUserByID(id);
			model.addAttribute("user", user);
		}

		return "editPage";
	}

	@PostMapping("editProfile")
	public String editUser(@ModelAttribute("user") User_riphumi editedUser, Model model) {
		if (userDaoImpl.updateUser(editedUser)) {
			model.addAttribute("message", "Your user was updated!");
		} else {
			model.addAttribute("message", "Your user was updated!");
		}

		return "redirect:/";
	}

	@GetMapping("fileExplorer")
	public String fileExplorer(@RequestParam("id") int id, Model model) {
		Folder_riphumi tree = folderDaoImpl.getEntireFolder(id);
		if (tree.getParentId() == 0) {
			root = tree;
		}
		currentFolderId = id;
		model.addAttribute("folders", tree);
		model.addAttribute("file", new File_riphumi());
		model.addAttribute("path", findPath(root, currentFolderId));
		return "fileExplorer";
	}
	
	@GetMapping("findFolder")
	public ResponseEntity<Folder_riphumi> getCurrentFolder(@RequestParam("id") int id, Model model){
		Folder_riphumi tree = folderDaoImpl.getEntireFolder(id);
		model.addAttribute("folders", tree);
		model.addAttribute("file", new File_riphumi());
		model.addAttribute("path", findPath(root, currentFolderId));
//		ObjectMapper mapper = new ObjectMapper();
//		String json = mapper.writeValueAsString(tree);
		return new ResponseEntity<Folder_riphumi>(tree, HttpStatus.OK);
	}
	
	@SuppressWarnings("null")
	public Map<Integer, String> findPath(Folder_riphumi folder, int id){
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
	public Folder_riphumi addFolder(@RequestBody Folder_riphumi folder, Model model, HttpServletRequest request) {
		folder.setCreateDate(Calendar.getInstance().getTime());
		folderDaoImpl.createFolder(folder);
		Folder_riphumi father = folderDaoImpl.getEntireFolder(currentFolderId);
		root = folderDaoImpl.getEntireFolder(root.getId());
		model.addAttribute("folders", father);
		model.addAttribute("file", new File_riphumi());
		return father;
	}
	
	@PostMapping("fileExplorer/AddFile")
	public String addFile(@ModelAttribute("file") File_riphumi file,Model model,@RequestParam(value="file1", required = false) MultipartFile mf) {
//		folder.setCreateDate(format.format(Calendar.getInstance().getTime()));
//		folderDaoImpl.createFolder(folder);
		Folder_riphumi father = folderDaoImpl.getEntireFolder(currentFolderId);
	
		try {
			String savedName = uploadFile(mf);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//model.addAttribute("savedName", savedName);
		
		model.addAttribute("folders", father);
		
		return "fileExplorer";
	}
	private String uploadFile(MultipartFile mf) 
			throws Exception {
		UUID uuid = UUID.randomUUID();
		String savedName = uuid.toString() + "_" + mf.getOriginalFilename();
		
		String path = "src/main/resources/files/"+root.getId()+"_"+root.getName();
		
		Path p = Paths.get(path);
		File target  = new File(path);
		target.setReadable(true);
		target.setWritable(true);
		
		
		if (target.getAbsoluteFile().exists()) {
			//Provided by Springz
			mf.transferTo(target);
//			FileCopyUtils.copy(fileData, target);
		}else {
			target.mkdir();
			mf.transferTo(target);
			//Provided by Springz
//			FileCopyUtils.copy(fileData, target);
		}
		
		
		
		return savedName;
	}
	
	
	
	@PostMapping("changePassword")
	public String changePassword(@RequestParam("newPassword") String password,
			@RequestParam("oldPassword") String oldPassword,
			@RequestParam("username") String username,Model model) {
		
		LoginDTO check = new LoginDTO();
		check.setUsername(username);
		check.setPassword(oldPassword);
		
		if(userDaoImpl.login(check) != null) {
			userDaoImpl.setPassword(password, username);
			model.addAttribute("message", "Your password was changed!");
			return "redirect:/login/logout";
		}else {
			model.addAttribute("message", "Your present password is not correct!");
			return "redirect:/editProfile";
		}

		
	}

}