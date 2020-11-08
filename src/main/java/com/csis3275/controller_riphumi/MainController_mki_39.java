package com.csis3275.controller_riphumi;

import java.util.HashMap;
import java.util.List;
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

import com.csis3275.dao_riphumi.CourseDAOImpl;
import com.csis3275.dao_riphumi.UserDAOImpl_riphumi;
import com.csis3275.model_riphumi.Course;
import com.csis3275.model_riphumi.User_riphumi;

@Controller
@RequestMapping("/")
public class MainController_mki_39 {
	@Autowired
	UserDAOImpl_riphumi userDaoImpl;
	@Autowired
	CourseDAOImpl courseDAOImpl;
	User_riphumi currentUser; // this is temporal until we add session

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
		currentUser = editedUser;
		if (userDaoImpl.updateUser(editedUser)) {
			model.addAttribute("message", "Your user was updated!");
		} else {
			model.addAttribute("message", "Your user was updated!");
		}

		return "redirect:/";
	}

}