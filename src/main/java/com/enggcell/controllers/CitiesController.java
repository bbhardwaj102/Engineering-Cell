package com.enggcell.controllers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.enggcell.services.CitiesService;


@Scope("request")
@RequestMapping(value = "/wxyr")
@Controller

public class CitiesController {
	
	@Autowired
	CitiesService cityService;
	

    @Autowired
    ThreadPoolTaskExecutor taskExecutor;
    
    
}
