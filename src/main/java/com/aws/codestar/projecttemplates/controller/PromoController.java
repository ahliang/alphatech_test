package com.aws.codestar.projecttemplates.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/promo")
public class PromoController {

	private static final Logger logger = LogManager.getLogger(PromoController.class);

	private final String siteName = "promo";

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index() {
		logger.trace("index <");
		ModelAndView mav = new ModelAndView(siteName);
		logger.trace("index >");
		return mav;
	}
}
