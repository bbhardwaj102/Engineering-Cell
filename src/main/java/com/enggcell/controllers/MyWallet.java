/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.enggcell.controllers;

import com.enggcell.BusinessService.PayWithPaypal;
import com.enggcell.Constants.TransactionStatusEnum;
import com.enggcell.Constants.TransactionTypeEnum;
import com.enggcell.entities.Cities;
import com.enggcell.entities.LmBusinessTransactions;
import com.enggcell.entities.LmTransactionLogs;
import com.enggcell.services.BusinessTransactionService;
import com.enggcell.services.CitiesService;
import com.enggcell.services.TransactionLogsService;
import com.enggcell.utilities.CommonsUtil;
import com.enggcell.utilities.Constant;
import com.enggcell.utilities.EncryptUtils;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.enggcell.entities.Registrations;
import com.enggcell.services.RegistrationsService;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author 1003
 */
@Scope("request")
@RequestMapping(value = "/Invoice")
@Controller
public class MyWallet {
    
    @Autowired
    private BusinessTransactionService businessTransactionService;
    @Autowired
    private TransactionLogsService transactionLogsService;
    
    @Autowired
    RegistrationsService registrationsService;
    
    @Autowired
    CitiesService citiesService;
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String viewInvoice(Model model, HttpServletRequest request) {
        System.out.println("Here it is");
        return "/MyWallet/Invoice";
    }
    
    @RequestMapping(value = "/print/{regId}", method = RequestMethod.GET)
    public String print(Model model, HttpServletRequest request, @PathVariable("regId") String regId) {
        System.out.println("Here it is");
        if (regId == null || regId.equals("0")) {
            regId = request.getParameter("regId");
            if (regId == null || regId.equals("")) {
                return "redirect:/";
            }
        }
        Registrations registrations = registrationsService.findByRegidAndStatus(regId, Constant.INPROGRESS);
        String city = "";
        Cities cit = null;
        if(registrations != null){
        	city = registrations.getCity();
            List<Cities> cities = citiesService.findAll();
            for(Cities cityy : cities){
            	if(city.equalsIgnoreCase(cityy.getCity())){
            		cit = cityy;
            		break;
            	}
            }
        }
        if (registrations == null) {
            return "redirect:/";
        }
        registrations.setStatus(Constant.ACTIVE);
        registrationsService.save(registrations);
        model.addAttribute("registrations",registrations);
        model.addAttribute("prefcities", cit);
        return "/MyWallet/Invoice_1";
    }
 
    @RequestMapping(value = "/addMoneyViaRegId", method = RequestMethod.POST)
    public String addMoneyViaRegId(Model model, HttpServletRequest request) {
        System.out.println("Here it is");
        String regId = request.getParameter("regId"); 
            if (regId == null || regId.equals("")) {
                return "redirect:/Invoice/?m=perr";
        }
        Registrations registrations = registrationsService.findByRegidAndStatus(regId, Constant.INPROGRESS);
        if (registrations == null) {
            return "redirect:/Invoice/?m=perr";
        }
        return "redirect:/Invoice/addMoney/"+registrations.getRegId();
    }

    @RequestMapping(value = "/addMoney/{regId}", method = RequestMethod.GET)
    public String addMoney(Model model, HttpServletRequest request, @PathVariable("regId") String regId) {
        String accountid = "";
        String trid = "";
        String returnurl = "";
        LmTransactionLogs lmTransactionLogs = null;
        LmBusinessTransactions businessTransactions = null;
        if (regId == null || regId.equals("0")) {
            regId = request.getParameter("regId");
            if (regId == null || regId.equals("")) {
                return "redirect:/Invoice/?m=perr";
            }
        }
        Registrations registrations = registrationsService.findByRegidAndStatus(regId, Constant.INPROGRESS);
        String city = "";
        String price = "";
        if(registrations != null){
        	city = registrations.getCity();
            price = "";
            List<Cities> cities = citiesService.findAll();
            for(Cities cityy : cities){
            	if(city.equalsIgnoreCase(cityy.getCity())){
            		price = cityy.getRegPrice();
            		break;
            	}
            }
        }
        
        if (registrations == null) {
            return "redirect:/Invoice/?m=perr";
        }
        synchronized (MyWallet.class) {
            
            businessTransactions = new LmBusinessTransactions();
//            businessTransactions.setBusinessid(regId);
            businessTransactions.setRegId(regId);
            businessTransactions.setCreatedby(regId);
            businessTransactions.setCredit(new BigDecimal(price));
            businessTransactions.setDebit(BigDecimal.ZERO);
            businessTransactions.setCurrency(Constant.CURRENCY);
            businessTransactions.setIpaddress(new CommonsUtil().getIPAddress(request));
            
            
            //---businessTransactions.setPaypaltransactionid(null);
            
            
            businessTransactions.setStatus(TransactionStatusEnum.FAILED.toString());
            
            
            //---businessTransactions.setTransactiontype(TransactionTypeEnum.PAYPAL.toString());
            
            
            businessTransactions.setTransactiondate(new Date());
            businessTransactionService.save(businessTransactions);
            businessTransactions.setDescription("Paypal : Add money - #TransactionID = [ " + businessTransactions.getTransactionid() + " ]");
            businessTransactions.setEncaccountid(new EncryptUtils().encodeMD5("1"));
            businessTransactions.setEnctransactionid(new EncryptUtils().encodeMD5(businessTransactions.getTransactionid().toString()));
            businessTransactionService.save(businessTransactions);
            
            lmTransactionLogs = new LmTransactionLogs();
            lmTransactionLogs.setCreatedby(regId);
            lmTransactionLogs.setCreateddate(new Date());
            lmTransactionLogs.setDescription("Transaction initiated.");
//            lmTransactionLogs.setLoggedinaccountid(logedinAccounts.getAccountid());
            lmTransactionLogs.setRegId(regId);
            lmTransactionLogs.setTransactionid(businessTransactions.getTransactionid());
            transactionLogsService.save(lmTransactionLogs);
            
            model.addAttribute("trid", businessTransactions.getEnctransactionid());
            model.addAttribute("accountid", businessTransactions.getEncaccountid());
            accountid = businessTransactions.getEncaccountid();
            trid = businessTransactions.getEnctransactionid();
        }
        PayWithPaypal payWithPaypal = new PayWithPaypal();
        //Payment payment = payWithPaypal.payment("1000", "0", "0", "1000", Constant.CURRENCY, "Payment for adding money in EnggCell Wallet", "EnggCell Wallet", "1", "sale", Constant.URL + "PaypalPayment/success/" + accountid + "/" + trid, Constant.URL + "PaypalPayment/cancel/" + accountid + "/" + trid);
        Payment payment = payWithPaypal.payment(price, "0", "0", price, Constant.CURRENCY, "Payment for adding money in EnggCell Wallet", "EnggCell Wallet", "1", "sale", Constant.URL + "PaypalPayment/success/" + accountid + "/" + trid, Constant.URL + "PaypalPayment/cancel/" + accountid + "/" + trid);
        if (payment == null) {
            return "redirect:/Invoice/?m=perr";
        }
        Iterator<Links> links = payment.getLinks().iterator();
        while (links.hasNext()) {
            Links link = links.next();
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                returnurl = link.getHref();
            } else {
            }
        }
        
        
        //---businessTransactions.setPaypaltransactionid(payment.getId());
        //---businessTransactions.setPaypalresponse(payment.toJSON());
        
        
        businessTransactionService.save(businessTransactions);
        
        
        //---lmTransactionLogs.setPaypalresponse(payment.toJSON());
        
        
        transactionLogsService.save(lmTransactionLogs);
        return "redirect:" + returnurl;
//        return "/Paypal/payment";
    }
    
}
