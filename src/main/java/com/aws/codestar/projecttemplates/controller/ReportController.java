package com.aws.codestar.projecttemplates.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;
import org.springframework.web.bind.annotation.*; 
import org.springframework.util.*;

/**
 * Basic Spring MVC controller that handles all GET requests.
 */
@Controller
public class ReportController {

    private final String siteName;

    public ReportController() {
        this.siteName = "report";
    }
    
    private LinkedHashMap<Object, Object> defaultConfiguration(LinkedHashMap<Object, Object> reportData) {
    	reportData.put("type", "bar");
    	LinkedHashMap<Object, Object> options = new LinkedHashMap<Object, Object>();
    	options.put("responsive", true);
    	options.put("maintainAspectRatio", false);
    	reportData.put("options", options);
    	return reportData;
    }
    
    // this method should retrieve from service in the future
	@RequestMapping(value = "/report/getReportData", method = RequestMethod.POST)
	public @ResponseBody LinkedHashMap<Object, Object> getReportData(@RequestBody String reportName) {
		
		LinkedHashMap<Object, Object> reportData = new LinkedHashMap<Object, Object>();
		reportData = defaultConfiguration(reportData);
		
		LinkedHashMap<Object, Object> dataMap = new LinkedHashMap<Object, Object>();
		//List<String> labels = Arrays.asList("June", "July", "August", "September", "October", "November", "December");
		
		LinkedHashMap<Object, Object> dataSet1 = new LinkedHashMap<Object, Object>();
		dataSet1.put("label", "Company1");
		dataSet1.put("data", new Integer[] { 1, 1, 2, 3, 4, 5, 6 });
		dataSet1.put("fill", false);
		dataSet1.put("borderColor", "purple");
		dataSet1.put("backgroundColor", "purple");

		LinkedHashMap<Object, Object> dataSet2 = new LinkedHashMap<Object, Object>();
		dataSet2.put("label", "Company2");
		dataSet2.put("data", new Integer[] { 1, 2, 4, 8, 3, 2, 4 });
		dataSet2.put("fill", false);
		dataSet2.put("borderColor", "green");
		dataSet2.put("backgroundColor", "green");
		
		ArrayList dataSets = new ArrayList();
		dataSets.add(dataSet1);
		dataSets.add(dataSet2);
		dataMap.put("labels", new String[] { "June", "July", "August", "September", "October", "November", "December" });
		dataMap.put("datasets", dataSets);
		// data partially empty
		return reportData;
	}
	
	
}
