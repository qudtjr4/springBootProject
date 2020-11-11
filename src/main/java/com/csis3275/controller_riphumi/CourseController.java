package com.csis3275.controller_riphumi;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
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

import com.csis3275.dao_riphumi.CourseDAOImpl;
import com.csis3275.dao_riphumi.UserDAOImpl_riphumi;
import com.csis3275.model_riphumi.Course;
import com.csis3275.model_riphumi.File_riphumi;
import com.csis3275.model_riphumi.Folder_riphumi;
import com.csis3275.model_riphumi.User_riphumi;

@Controller
public class CourseController {
	@Autowired
	CourseDAOImpl courseDAOImpl;
	
	@Autowired
	UserDAOImpl_riphumi userDAOImpl;
	

	@ModelAttribute("course")
	public Course setupCourse() {
		return new Course();
	}

	@GetMapping("addCourse")
	public String showAddCourseForm(HttpSession session, Model model, HttpServletRequest request) {
		
		HttpSession loginSession = request.getSession();
		if(loginSession.getAttribute("login") == null) {
			return "redirect:/login";
		}else {
			Map<String, Object> loginMap = null; 
			loginMap = new HashMap<>();
			loginMap = (Map<String, Object>) loginSession.getAttribute("login");
			int id = (int) loginMap.get("id");
		}
		
		return "course/addCourse";
	}
	
	@PostMapping("/addCourse")
	public String addCourse(@ModelAttribute("course") Course createdCourse, Model model, HttpServletRequest request) {
		HttpSession loginSession = request.getSession();
		if(loginSession.getAttribute("login") == null) {
			return "redirect:/login";
		}else {
			Map<String, Object> loginMap = null; 
			loginMap = new HashMap<>();
			loginMap = (Map<String, Object>) loginSession.getAttribute("login");
			int id = (int) loginMap.get("id");
			User_riphumi user = userDAOImpl.getUserByID(id);
			
			createdCourse.setCourseID(UUID.randomUUID().toString());
			
			//Create a course folder
			Folder_riphumi courseFolder = new Folder_riphumi();
			courseFolder.setFatherId(0);
			courseFolder.setName(createdCourse.getCourseName());
			courseFolder.setCreateDate(new Date());
			
			courseDAOImpl.insertCourse(createdCourse, user, courseFolder);

			List<Course> courses = courseDAOImpl.getCousesByUser(user);
			model.addAttribute("courses", courses);
			return "mainView";
		}
	}
	
	@GetMapping("course")
	public String course(HttpSession session, Model model, HttpServletRequest request) {
		
		return "course/course";
	}
}
