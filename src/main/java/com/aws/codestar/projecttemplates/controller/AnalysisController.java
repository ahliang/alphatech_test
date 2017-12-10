package com.aws.codestar.projecttemplates.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.*; 
import org.springframework.util.*;


/**
 * Basic Spring MVC controller that handles all GET requests.
 */
@Controller
public class AnalysisController {

    private final String siteName;

    public AnalysisController() {
        this.siteName = "analysis";
    }

    @RequestMapping(value = "/analysis", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("analysis");
        mav.addObject("siteName", this.siteName);
        return mav;
    }

    @RequestMapping(value = "/performAnalysis", method = RequestMethod.POST)
    public M Runtime().exec("python C:\\script\\hello.py", arg=[url_link, anal_type]);
        // return "Python script successfully run!";
        ModelAndView mav = new ModelAndView("results");
        mav.addObject("url_link", url_link);
        mav.addObject("anal_type", anal_type);
        
        return mav;                                                
    }

}
