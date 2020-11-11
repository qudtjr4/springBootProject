package com.csis3275.controller_riphumi;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Dictionary;
import java.util.HashMap;
import java.util.List;
import java.util.Hashtable;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.csis3275.dao_riphumi.CourseDAOImpl;
import com.csis3275.dao_riphumi.UserDAOImpl_riphumi;
import com.csis3275.model_riphumi.Course;
import com.csis3275.model_riphumi.LoginDTO;
import org.springframework.web.multipart.MultipartFile;

import com.csis3275.dao_riphumi.FolderDAOImpl_riphumi;
import com.csis3275.dao_riphumi.UserDAOImpl_riphumi;
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
		Folder_riphumi tree = new Folder_riphumi();
		if (root == null) {
			root = folderDaoImpl.getEntireFolder(id);
			tree = root;
			currentFolderId = id;
		} else {
			tree = folderDaoImpl.getEntireFolder(id);
			currentFolderId = id;
		}
		model.addAttribute("folders", tree);
		model.addAttribute("file", new File_riphumi());
		return "fileExplorer";
	}

	@PostMapping("fileExplorer")
	public String addFolder(@ModelAttribute("folders") Folder_riphumi folder, Model model) {
		folder.setCreateDate(Calendar.getInstance().getTime());
		folderDaoImpl.createFolder(folder);
		Folder_riphumi father = folderDaoImpl.getEntireFolder(currentFolderId);
		model.addAttribute("folders", father);
		return "fileExplorer";
	}
	
//	@PostMapping("fileExplorer/AddFile")
//	public String addFile(@ModelAttribute("file") File_riphumi file, @ModelAttribute("location") MultipartFile location,Model model) {
////		folder.setCreateDate(format.format(Calendar.getInstance().getTime()));
////		folderDaoImpl.createFolder(folder);
//		Folder_riphumi father = folderDaoImpl.getEntireFolder(currentFolderId);
//		model.addAttribute("folders", father);
//		return "fileExplorer";
//	}
	
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