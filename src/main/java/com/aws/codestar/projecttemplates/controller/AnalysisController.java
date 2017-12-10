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

    @RequestMapping(value = "/perform-analysis", method = RequestMethod.POST)
    public String runAnalysisScript(HttpServletRequest request) throws IOException {
        
        String url_link = request.getParameter("url_link");
        String anal_type = request.getParameter("anal_type");

        Process p = Runtime.getRuntime().exec("python C:\\script\\hello.py", arg=[url_link, anal_type]);

        return "Python script successfully run!";                                                
    }

}
