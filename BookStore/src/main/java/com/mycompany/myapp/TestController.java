package com.mycompany.myapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


	//Handles requests for the application home page.
 
@Controller
public class TestController {
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	
	//Simply selects the home view to render by returning its name.
	 
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );

//		return "/test_directory/blog";
		return "/test_directory/home";
//		return "blog";
//		return "home";
	}
	
}
