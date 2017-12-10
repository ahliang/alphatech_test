package com.aws.codestar.projecttemplates.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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
    public ModelAndView runAnalysisScript(HttpServletRequest request) throws IOException {

        String url_link = request.getParameter("url_link");
        String anal_type = request.getParameter("anal_type");

        String line= "";
        String eline= "";
        String python_output="";
        String[] cmd = new String[]{"python", "C:\\script\\hello_world.py", url_link, anal_type};
        
        try {
            Process p = Runtime.getRuntime().exec(cmd);
            BufferedReader bri = new BufferedReader(new InputStreamReader(p.getInputStream()));
            BufferedReader bre = new BufferedReader(new InputStreamReader(p.getErrorStream()));
            
            while ((line = bri.readLine()) != null) {
                System.out.println(line);
                python_output+=line+"\n";
            }
            bri.close();
            
            while ((eline = bre.readLine()) != null) {
                System.out.println(eline);
            }
            bre.close();
            p.waitFor();
            System.out.println("Done.");
        } catch (Exception err) {
            err.printStackTrace();
        }

        ModelAndView mav = new ModelAndView("results");
        mav.addObject("url_link", url_link);
        mav.addObject("anal_type", anal_type);
        mav.addObject("python_output", python_output);        

        return mav;
    }

}
