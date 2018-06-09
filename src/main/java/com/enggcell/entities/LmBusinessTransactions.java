/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.enggcell.entities;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author mdabhi
 */
@Entity
@Table(name = "lm_business_transactions")
@SequenceGenerator(name = "lm_business_transactions_seq", sequenceName = "lm_business_transactions_seq", allocationSize = 1)
@NamedQueries({
    @NamedQuery(name = "LmBusinessTransactions.findAll", query = "SELECT l FROM LmBusinessTransactions l")})
public class LmBusinessTransactions implements Serializable {

    private static final long serialVersionUID = 4161056592947319012L;

    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "transactionid")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "lm_business_transactions_seq")
    private Long transactionid;
    @Column(name = "businessid")
    private Long businessid;
    @Size(max = 255)
    @Column(name = "transactiontype")
    private String transactiontype;
    @Column(name = "credit")
    private BigDecimal credit;
    @Column(name = "debit")
    private BigDecimal debit;
    @Size(max = 15)
    @Column(name = "currency")
    private String currency;
    @Size(max = 4000)
    @Column(name = "instamojotransactionid")
    private String instamojotransactionid;
    @Size(max = 4000)
    @Column(name = "description")
    private String description;
    @Column(name = "transactiondate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date transactiondate;
    @Size(max = 255)
    @Column(name = "createdby")
    private String createdby;
    @Size(max = 255)
    @Column(name = "ipaddress")
    private String ipaddress;
    @Column(name = "status")
    private String status;
    @Column(name = "instamojoresponse")
    private String instamojoresponse;
    @Column(name = "enctransactionid")
    private String enctransactionid;
    @Column(name = "encaccountid")
    private String encaccountid;
    @Column(name = "regId")
    private String regId;
    
    public LmBusinessTransactions() {
    }

    public String getEncaccountid() {
        return encaccountid;
    }

    public void setEncaccountid(String encaccountid) {
        this.encaccountid = encaccountid;
    }

    public String getEnctransactionid() {
        return enctransactionid;
    }

    public void setEnctransactionid(String enctransactionid) {
        this.enctransactionid = enctransactionid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LmBusinessTransactions(Long transactionid) {
        this.transactionid = transactionid;
    }

    public Long getTransactionid() {
        return transactionid;
    }

    public void setTransactionid(Long transactionid) {
        this.transactionid = transactionid;
    }

    public Long getBusinessid() {
        return businessid;
    }

    public void setBusinessid(Long businessid) {
        this.businessid = businessid;
    }

    public String getTransactiontype() {
        return transactiontype;
    }

    public void setTransactiontype(String transactiontype) {
        this.transactiontype = transactiontype;
    }

    public BigDecimal getCredit() {
        return credit;
    }

    public void setCredit(BigDecimal credit) {
        this.credit = credit;
    }

    public BigDecimal getDebit() {
        return debit;
    }

    public void setDebit(BigDecimal debit) {
        this.debit = debit;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getRegId() {
        return regId;
    }

    public void setRegId(String regId) {
        this.regId = regId;
    }
    
    public String getInstamojotransactionid() {
		return instamojotransactionid;
	}

	public void setInstamojotransactionid(String instamojotransactionid) {
		this.instamojotransactionid = instamojotransactionid;
	}

	public String getInstamojoresponse() {
		return instamojoresponse;
	}

	public void setInstamojoresponse(String instamojoresponse) {
		this.instamojoresponse = instamojoresponse;
	}

	public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getTransactiondate() {
        return transactiondate;
    }

    public void setTransactiondate(Date transactiondate) {
        this.transactiondate = transactiondate;
    }

    public String getCreatedby() {
        return createdby;
    }

    public void setCreatedby(String createdby) {
        this.createdby = createdby;
    }

    public String getIpaddress() {
        return ipaddress;
    }

    public void setIpaddress(String ipaddress) {
        this.ipaddress = ipaddress;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (transactionid != null ? transactionid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof LmBusinessTransactions)) {
            return false;
        }
        LmBusinessTransactions other = (LmBusinessTransactions) object;
        if ((this.transactionid == null && other.transactionid != null) || (this.transactionid != null && !this.transactionid.equals(other.transactionid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.enggcell.entities.LmBusinessTransactions[ transactionid=" + transactionid + " ]";
    }

}
