package com.csis3275.controller_riphumi;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csis3275.dao_riphumi.UserDAOImpl_riphumi;
import com.csis3275.model_riphumi.LoginDTO;
import com.csis3275.model_riphumi.User_riphumi;
import com.csis3275.service_riphumi.MailService;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	UserDAOImpl_riphumi userDaoImpl;
	@Autowired
	MailService mailService;

	User_riphumi currentUser;


	// Thats a GET request from the browser to the URL below
	@GetMapping("")
	public String showLoginPage(HttpSession session, Model model,HttpServletRequest request) {
		model.addAttribute("loginDTO",new LoginDTO());
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			 for (Cookie cookie : cookies) {
			   if (cookie.getName().equals("username")) {
			     model.addAttribute("username", cookie.getValue());
			    }
			  }
			}
		return "login/loginPage";
	}

	@PostMapping("")
	public String login(@ModelAttribute("loginDTO") LoginDTO userLogin, Model model,HttpServletRequest request,HttpServletResponse response,RedirectAttributes rttr) {
		Map<String, Object> loginMap = null; 
		loginMap = new HashMap<>();
		HttpSession loginSession = request.getSession();
		Cookie[] cookies = request.getCookies();
		
		
		
		System.out.println(userLogin.getUsername()+":"+userLogin.getRemember());
		
		User_riphumi user = userDaoImpl.login(userLogin);
		if (user != null && user.isStatus()) {
			String username = user.getUsername();
			
			loginMap.put("id", user.getId());
			loginSession.setAttribute("login", loginMap);
			System.out.println(loginSession.getAttribute("login"));
			
			if (userLogin.getRemember().equals("remember")) {
				Cookie cookie1 = new Cookie("username",String.valueOf(username));
				cookie1.setMaxAge(60 * 60 * 24 * 7);
				cookie1.setPath("/");
				response.addCookie(cookie1);
			}
			return "redirect:/";
			
		}else {
			if (cookies != null) {
				 for (Cookie cookie : cookies) {
				   if (cookie.getName().equals("username")) {
				     model.addAttribute("username", cookie.getValue());
				    }
				  }
				}
			model.addAttribute("loginDTO",new LoginDTO());
			if(user == null) {
				model.addAttribute("message", "Invalid username or password, please try again");
			}else if(!user.isStatus()) {
				model.addAttribute("message", "You are not allowed to enter MOSS, Pleas wait to confirm");
			}
			
			return "login/loginPage";
		}
	}

	@GetMapping("/register")
	public String showRegisterPage(HttpSession session, Model model) {
		User_riphumi user = new User_riphumi();
		model.addAttribute("user", user);
		return "login/registerPage";
	}

	@PostMapping("/register")
	public String createUser(@ModelAttribute("user") User_riphumi createdUser, Model model) {

		if (!userDaoImpl.isAvailable(createdUser)) {
			model.addAttribute("message", "Username is already taken, please enter another username!");
			return "login/registerPage";
		}

		userDaoImpl.createUser(createdUser);
		model.addAttribute("message", "Register Successful! Now you can log in");
		return "redirect:/login";
	}

	@RequestMapping(value = "/findPassword", method = RequestMethod.GET)
	public String showFindPassword(HttpSession session, Model model) {

		return "login/findPasswordPage";
	}

	@RequestMapping(value = "/findPassword", method = RequestMethod.POST)
	public String findPassword(@RequestParam("id") String id, @RequestParam("email") String email, Model model
			) throws Exception {

		if (userDaoImpl.checkUser(id, email) == true) {

			String tempPassword = mailService.sendPassword(id, email);
			userDaoImpl.setPassword(tempPassword, id);
			model.addAttribute("message", "Please,check your email");
			return "redirect:/login";
		} else {
			model.addAttribute("message", "We cannot find a matched username and email");
			return "login/findPasswordPage";
		}
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model,HttpServletRequest request) {
		HttpSession loginSession = request.getSession();
		
		loginSession.invalidate();
		
		return "redirect:/login";
	}

}
