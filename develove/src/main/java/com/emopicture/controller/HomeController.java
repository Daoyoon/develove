package com.emopicture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
   
   @RequestMapping(value="/", method=RequestMethod.GET)
   public String home(){
      System.out.println("server on live.........");
      return "home";
   }
   
   
   @RequestMapping(value="/register", method=RequestMethod.GET)
   public String register(){
	   return "register";
   }
   
   @RequestMapping(value="/notice", method=RequestMethod.GET)
   public String notice(){
	   return "notice";
   }
   

   
   @RequestMapping(value="/qna", method=RequestMethod.GET)
   public String qna(){
	   return "qna";
   }
}