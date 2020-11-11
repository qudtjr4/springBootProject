package com.csis3275.controller_riphumi;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.csis3275.dao_riphumi.UserDAOImpl_riphumi;
import com.csis3275.model_riphumi.LoginDTO;
import com.csis3275.model_riphumi.User_riphumi;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	UserDAOImpl_riphumi userDaoImpl;
	
	@GetMapping("")
	public String adminPage(Model model) {
		
		List<User_riphumi> users = userDaoImpl.getUsers_status();
		List<User_riphumi> instructors = new ArrayList<User_riphumi>();
		List<User_riphumi> students = new ArrayList<User_riphumi>();
		for(int i = 0; i < users.size(); i ++){
			switch (users.get(i).getTypeId()) {
			case 0:
				instructors.add(users.get(i));
				break;
			case 1:
				students.add(users.get(i));
				break;
			default:
				break;
			}
		}
		model.addAttribute("instructors", instructors);
		model.addAttribute("students", students);
		
		return "admin/adminPage";
	}
	@GetMapping("/acceptPermission")
	public String acceptPermission(@RequestParam(name = "id") int id, Model model) {
		
		if(userDaoImpl.updateStatus(id)) {
			model.addAttribute("message", "Success");
		};
		
		return "redirect:/admin";
	} 
}
