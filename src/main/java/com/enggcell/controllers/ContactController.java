/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.enggcell.controllers;

import com.enggcell.entities.Contact;
import com.enggcell.services.ContactService;
import com.enggcell.utilities.Constant;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 *
 * @author 1003
 */
@Scope("request")
@RequestMapping(value = "/contactdetails")
@Controller
public class ContactController {

    @Autowired
    private ContactService contactService;
    
    @RequestMapping(value = "/submitContact", method = RequestMethod.POST)
    @ResponseBody
    public String checkPromoCode(Model model, HttpServletRequest request) {
        String msg = null;
        if (request.getParameter("name") != null || request.getParameter("phone") != null || request.getParameter("email") != null || request.getParameter("message") != null) {
            if (!request.getParameter("name").equals("") || !request.getParameter("phone").equals("") || !request.getParameter("email").equals("") || !request.getParameter("message").equals("")) {
                Contact contact =new Contact();
                contact.setName(request.getParameter("name"));
                contact.setPhone(request.getParameter("phone"));
                contact.setEmail(request.getParameter("email"));
                contact.setMessage(request.getParameter("message"));
                contact.setCreatedby(request.getParameter("email"));
                contact.setCreateddate(new Date());
                contact.setStatus(Constant.ACTIVE);
                contactService.save(contact);
                msg = "Success";
            } else {
                msg = "Failure";
            }

        } else {
            msg = "Failure";
        }

        return msg;
    }
  

}
