/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.enggcell.BusinessService;

import com.enggcell.utilities.Constant;
import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author 1007
 */
public class PayWithPaypal {

    public Payment payment(String amountToPay, String totalShippingAmount, String totalTax, String actualAmount, String currency, String descriptionForPayment, String itemName, String QuantityofItem, String paymentIntent, String acceptUrl, String cancelUrl) {

        Details details = new Details();
        details.setShipping(totalShippingAmount);
        details.setSubtotal(actualAmount);
        details.setTax(totalTax);
        Amount amount = new Amount();
        amount.setCurrency(currency);
        Double total = Double.parseDouble(totalShippingAmount) + Double.parseDouble(actualAmount) + Double.parseDouble(totalTax);
        amount.setTotal(total.toString());
        amount.setDetails(details);
        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription(descriptionForPayment);
        com.paypal.api.payments.Item item = new Item();
        item.setName(itemName).setQuantity(QuantityofItem).setCurrency(currency).setPrice(actualAmount);
        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<Item>();
        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);
        List<Transaction> transactions = new ArrayList<Transaction>();
        transactions.add(transaction);

        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");
        Payment payment = new Payment();
        payment.setIntent(paymentIntent);
        payment.setPayer(payer);
        payment.setTransactions(transactions);
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl(cancelUrl);
        redirectUrls.setReturnUrl(acceptUrl);
        payment.setRedirectUrls(redirectUrls);
        APIContext apiContext = new APIContext(Constant.PAYPAL_CLIENT_ID, Constant.PAYPAL_CLIENT_SECRET, Constant.PAYPAL_MODE);

        try {
            Payment createdPayment = payment.create(apiContext);

            Iterator<Links> links = createdPayment.getLinks().iterator();
            while (links.hasNext()) {
                Links link = links.next();
                if (link.getRel().equalsIgnoreCase("approval_url")) {
                } 
            }
            return createdPayment;

        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Payment getPaymentDetails(String paymentid) {
        try {
            APIContext apiContext = new APIContext(Constant.PAYPAL_CLIENT_ID, Constant.PAYPAL_CLIENT_SECRET, Constant.PAYPAL_MODE);
            Payment payment = Payment.get(apiContext, paymentid);
            return payment;
        } catch (Exception e) {
        }
        return null;
    }

    public Payment ExecutePayment(String paymentid, String payerId) {
        try {
            APIContext apiContext = new APIContext(Constant.PAYPAL_CLIENT_ID, Constant.PAYPAL_CLIENT_SECRET, Constant.PAYPAL_MODE);
            Payment payment = Payment.get(apiContext, paymentid);
            PaymentExecution execution = new PaymentExecution();
            execution.setPayerId(payerId);
            payment.execute(apiContext, execution);
            return payment;
        } catch (Exception e) {
        }
        return null;
    }
}
