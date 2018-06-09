/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.enggcell.controllers;

import com.google.gson.JsonObject;
import com.enggcell.entities.Cities;
import com.enggcell.entities.Companies;
import com.enggcell.entities.CompanyRegistrations;
import com.enggcell.entities.Executive;
import com.enggcell.entities.Job;
import com.enggcell.entities.Registrations;
import com.enggcell.services.CitiesService;
import com.enggcell.services.CompanyRegistrationsService;
import com.enggcell.services.CompanyService;
import com.enggcell.services.RegistrationsService;
import com.enggcell.utilities.Constant;
import com.enggcell.utilities.EmailSender;
import com.enggcell.utilities.FileUtils;
import com.enggcell.utilities.FolderUtil;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.Registration;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
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

/**
 *
 * @author 1003
 */
@Scope("request")
@RequestMapping(value = "/register")
@Controller
public class RegisterDetails {

    @Autowired
    RegistrationsService registrationsService;
    
    @Autowired
    CitiesService citiesService;
    
    @Autowired
    CompanyService companyService;
    
    @Autowired
    CompanyRegistrationsService companyRegistraitonsService;
    
    @Autowired
    ThreadPoolTaskExecutor taskExecutor;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String register(Model model, HttpServletRequest request) {
        return "fairs";
    }

    @RequestMapping(value = "/adddetails", method = RequestMethod.GET)
    public String adddetails(Model model, HttpServletRequest request) {
    	model.addAttribute("indexCompaniesRegi", companyService.findAll());
    	model.addAttribute("indexCitiesRegi", citiesService.findAll());
        return "reg";
    }

//    @RequestMapping(value = "/adddetails/{state}", method = RequestMethod.GET)
//    public String adddetails(Model model, HttpServletRequest request, @PathVariable("state") String state) {
//        if (state != null && !state.equals("NCR") && !state.equals("Hyderabad") && !state.equals("Chennai") && !state.equals("Bhopal")) {
//            state = "Hyderabad";
//        }
//        model.addAttribute("state", state);
//        return "reg";
//    }
    

    @RequestMapping(value = "/submitCompanyDetails", method = RequestMethod.POST)
    @ResponseBody
    public String submitCompanyDetails(Model model, HttpServletRequest request) {
    	
    	try {
    		
    		String hidRow = request.getParameter("hidRow");
    		System.out.println("---- " + hidRow);
    		String hidRow2 = request.getParameter("hidRow2");
    		System.out.println("---- " + hidRow2);
    		String companyName = request.getParameter("companyName");
    		System.out.println("---- " + companyName);
    		String contactPerson = request.getParameter("contactPerson");//contactPerson
    		System.out.println("---- " + contactPerson);
    		String designation = request.getParameter("designation");
    		System.out.println("---- " + designation);
    		String address = request.getParameter("address");
    		System.out.println("---- " + address);
    		String phone = request.getParameter("phone");
    		System.out.println("---- " + phone);
    		String mobile = request.getParameter("mobile");
    		System.out.println("---- " + mobile);
    		String fax = request.getParameter("fax");
    		System.out.println("---- " + fax);
    		String email = request.getParameter("email");
    		System.out.println("---- " + email);
    		String approxSeats = request.getParameter("approxSeats");
    		System.out.println("---- " + approxSeats);
    		String dateOfInter = request.getParameter("dateOfInter");
    		System.out.println("---- " + dateOfInter);
    		String eligibility = request.getParameter("eligibility");
    		System.out.println("---- " + eligibility);
    		String criteria = request.getParameter("criteria");
    		System.out.println("---- " + criteria);
    		String selectionProcess = request.getParameter("selectionProcess");
    		System.out.println("---- " + selectionProcess);
    		String city = request.getParameter("city");
    		System.out.println("---- " + city);
    		String hrExecutiveName = request.getParameter("hrDepttPersonName");
    		System.out.println("---- " + hrExecutiveName);
    		String hrExecutiveDesig = request.getParameter("hrPersonDesig");
    		System.out.println("---- " + hrExecutiveDesig);
    		
    		
    		if (hidRow == null || hidRow.equals("") || hidRow2 == null || hidRow2.equals("") || companyName == null || companyName.equals("") || contactPerson == null || contactPerson.equals("") || designation == null || designation.equals("") || mobile == null || mobile.equals("") || address == null || address.equals("") || phone == null || phone.equals("") || fax == null || fax.equals("") || email == null || email.equals("") || approxSeats == null || approxSeats.equals("") || dateOfInter == null || dateOfInter.equals("") || city == null || city.equals("") || hrExecutiveName == null || hrExecutiveName.equals("") || hrExecutiveDesig == null || hrExecutiveDesig.equals("") || eligibility == null || eligibility.equals("") || criteria == null || criteria.equals("")) {
            	//System.out.println("bbbbbbbb if");
    			System.out.println("---- " + "uuuu");
                return "Failure";
            }
    		System.out.println(request.getParameter("n" + 1));
    		System.out.println("---- " + "ooooo");
    		List<Job> jobs = new ArrayList<Job>(); 
    		int j = 1;
    		String qualification = "";
    		String profile = "";
    		String salary = "";
    		System.out.println("---- " + "zzzzzz");
    		for(int i = 0; i < Integer.parseInt(hidRow); i++){
    			Job job = new Job();
    			System.out.println("---- " + "yyyy1");
    			job.setDesignation(request.getParameter("n" + j));
    			profile = profile + request.getParameter("n" + j) + ", ";
    			j++;
    			System.out.println("---- " + "yyyy2");
    			String a2 = request.getParameter("n" + j);
    			job.setVacancies(request.getParameter("n" + j));
    			j++;
    			job.setQualification(request.getParameter("n" + j));
    			qualification = qualification + request.getParameter("n" + j) + "/ ";
    			j++;
    			job.setSalary(request.getParameter("n" + j));
    			salary = salary + request.getParameter("n" + j) + ", ";
    			j++;
    			job.setLocation(request.getParameter("n" + j));
    			j++;
    			job.setOthers(request.getParameter("n" + j));
    			j++;
    			jobs.add(job);
    		}
    		int in1 = qualification.lastIndexOf('/');
    		qualification = qualification.substring(0, in1);
    		
    		in1 = profile.lastIndexOf(',');
    		profile = profile.substring(0, in1);
    		
    		in1 = salary.lastIndexOf(',');
    		salary = salary.substring(0, in1);
    		System.out.println("---- " + "tttt");
    		List<Executive> executives = new ArrayList<Executive>();
    		Executive ex = new Executive();
    		ex.setName(hrExecutiveName);
    		ex.setDesignation(hrExecutiveDesig);
    		executives.add(ex);
            int k = 1;
    		for(int i = 1; i < Integer.parseInt(hidRow2) + 1; i++){
    			Executive exe = new Executive();
    		    exe.setName(request.getParameter("nn" + k));
    			k++;
    			exe.setDesignation(request.getParameter("nn" + k));
    			k++;
    			executives.add(exe);
    		}
    		System.out.println("---- " + "rrrr");
            CompanyRegistrations registration = new CompanyRegistrations();
            String regId = companyName + "_" + phone;
            registration.setCompanyName(companyName);
            registration.setContactPersonName(contactPerson);
            registration.setPersonDesignation(designation);
            registration.setCompanyAddress(address);
            registration.setCompanyPhone(phone);
            registration.setPersonMobile(mobile);
            registration.setFax(fax);
            registration.setEmail(email);
            registration.setApproxPos(approxSeats);
            registration.setDateOfInter(dateOfInter);
            registration.setEligibility(eligibility);
            registration.setCriteria(criteria);
            registration.setSelectionProcess(selectionProcess);
            registration.setCity(city.toLowerCase());
            System.out.println("---- " + "mmmm");
            registration.setJobDetails(jobs.toArray());
            registration.setExecutives(executives.toArray());
            System.out.println("---- " + "tttt");
            registration.setRegDate((new Date()).toString());
            registration.setRegId(regId);
            //ClassLoader classLoader = getClass().getClassLoader();
            //String emailTemplate = "";
            System.out.println("---- " + "kkkk");
            /*try {
                emailTemplate = IOUtils.toString(classLoader.getResourceAsStream("Newuser.txt"));
            } catch (IOException e) { 
            	e.printStackTrace();
            }

            emailTemplate = emailTemplate.replace("{fullname}", companyName).replace("{regId}", regId);
            taskExecutor.execute(new EmailSender(Constant.EMAIL_USER, email, "Thank you for registering for EnggCell ", emailTemplate, "EnggCell"));
            //System.out.println("bbbbbbbb if");*/

            companyRegistraitonsService.save(registration);
            
            Companies company = new Companies();
            company.setCity(city.toLowerCase());
            company.setCompanyName(companyName);
            company.setQualification(qualification);
            company.setProfile(profile);
            company.setCtc(salary);
            company.setCriteria(criteria);
            company.setSelectionProcess(selectionProcess);
            company.setDateOfCampus(dateOfInter);
            company.setEligibility(eligibility);
            companyService.save(company);
            
            
            System.out.println("bbbbbbbb if1");
            
            System.out.println("bbbbbbbb if2");
        } catch (Exception e) {
        	System.out.println("bbbbbbbb2");
        	e.printStackTrace();
            return "Failure";
        }
//        String state = request.getParameter("state");
//		Student st = new Student(branch, fullName, email, mobile, day, month, year, gender, panOraadhar, city, currentCity);
//		request.setAttribute("student", st);
        return "Success";
    	
    }
    
    String branch = "";
    String branch2 = "";
    String fullName = "";
    String address = "";
    String college = "";
    String email = "";
    String date = "";
    String mobile = "";
    String day = "";
    String month = "";
    String year = "";
    String gender = "";
    String panOraadhar = "";
    String city = "";
    String passingyear = "";
    String companies = "";
    String bookingId = "";
    
    
    @RequestMapping(value = "/submitdetails", method = RequestMethod.POST)
    public String submitdetails(Model model, HttpServletRequest request) {
        try {
        	branch2 = request.getParameter("it");
        	
        	branch = request.getParameter("it").toLowerCase();
        	System.out.println("it " + branch);
        	bookingId = request.getParameter("bookingId");
        	fullName = request.getParameter("fullname");
            System.out.println("fullName" + fullName);
            
            address = request.getParameter("address");
            System.out.println("adress" + address);
            
            college = request.getParameter("college");
            System.out.println("college" + college);
            
            email = request.getParameter("email");
            System.out.println("email" + email);
            
            Date currentDate = new Date();  
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
            date= formatter.format(currentDate);
            
            mobile = request.getParameter("mobile");
            System.out.println("mobile" + mobile);
            day = request.getParameter("dobday");
            System.out.println("dobday" + day);
            month = request.getParameter("dobmonth");
            System.out.println("dobmonth" + month);
            year = request.getParameter("dobyear");
            System.out.println("dobyear" + year);
             gender = request.getParameter("gender");
            System.out.println("gender" + gender);
             panOraadhar = request.getParameter("aadhar");
            System.out.println("aadhar" + panOraadhar);
             city = request.getParameter("location");
            System.out.println("location" + city);
             passingyear = request.getParameter("passingyear");
            System.out.println("passingyear" + passingyear);
            String[] companiesCheck = request.getParameterValues("companiesCheck");
            //companies = request.getParameter("companies");
            System.out.println("companies" + companiesCheck);
            
            
            
            if (branch == null || branch.equals("") || fullName == null || fullName.equals("") || address == null || address.equals("") || year == null || email == null || email.equals("") || mobile == null || mobile.equals("") || day == null || day.equals("") || month == null || month.equals("") || gender == null || gender.equals("") || panOraadhar == null || panOraadhar.equals("") || city == null || city.equals("") || companiesCheck == null || companiesCheck.length == 0 || bookingId == null || bookingId.equals("")) {
            	//System.out.println("bbbbbbbb if");
                model.addAttribute("errors", "true");
                model.addAttribute("errBranch", branch2);
                model.addAttribute("errFullName", fullName);
                model.addAttribute("errAddress", address);
                model.addAttribute("errCollege", college);
                model.addAttribute("errEmail", email);
                model.addAttribute("errMobile", mobile);
                model.addAttribute("errDay", day);
                model.addAttribute("errMonth", month);
                model.addAttribute("errYear", year);
                model.addAttribute("errPanOrAadhar", panOraadhar);
                model.addAttribute("errGender", gender);
                model.addAttribute("errCity", city);
                model.addAttribute("errPassingYear", passingyear);
                model.addAttribute("errBookingId", bookingId);
                if(companiesCheck == null || companiesCheck.equals("")){
                	model.addAttribute("errCompanies", "studComerror");
                }
                model.addAttribute("indexCompaniesRegi", companyService.findAll());
            	model.addAttribute("indexCitiesRegi", citiesService.findAll());
                return "reg";
            }
            
            
            Registrations dupEmailPanOrAadharErrors = registrationsService.findAllByEmail(email);
            if(dupEmailPanOrAadharErrors != null){
            	model.addAttribute("errors", "true");
            	model.addAttribute("dupEmailPanOrAadharErrors", "true");
            	model.addAttribute("indexCompaniesRegi", companyService.findAll());
            	model.addAttribute("indexCitiesRegi", citiesService.findAll());
            	return "reg";
            }
            
            dupEmailPanOrAadharErrors = registrationsService.findAllByPanoraadhar(panOraadhar);
            if(dupEmailPanOrAadharErrors != null){
            	model.addAttribute("errors", "true");
            	model.addAttribute("dupEmailPanOrAadharErrors", "true");
            	model.addAttribute("indexCompaniesRegi", companyService.findAll());
            	model.addAttribute("indexCitiesRegi", citiesService.findAll());
            	return "reg";
            }
            
            Cities cit = null;
            List<Cities> cities = (List<Cities>)citiesService.findAll();
            
            for(Cities cityy : cities){
            	System.out.println(cityy.getCity() + " sasas---- ");
            	if(city.equalsIgnoreCase(cityy.getCity())){
            		cit = cityy;
            		break;
            	}
            }
            
            if(cit == null){
            	model.addAttribute("errors", "true");
            	model.addAttribute("errBranch", branch2);
                model.addAttribute("errFullName", fullName);
                model.addAttribute("errAddress", address);
                model.addAttribute("errCollege", college);
                model.addAttribute("errEmail", email);
                model.addAttribute("errMobile", mobile);
                model.addAttribute("errDay", day);
                model.addAttribute("errMonth", month);
                model.addAttribute("errYear", year);
                model.addAttribute("errPanOrAadhar", panOraadhar);
                model.addAttribute("errGender", gender);
                model.addAttribute("errCity", city);
                model.addAttribute("errPassingYear", passingyear);
                model.addAttribute("errCompanies", companies);
                model.addAttribute("errCityBool", "true");
                model.addAttribute("indexCompaniesRegi", companyService.findAll());
            	model.addAttribute("indexCitiesRegi", citiesService.findAll());
            	model.addAttribute("errBookingId", bookingId);
                return "reg";
            }
            
            Registrations registration = new Registrations();
            registration.setBranch(branch);
            registration.setFullName(fullName);
            registration.setAddress(address);
            registration.setCollege(college);
            registration.setEmail(email);
            registration.setDate(date);
            registration.setMobile(mobile);
            registration.setDay(BigInteger.valueOf(Long.valueOf(day)));
            registration.setMonth(BigInteger.valueOf(Long.valueOf(month)));
            registration.setYear(BigInteger.valueOf(Long.valueOf(year)));
            registration.setGender(gender);
            registration.setBookingId(bookingId);
            registration.setPanoraadhar(panOraadhar);
            registration.setCity(city.toLowerCase());
            String companies = "";
            for(int i = 0; i < companiesCheck.length; i++){
            	companies = companies + companiesCheck[i] + ", ";
            }
            registration.setCompanies(companies != null && !companies.equals("") ? companies : "");
            registration.setPassingyear(passingyear != null && !passingyear.equals("") ? passingyear : "");
            registration.setStatus(Constant.ACTIVE);
            //String regId = UUID.randomUUID().toString();
            String regId = city + "_" + mobile + "_" + panOraadhar + "_" + new Random().nextInt(); 
            registration.setRegId(regId);
            ClassLoader classLoader = getClass().getClassLoader();
            String emailTemplate = "";
            try {
                emailTemplate = IOUtils.toString(classLoader.getResourceAsStream("Newuser.txt"));
            } catch (IOException ex) {
            }

            emailTemplate = emailTemplate.replace("{fullname}", fullName).replace("{regId}", regId).replace("{billAmount}", cit.getRegPrice()).replace("{address}", address).replace("{billDate}", date).replace("{preCity}", city).replace("{payStatus}", registration.getStatus()).replace("{contact}", mobile).replace("{college}", college).replace("{email}", email).replace("{addressFair}", cit.getAddress()).replace("{collegeFair}", cit.getCollege()).replace("{dateFair}", cit.getDate().replace("{bookingId}", registration.getBookingId()));
            taskExecutor.execute(new EmailSender(Constant.EMAIL_USER, email, "Thank you for registering for EnggCell ", emailTemplate, "EnggCell"));
            //System.out.println("bbbbbbbb if");

            registrationsService.save(registration);
            System.out.println("bbbbbbbb if1");
            model.addAttribute("registration", registration);
            model.addAttribute("prefcities", cit);
            
            System.out.println("bbbbbbbb if2");
        } catch (Exception e) {
        	System.out.println("bbbbbbbb2");
            model.addAttribute("errors", "true");
            model.addAttribute("errBranch", branch2);
            model.addAttribute("errFullName", fullName);
            model.addAttribute("errAddress", address);
            model.addAttribute("errCollege", college);
            model.addAttribute("errEmail", email);
            model.addAttribute("errMobile", mobile);
            model.addAttribute("errDay", day);
            model.addAttribute("errMonth", month);
            model.addAttribute("errBookingId", bookingId);
            model.addAttribute("errYear", year);
            model.addAttribute("errPanOrAadhar", panOraadhar);
            model.addAttribute("errGender", gender);
            model.addAttribute("errCity", city);
            model.addAttribute("errPassingYear", passingyear);
            model.addAttribute("errCompanies", companies);
            model.addAttribute("indexCompaniesRegi", companyService.findAll());
        	model.addAttribute("indexCitiesRegi", citiesService.findAll());
            return "reg";
        }
//        String state = request.getParameter("state");
//		Student st = new Student(branch, fullName, email, mobile, day, month, year, gender, panOraadhar, city, currentCity);
//		request.setAttribute("student", st);
        return "MyWallet/Invoice";
    }

    @RequestMapping(value = "/addRegId", method = RequestMethod.POST)
    public String addRegId(Model model, HttpServletRequest request) {
        try {
            String regId = request.getParameter("regId");
            if (regId == null || regId.equals("")) {
            	System.out.println("bbbbbbbb3");
                model.addAttribute("errors", "true");
                return "MyWallet/Invoice";
            }
            Registrations registration = registrationsService.findByRegidAndStatus(regId, Constant.INPROGRESS);
            if (registration == null) {
            	System.out.println("bbbbbbbb4");
                model.addAttribute("errors", "true");
                model.addAttribute("registration", null);
                return "MyWallet/Invoice";

            } else {
                model.addAttribute("registration", registration);
                return "MyWallet/Invoice";
            }
        } catch (Exception e) {
        	System.out.println("bbbbbbbb5");
            model.addAttribute("errors", "true");
            return "MyWallet/Invoice";
        }
//        String state = request.getParameter("state");
//		Student st = new Student(branch, fullName, email, mobile, day, month, year, gender, panOraadhar, city, currentCity);
//		request.setAttribute("student", st);
    }
}
