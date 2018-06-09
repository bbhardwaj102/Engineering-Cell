package com.enggcell.controllers;

import com.google.gson.JsonObject;
import com.enggcell.entities.Cities;
import com.enggcell.entities.Companies;
import com.enggcell.entities.CompanyRegistrations;
import com.enggcell.entities.Registrations;
import com.enggcell.services.CitiesService;
import com.enggcell.services.CompanyRegistrationsService;
import com.enggcell.services.CompanyService;
import com.enggcell.services.RegistrationsService;
import com.enggcell.utilities.Constant;
import com.enggcell.utilities.EmailSender;
import com.enggcell.utilities.FileUtils;
import com.enggcell.utilities.FolderUtil;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.Registration;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.hibernate.Session;
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
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


@Scope("request")
@RequestMapping(value = "/admin")
@Controller

public class CompanyController {
	
	@Autowired
    CompanyService companyService;
	
	@Autowired
	CitiesService cityService;
	
	@Autowired
	RegistrationsService registrationsService;
	
	@Autowired
	CompanyRegistrationsService companyRegistrationsService;
	
    @Autowired
    ThreadPoolTaskExecutor taskExecutor;
    
    

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String admin(Model model, HttpServletRequest request) {
    	try{
    		
        	HttpSession session = request.getSession();
        	if(session.getAttribute("adminUEngg") == null || session.getAttribute("adminUEngg") == ""){
        		//request.getRequestDispatcher("Login.jsp").forward(request, response);
        		return "Admin/Login";
        	}else{
        		model.addAttribute("adminStudentsList", registrationsService.findAll());
        		return "Admin/admin";
        	}
    	}catch(Exception e){
    		e.printStackTrace();
    		return "Admin/Login";
    	}
    	
    }
    
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login(Model model, HttpServletRequest request) {
    	try{
    		HttpSession session = request.getSession();
        	if(session.getAttribute("adminUEngg") != null && session.getAttribute("adminUEngg") != ""){
        		model.addAttribute("adminStudentsList", registrationsService.findAll());
        		return "Admin/admin";
        	}else{
        		return "Admin/Login";
        	}
    	}catch(Exception e){
    		e.printStackTrace();
    		
    		return "Admin/Login";
    	}
        
    }
    
    @RequestMapping(value = "logout", method = RequestMethod.POST)
    public String logout(Model model, HttpServletRequest request) {
    	try{
    	HttpSession session = request.getSession();
    	if(session.getAttribute("adminUEngg") != null && session.getAttribute("adminUEngg") != ""){
    		session.removeAttribute("adminUEngg");
    		return "Admin/Login";
    	}else{
    		model.addAttribute("adminStudentsList", registrationsService.findAll());
    		return "Admin/admin"; 
    	}
    	}catch(Exception e){
    		model.addAttribute("errors", "true");
    		e.printStackTrace();
    		return "Admin/Login";
    	}
        
    }
    //
    
    @RequestMapping(value = "adminLogin", method = RequestMethod.POST)
    public String adminLogin(Model model, HttpServletRequest request) {
    	try{
    		String username = request.getParameter("adminUser");
        	String password = request.getParameter("adminPass");
        	
        	if(username.equals("enggAdmin012") && password.equals("@@engg#56*123")){
        		 HttpSession session=request.getSession();
        		 session.setAttribute("adminUEngg", "94admin00@@");
        		 model.addAttribute("adminStudentsList", registrationsService.findAll());
        		 return "Admin/admin";
        	}else{
        		model.addAttribute("adminError", "error");
        		return "Admin/Login"; 
        	}
    	}catch(Exception e){
    		model.addAttribute("errors", "true");
    		e.printStackTrace();
    		return "Admin/Login";
    	}
    	
    }
    
    //
    @RequestMapping(value = "/deleteCityDetails", method = RequestMethod.POST)
    public String deleteCityDetails(Model model, HttpServletRequest request) {
    	//cityId
    	String id = request.getParameter("cityId");
    	//String city = request.getParameter("delCity");
    	try{
    		if(id != null && !id.equals("")){
        		Long rid = Long.parseLong(id);
        		String path = "";
        		/*try{
                	//File f1 = new File(request.getContextPath() + "/assets/admin/Portfolio/"+ city.getCity() + ".png");
                	File f1 = new File(request.getServletContext().getRealPath("/") + "\\assets\\admin\\Portfolio\\" + city + ".jpg");
                    if(f1.exists()){
                    	path = request.getServletContext().getRealPath("/") + "\\assets\\admin\\Portfolio\\" + city + ".jpg";
                    }else{
                    	path = request.getServletContext().getRealPath("/") + "\\assets\\admin\\Portfolio\\" + city + ".gif"; 
                    }
                }catch(Exception e){
                	e.printStackTrace();
                	model.addAttribute("errors", "true");
                    return "Admin/deleteCityDetails";
                }
        		File file = new File(path);
                if(file.delete())
                {
                    System.out.println("File deleted successfully" + request.getServletContext().getRealPath("/") + "\\assets\\admin\\Portfolio\\" + city + ".jpg");
                }
                else
                {
                	model.addAttribute("errors", "true");
                    System.out.println("Failed to delete the file");
                    return "Admin/deleteCityDetails";
                }*/
        		cityService.delete(rid);
        		
        		
        		model.addAttribute("delCityDetails", cityService.findAll());
        		return "Admin/deleteCityDetails";
        	}
    	}catch(Exception e){
    		e.printStackTrace();
    		model.addAttribute("errors", "true");
    		return "Admin/deleteCityDetails";
    	}//
    	
    	return "Admin/deleteCityDetails";
    }
    
    @RequestMapping(value = "/deleteStudentDetails", method = RequestMethod.POST)
    public String deleteStudentDetails(Model model, HttpServletRequest request) {
    	String id = request.getParameter("registrationId");
    	try{
    		if(id != null && !id.equals("")){
        		Long rid = Long.parseLong(id);
        		registrationsService.delete(rid);
        		model.addAttribute("delStudentDetails", registrationsService.findAll());
        		return "Admin/deleteStudentDetails";
        	}
    	}catch(Exception e){
    		e.printStackTrace();
    		model.addAttribute("errors", "true");
    	}
    	
    	return "Admin/deleteStudentDetails";
    }
    
    @RequestMapping(value = "/deletedetails", method = RequestMethod.POST)
    public String deletedetails(Model model, HttpServletRequest request) {
    	String id = request.getParameter("companyId");
    	
    	try{
    		if(id != null && !id.equals("")){
        		Long cid = Long.parseLong(id);
        		companyService.delete(cid);
        		model.addAttribute("deleteCompany", companyService.findAll());
        		return "Admin/deleteCompanyDetails";
        	}
    	}catch(Exception e){
    		e.printStackTrace();
    		model.addAttribute("errors", "true");
    	}
    	
    	return "Admin/deleteCompanyDetails";
    }
    
    //cityManager
    @RequestMapping("/cityManager")
    public String cityManager(Model model, HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	if(session.getAttribute("adminUEngg") == null || session.getAttribute("adminUEngg") == ""){
    		//request.getRequestDispatcher("Login.jsp").forward(request, response);
    		return "Admin/Login";
    	}else{
    		model.addAttribute("cities", cityService.findAll());
        	//return result + "</html>";
            return "Admin/cityManagement";
    	}
    }
    
    @RequestMapping("/companyManagerByAdmin")
    public String companyManagerByAdmin(Model model, HttpServletRequest request) {
    	try{
    		HttpSession session = request.getSession();
        	if(session.getAttribute("adminUEngg") == null || session.getAttribute("adminUEngg") == ""){
        		//request.getRequestDispatcher("Login.jsp").forward(request, response);
        		return "Admin/Login";
        	}else{
        		List<CompanyRegistrations> crs = companyRegistrationsService.findAll();
        		List<Companies> cs = companyService.findAll();
        		
        		for(CompanyRegistrations cr : crs){
        			boolean flag = true;
        			for(Companies c : cs){
        				if(cr.getCompanyName().equals(c.getCompanyName()) && 
        						cr.getCity().equals(c.getCity()) &&
        						cr.getDateOfInter().equals(c.getDateOfCampus())){
        					flag = false;
        				}
        			}
        			if(flag){
        				companyRegistrationsService.delete(cr.getId());
        			}
        		}
        		
        		model.addAttribute("companiesReg", companyRegistrationsService.findAll());
            	//return result + "</html>";
                return "Admin/companyManagementByAdmin";
        	}
    	}catch(Exception e){
    		e.printStackTrace();
    		model.addAttribute("errors", "true");
    		return "Admin/companyManagementByAdmin";
    	}
    }
    
    @RequestMapping("/companyManager")
    public String companyManager(Model model, HttpServletRequest request) {
    	//String result = "<html>";
    	/*for(Companies c : companyService.findAll()){
    		result += "<div>" + c.toString() + "</div>";
    	}*/
    	HttpSession session = request.getSession();
    	if(session.getAttribute("adminUEngg") == null || session.getAttribute("adminUEngg") == ""){
    		//request.getRequestDispatcher("Login.jsp").forward(request, response);
    		return "Admin/Login";
    	}else{
    		model.addAttribute("companies", companyService.findAll());
        	//return result + "</html>";
            return "Admin/companyManagement";
    	}
    	
    }

    @RequestMapping(value = "/filterByCityDetails", method = RequestMethod.GET)
    public String filterByCityDetails(Model model, HttpServletRequest request){
    	String city = request.getParameter("cityFilter");
    	try{
    		if(city != null && !city.equals("")){
        		model.addAttribute("cityFilterData", companyService.findAllByCity(city.toLowerCase()));
        		return "Admin/cityFilter";
        	}
    	}catch(Exception e){
    		e.printStackTrace();
    		model.addAttribute("errors", "true");
    	}
    	return "Admin/cityFilter";
    }
    
    @RequestMapping(value = "/filterByCityDetailsByAdmin", method = RequestMethod.GET)
    public String filterByCityDetailsByAdmin(Model model, HttpServletRequest request){
    	//cityFilter
    	String city = request.getParameter("cityFilter");
    	try{
    		if(city != null && !city.equals("")){
        		model.addAttribute("cityFilterDataAdmin", companyRegistrationsService.findAllByCity(city.toLowerCase()));
        		return "Admin/cityFilterByAdmin";
        	}
    	}catch(Exception e){
    		e.printStackTrace();
    		model.addAttribute("errors", "true");
    	}
    	return "Admin/cityFilterByAdmin";
    }
    
    @RequestMapping(value = "/filterStudentsByCityDetails", method = RequestMethod.GET)
    public String filterStudentsByCityDetails(Model model, HttpServletRequest request){
    	String city = request.getParameter("studentCityFilter");
    	try{
    		if(city != null && !city.equals("")){
        		model.addAttribute("studentCityFilterData", registrationsService.findAllByCity(city.toLowerCase()));
        		return "Admin/studentCityFilter";
        	}
    	}catch(Exception e){
    		e.printStackTrace();
    		model.addAttribute("errors", "true");
    	}
    	return "Admin/studentCityFilter";
    }
    
    @RequestMapping(value = "/filterStudentsByCourseDetails", method = RequestMethod.GET)
    public String filterStudentsByCourseDetails(Model model, HttpServletRequest request){
    	String course = request.getParameter("studentCourseFilter");
    	try{
    		if(course != null && !course.equals("")){
    			System.out.println(course.toLowerCase());
        		model.addAttribute("studentCourseFilterData", registrationsService.findAllByBranch(course.toLowerCase()));
        		return "Admin/studentCourseFilter";
        	}
    	}catch(Exception e){
    		e.printStackTrace();
    		model.addAttribute("errors", "true");
    	}
    	return "Admin/studentCourseFilter";
    }
    

    @RequestMapping(value = "/submitEditCityDetails", method = RequestMethod.POST)
    public String submitEditCityDetails(Model model, HttpServletRequest request,  @RequestParam CommonsMultipartFile[] updateCityImage){
    	try{
    		String id = request.getParameter("hidId");
    		String city = request.getParameter("updateCity");
    		String college = request.getParameter("updateCollege");
    		String address = request.getParameter("updateAddress");
    		String date = request.getParameter("updateDate");
    		String time = request.getParameter("updateTime");
    		String townscriptLink = request.getParameter("updateTownscriptLink");
    		String regPrice = request.getParameter("updateRegPrice");
    		String availSeats = request.getParameter("updateAvailSeats");
    		if (id == null || id.equals("") || city == null || city.equals("") || college == null || college.equals("") || address == null || address.equals("") || date == null || date.equals("")|| time == null || time.equals("") || regPrice ==null || regPrice.equals("") || availSeats == null || availSeats.equals("") || townscriptLink == null || townscriptLink.equals("")) {
            	System.out.println("bbbbbbbb if");
                model.addAttribute("errors", "true");
                return "Admin/cityManagement";
            }
    		
    		/*List<Cities> lis = cityService.findAll();
    		boolean flagg = true;
    		System.out.println("Hello");
    		if(lis != null){
    			System.out.println("World");
    			for(Cities cityy : lis){
        			if(cityy.getCity().equals(city)){
        				System.out.println("Java");
        				flagg = false;
        				model.addAttribute("cities", cityService.findAll());
        				System.out.println("Java");
        				model.addAttribute("errors", "true");
        				System.out.println("Java");
                        return "Admin/cityManagement";
        			}
        		}
    		}*/
    		
    		
    		String regId = city.toLowerCase();
    		Cities fairCity = cityService.findOne(Long.parseLong(id));
    		fairCity.setCity(city.toLowerCase());
    		fairCity.setAddress(address);
    		fairCity.setCollege(college);
    		fairCity.setDate(date);
    		fairCity.setTime(time);
    		fairCity.setRegPrice(regPrice);
    		fairCity.setAvailSeats(availSeats);
    		fairCity.setTownscriptLink(townscriptLink);
    		System.out.println(updateCityImage.length);
    		
    		
    		try {
           	 //System.out.println("bbbbbbbb if");
               if (updateCityImage != null && updateCityImage.length > 0) {
            	   System.out.println(updateCityImage.length + " 1 ");
                   for (CommonsMultipartFile aFile : updateCityImage) {
                	   System.out.println(updateCityImage.length + " 2 ");
                       if (aFile != null) {
                    	   
                    	   System.out.println(updateCityImage.length + " 3 " + aFile.getSize());
                    	 if(aFile.getSize() != 0){
                    		 if (!(aFile.getOriginalFilename().toLowerCase().endsWith(".jpg")
                          		   || aFile.getOriginalFilename().toLowerCase().endsWith(".png")
                                     || aFile.getOriginalFilename().toLowerCase().endsWith(".jpeg")
                                     || aFile.getOriginalFilename().toLowerCase().endsWith(".gif"))) {
                          	   System.out.println(updateCityImage.length + " 4 ");
                                 model.addAttribute("errors", "true");
                 return "Admin/cityManagement";
                             } else if (!(aFile.getOriginalFilename() == null || aFile.getOriginalFilename().equals(""))) {
                          	   
                          	   System.out.println(updateCityImage.length + " 5 ");
                          	   
                                 String filename = new FileUtils().rename(aFile.getOriginalFilename(), regId, true);
                                 System.out.println(updateCityImage.length + " 6 ");
                                 //getImageCity
                                 byte[] bytesImage = aFile.getBytes();
                                 System.out.println(updateCityImage.length + " 7 ");
                                 fairCity.setCityImage(filename);
                                 fairCity.setImageCity(bytesImage);
                                 System.out.println("pppp");
                                 
                             } else {
                             	//System.out.println("bbbbbbbb");
                                 model.addAttribute("errors", "true");
                                 
                 return "Admin/cityManagement";
                             }
                    	 }  
                           
                       }
                   }
               }
           } catch (Exception e) {
               e.printStackTrace();
               System.out.println("bbbbbbbb1");
               model.addAttribute("errors", "true");
               return "Admin/cityManagement";
           }
    		
    		
    		
    		cityService.save(fairCity);
    		model.addAttribute("editCity", cityService.findAll());
        	return "Admin/editCity";
    		
    	}catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errors", "true");
            return "Admin/editCity";
        }
    }
    
    //submitCitydetails
    @RequestMapping(value = "/submitCitydetails", method = RequestMethod.POST)
    public String submitCitydetails(Model model, HttpServletRequest request,  @RequestParam CommonsMultipartFile[] cityImage){
    	try{
    		String city = request.getParameter("city");
    		String college = request.getParameter("college");
    		String address = request.getParameter("address");
    		String date = request.getParameter("date");
    		String time = request.getParameter("time");
    		String regPrice = request.getParameter("regPrice");
    		String availSeats = request.getParameter("availSeats");
    		String townscriptLink = request.getParameter("townscriptLink");
    		
    		if (city == null || city.equals("") || college == null || college.equals("") || address == null || address.equals("") || date == null || date.equals("")|| time == null || time.equals("") || regPrice ==null || regPrice.equals("") || availSeats == null || availSeats.equals("") || townscriptLink == null || townscriptLink.equals("")) {
            	//System.out.println("bbbbbbbb if");
                model.addAttribute("errors", "true");
                return "Admin/cityManagement";
            }
    		
    		List<Cities> lis = cityService.findAll();
    		boolean flagg = true;
    		System.out.println("Hello");
    		if(lis != null){
    			System.out.println("World");
    			for(Cities cityy : lis){
        			if(cityy.getCity().equals(city)){
        				System.out.println("Java");
        				flagg = false;
        				model.addAttribute("cities", cityService.findAll());
        				System.out.println("Java");
        				model.addAttribute("errors", "true");
        				System.out.println("Java");
                        return "Admin/cityManagement";
        			}
        		}
    		}
    		
    		
    		String regId = city.toLowerCase();
    		Cities fairCity = new Cities();
    		fairCity.setCity(city.toLowerCase());
    		fairCity.setAddress(address);
    		fairCity.setCollege(college);
    		fairCity.setDate(date);
    		fairCity.setTime(time);
    		fairCity.setRegPrice(regPrice);
    		fairCity.setAvailSeats(availSeats);
    		fairCity.setTownscriptLink(townscriptLink);
    		
    		try {
           	 //System.out.println("bbbbbbbb if");
               if (cityImage != null && cityImage.length > 0) {
                   for (CommonsMultipartFile aFile : cityImage) {
                       if (aFile != null) {
                           if (!(aFile.getOriginalFilename().toLowerCase().endsWith(".jpg")
                        		   || aFile.getOriginalFilename().toLowerCase().endsWith(".png")
                                   || aFile.getOriginalFilename().toLowerCase().endsWith(".jpeg")
                                   || aFile.getOriginalFilename().toLowerCase().endsWith(".gif"))) {
                               model.addAttribute("errors", "true");
               return "Admin/cityManagement";
                           } else if (!(aFile.getOriginalFilename() == null || aFile.getOriginalFilename().equals(""))) {

                               String filename = new FileUtils().rename(aFile.getOriginalFilename(), regId, true);
                               //getImageCity
                               byte[] bytesImage = aFile.getBytes();
                               fairCity.setCityImage(filename);
                               fairCity.setImageCity(bytesImage);
                               System.out.println("pppp");
                               
                           } else {
                           	//System.out.println("bbbbbbbb");
                               model.addAttribute("errors", "true");
                               
               return "Admin/cityManagement";
                           }
                       }
                   }
               }
           } catch (Exception e) {
               e.printStackTrace();
               System.out.println("bbbbbbbb1");
               model.addAttribute("errors", "true");
               return "Admin/cityManagement";
           }
    		
    		
    		
    		cityService.save(fairCity);
    		model.addAttribute("addCity", cityService.findAll());
        	return "Admin/addCity";
    		
    	}catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errors", "true");
            return "Admin/addCity";
        }
    }
    
    //submitEditDetails
    //submitEditStudentDetails
    @RequestMapping(value = "/submitEditStudentDetails", method = RequestMethod.POST)
    public String submitEditStudentDetails(Model model, HttpServletRequest request){
    	try{
    		String hidId = request.getParameter("hidId");
    		String updateBranch = request.getParameter("updateBranch");
    		String updateCity = request.getParameter("updateCity");
    		String updateFullName = request.getParameter("updateFullName");
    		String updateEmail = request.getParameter("updateEmail");
    		String updateMobile = request.getParameter("updateMobile");
    		String updateBookingId = request.getParameter("updateBookingId");
    		//String updateDob = request.getParameter("updateDob");
    		String updateStatus = request.getParameter("updateStatus");
    		String updateGender = request.getParameter("updateGender");
    		String updatePanOrAadhar = request.getParameter("updatePanOrAadhar");
    		String updatePassingYear = request.getParameter("updatePassingYear");
    		String updateCompanies = request.getParameter("updateCompanies");
    		String updateAddress = request.getParameter("updateAddress");
    		String updateCollege = request.getParameter("updateCollege");
    		//String updateResume = request.getParameter("updateResume");
    		
    		
    		if (hidId == null || hidId.equals("") || updateBranch == null || updateBranch.equals("") || updateCity == null || updateCity.equals("") || updateFullName == null || updateFullName.equals("") || updateEmail == null || updateEmail.equals("") || updateGender == null || updateGender.equals("") || updatePanOrAadhar == null || updatePanOrAadhar.equals("") || updateAddress == null || updateAddress.equals("") || updateCollege == null || updateCollege.equals("") || updatePassingYear == null || updatePassingYear.equals("") || updateCompanies == null || updateCompanies.equals("") || updateMobile == null || updateMobile.equals("") || updateBookingId == null || updateBookingId.equals("") || updateStatus == null || updateStatus.equals("")) {
            	//System.out.println("bbbbbbbb if");
                model.addAttribute("errors", "true");
                return "Admin/admin";
            }
    		
    		Registrations registration = registrationsService.findOne(Long.parseLong(hidId));
    		registration.setBranch(updateBranch);
    		registration.setCity(updateCity);
    		registration.setMobile(updateMobile);
    		registration.setFullName(updateFullName);
    		registration.setEmail(updateEmail);
    		registration.setGender(updateGender);
    		registration.setPanoraadhar(updatePanOrAadhar);
    		registration.setPassingyear(updatePassingYear);
    		registration.setCompanies(updateCompanies);
    		registration.setAddress(updateAddress);
    		registration.setCollege(updateCollege);
    		registration.setStatus(updateStatus);
    		registration.setBookingId(updateBookingId);
    		registrationsService.save(registration);
    		model.addAttribute("editStudent", registrationsService.findAll());
        	return "Admin/editStudent";
    		
    	}catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errors", "true");
            return "Admin/editStudent";
        }
    }
    
    
    @RequestMapping(value = "/submitEditDetails", method = RequestMethod.POST)
    public String submitEditDetails(Model model, HttpServletRequest request){
    	try{
    		String id = request.getParameter("hidId");
    		String companyName = request.getParameter("updateCompanyName");
    		String city = request.getParameter("updateCity");
    		String qualification = request.getParameter("updateQualification");
    		String profile = request.getParameter("updateProfile");
    		String ctc = request.getParameter("updateCtc");
    		String criteria = request.getParameter("updateCriteria");
    		String selectionProcess = request.getParameter("updateSelectionProcess");
    		String dateOfCampus = request.getParameter("updateDateOfCampus");
    		String eligibility = request.getParameter("updateEligibility");
    		
    		if (id == null || id.equals("") || companyName == null || companyName.equals("") || city == null || city.equals("") || qualification == null || qualification.equals("") || profile == null || profile.equals("") || ctc == null || ctc.equals("") || criteria == null || criteria.equals("") || selectionProcess == null || selectionProcess.equals("") || eligibility == null || eligibility.equals("") || dateOfCampus == null || dateOfCampus.equals("")) {
            	//System.out.println("bbbbbbbb if");
                model.addAttribute("errors", "true");
                return "Admin/companyManagement";
            }
    		
    		Companies company = companyService.findOne(Long.parseLong(id));
    		
    		company.setCompanyName(companyName);
    		company.setCity(city.toLowerCase());
    		company.setQualification(qualification);
    		company.setProfile(profile);
    		company.setCtc(ctc);
    		company.setCriteria(criteria);
    		company.setSelectionProcess(selectionProcess);
    		company.setDateOfCampus(dateOfCampus);
    		company.setEligibility(eligibility);
    		companyService.save(company);
    		model.addAttribute("editCompany", companyService.findAll());
        	return "Admin/editCompany";
    		
    	}catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errors", "true");
            return "Admin/editCompany";
        }
    }
    
    @RequestMapping(value = "/submitdetails", method = RequestMethod.POST)
    public String submitDetails(Model model, HttpServletRequest request){
    	try{
    		String companyName = request.getParameter("companyName");
    		String city = request.getParameter("city");
    		String qualification = request.getParameter("qualification");
    		String profile = request.getParameter("profile");
    		String ctc = request.getParameter("ctc");
    		String criteria = request.getParameter("criteria");
    		String selectionProcess = request.getParameter("selectionProcess");
    		String dateOfCampus = request.getParameter("dateOfCampus");
    		String eligibility = request.getParameter("eligibility");
    		
    		if (companyName == null || companyName.equals("") || city == null || city.equals("") || qualification == null || qualification.equals("") || profile == null || profile.equals("") || ctc == null || ctc.equals("") || criteria == null || criteria.equals("") || selectionProcess == null || selectionProcess.equals("") || eligibility == null || eligibility.equals("") || dateOfCampus == null || dateOfCampus.equals("")) {
            	//System.out.println("bbbbbbbb if");
                model.addAttribute("errors", "true");
                return "Admin/companyManagement";
            }
    		
    		Companies company = new Companies();
    		company.setCompanyName(companyName);
    		company.setCity(city.toLowerCase());
    		company.setQualification(qualification);
    		company.setProfile(profile);
    		company.setCtc(ctc);
    		company.setCriteria(criteria);
    		company.setSelectionProcess(selectionProcess);
    		company.setDateOfCampus(dateOfCampus);
    		company.setEligibility(eligibility);
    		companyService.save(company);
    		model.addAttribute("addCompany", companyService.findAll());
        	return "Admin/addCompany";
    		
    	}catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errors", "true");
            return "Admin/addCompany";
        }
    	
    }
    
}
