/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.enggcell.controllers;

import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.enggcell.services.CitiesService;
import com.enggcell.services.CompanyService;

/**
 *
 * @author 1003
 */
@Scope("request")
@RequestMapping(value = "/")
@Controller
public class LandingController {
	
	@Autowired
    CompanyService companyService;
	
	@Autowired
    CitiesService citiesService;
	
    @Autowired
    ThreadPoolTaskExecutor taskExecutor;

	
    @RequestMapping(value = "submitContact", method = RequestMethod.POST)
    @ResponseBody
    public String checkPromoCode(Model model, HttpServletRequest request) {
        String msg = null;
        if (request.getParameter("name") != null || request.getParameter("phone") != null || request.getParameter("email") != null || request.getParameter("message") != null) {
            if (request.getParameter("name").equals("") || request.getParameter("phone").equals("") || request.getParameter("email").equals("") || request.getParameter("message").equals("")) {
                msg = "Failure";
            } else {
                msg = "Failure";
            }

        } else {
            msg = "Failure";
        }

        return msg;
    }
    
    @RequestMapping(value = "/privacy")
    public String privacy(Model model, HttpServletRequest request) {
    	return "privacy";
    }
    
    @RequestMapping(value = "/terms")
    public String terms(Model model, HttpServletRequest request) {
    	return "terms";
    }
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String redirect(Model model, HttpServletRequest request) {
    	model.addAttribute("indexCompanies", companyService.findAll());
    	model.addAttribute("indexCities", citiesService.findAll());
        return "index";
    }
    
    @RequestMapping(value = "/test")
    public String test(Model model, HttpServletRequest request) {
    	return "test";
    }

}
