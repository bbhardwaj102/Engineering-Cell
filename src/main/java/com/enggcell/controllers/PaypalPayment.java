/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.enggcell.controllers;

import com.paypal.api.payments.Payment;
import com.enggcell.BusinessService.PayWithPaypal;
import com.enggcell.Constants.TransactionStatusEnum;
import com.enggcell.entities.LmBusinessTransactions;
import com.enggcell.entities.LmTransactionLogs;
import com.enggcell.services.BusinessTransactionService;
import com.enggcell.services.TransactionLogsService;
import com.enggcell.utilities.CommonsUtil;
import com.enggcell.utilities.Constant;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
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
@RequestMapping(value = "/PaypalPayment")
@Controller
public class PaypalPayment {

    @Autowired
    private BusinessTransactionService businessTransactionService;
    @Autowired
    private TransactionLogsService transactionLogsService;

    //@RequestMapping(value = "/success/{accountid}/{transactionid}", method = RequestMethod.GET)
    @RequestMapping(value = "/success/", method = RequestMethod.GET)
    public String success(Model model, HttpServletRequest request, @PathVariable("accountid") String accountid, @PathVariable("transactionid") String transactionid) {

        try {

            String paypalTransactionID = "";
            if ((request.getParameter("paymentId") == null || request.getParameter("paymentId").equals(""))) {
                return "redirect:/Invoice/?m=perr";
            }
            PayWithPaypal payWithPaypal = new PayWithPaypal();
            Payment payment = null;
            try {
                payment = payWithPaypal.ExecutePayment(request.getParameter("paymentId"), request.getParameter("PayerID"));
            } catch (Exception e) {
                return "redirect:/Invoice/?m=perr";
            }
            if (payment == null) {
                return "redirect:/Invoice/?m=perr";
            }

            paypalTransactionID = payment.getId();
            LmTransactionLogs lmTransactionLogs = new LmTransactionLogs();
//            lmTransactionLogs.setCreatedby(logedinAccounts.getEmailaddress());
            lmTransactionLogs.setCreateddate(new Date());
            lmTransactionLogs.setDescription("Transaction pending.");
//            lmTransactionLogs.setLoggedinaccountid(logedinAccounts.getAccountid());
            
            
            //---lmTransactionLogs.setPaypalresponse(payWithPaypal.getPaymentDetails(request.getParameter("paymentId")).toJSON());
            
            
            transactionLogsService.save(lmTransactionLogs);

            LmBusinessTransactions businessTransactions = businessTransactionService.find(accountid, transactionid, CommonsUtil.transactionStatus());
            if (businessTransactions == null) {
                return "redirect:/Invoice/?m=perr";
            }
            
            
            
            //---businessTransactions.setPaypalresponse(payment.toJSON());
            //---businessTransactions.setPaypaltransactionid(paypalTransactionID);
            
            
            
            if (businessTransactions.getStatus().equals(TransactionStatusEnum.SUCCESS.toString())) {

            } else {
                if (!(payment.getTransactions().get(0).getAmount() == null)) {
                    if (businessTransactions.getCredit().setScale(2).compareTo(new BigDecimal(payment.getTransactions().get(0).getAmount().getTotal())) != 0) {
                        businessTransactions.setCredit(new BigDecimal(payment.getTransactions().get(0).getAmount().getTotal()));
                    }
                }

                if (paypalTransactionID.equals("")) {
                    businessTransactions.setStatus(TransactionStatusEnum.FAILED.toString());
                } else {
                    businessTransactions.setStatus(TransactionStatusEnum.SUCCESS.toString());
                }
            }

            businessTransactionService.save(businessTransactions);

            lmTransactionLogs.setTransactionid(businessTransactions.getTransactionid());
            lmTransactionLogs.setDescription("Transaction success.");
            transactionLogsService.save(lmTransactionLogs);

            if (businessTransactions.getStatus().equals(TransactionStatusEnum.FAILED.toString())) {
                return "redirect:/Invoice/?m=perr";
            } else {
                return "redirect:/Invoice/print/"+businessTransactions.getRegId()+"?m=c";
            }
        } catch (Exception e) {
            return "redirect:/Invoice/?m=perr";
        }

    }


    @RequestMapping(value = "/cancel/{accountid}/{transactionid}", method = RequestMethod.GET)
    public String cancel(Model model, HttpServletRequest request, @PathVariable("accountid") String accountid, @PathVariable("transactionid") String transactionid) {
        synchronized (PaypalPayment.class) {
            CommonsUtil commonsUtil = new CommonsUtil();

            PayWithPaypal payWithPaypal = new PayWithPaypal();
            Payment payment = null;
            try {
                payment = payWithPaypal.getPaymentDetails(request.getParameter("paymentId"));
            } catch (Exception e) {
                e.printStackTrace();
                return "redirect:/Invoice/?m=perr";
            }
            if (payment == null) {
                return "redirect:/Invoice/?m=perr";
            }
            LmTransactionLogs lmTransactionLogs = new LmTransactionLogs();
//            lmTransactionLogs.setCreatedby(logedinAccounts.getEmailaddress());
            lmTransactionLogs.setCreateddate(new Date());
            lmTransactionLogs.setDescription("Transaction canceled.");
//            lmTransactionLogs.setLoggedinaccountid(logedinAccounts.getAccountid());
            
            
            //---lmTransactionLogs.setPaypalresponse(accountid + "," + transactionid);
            
            
            transactionLogsService.save(lmTransactionLogs);

            LmBusinessTransactions businessTransactions = businessTransactionService.find(accountid, transactionid, CommonsUtil.transactionStatus());
            if (businessTransactions == null) {
                return "redirect:/Invoice/?m=perr";
            }
            businessTransactions.setStatus(TransactionStatusEnum.CANCELED.toString());
            businessTransactionService.save(businessTransactions);

            lmTransactionLogs.setTransactionid(businessTransactions.getTransactionid());
            transactionLogsService.save(lmTransactionLogs);

            commonsUtil = null;
            if (businessTransactions.getStatus().equals(TransactionStatusEnum.FAILED.toString())) {
                return "redirect:/Invoice/?m=perr";
            } else {
                return "redirect:/Invoice/?m=perr";
            }
        }
    }

}
