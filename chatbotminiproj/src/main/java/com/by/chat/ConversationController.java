package com.by.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ConversationController {

	@RequestMapping("/")
	public String chatbot() {
		return "chatbot";		
	}
}
