/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.enggcell.entities;

import java.io.Serializable;
import java.math.BigInteger;
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
@Table(name = "lm_transaction_logs")
@SequenceGenerator(name = "lm_transaction_logs_seq", sequenceName = "lm_transaction_logs_seq", allocationSize = 1)
@NamedQueries({
    @NamedQuery(name = "LmTransactionLogs.findAll", query = "SELECT l FROM LmTransactionLogs l")})
public class LmTransactionLogs implements Serializable {

    private static final long serialVersionUID = -9139646802661592132L;

    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "logid")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "lm_transaction_logs_seq")
    private Long logid;
    @Column(name = "transactionid")
    private Long transactionid;
    @Size(max = 255)
    @Column(name = "createdby")
    private String createdby;
    @Column(name = "description")
    private String description;
    @Column(name = "loggedinaccountid")
    private Long loggedinaccountid;
    @Size(max = 2147483647)
    @Column(name = "instamojoresponse")
    private String instamojoresponse;
    @Column(name = "createddate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createddate;
    @Column(name = "regId")
    private String regId;

    public LmTransactionLogs() {
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LmTransactionLogs(Long logid) {
        this.logid = logid;
    }

    public Long getLogid() {
        return logid;
    }

    public void setLogid(Long logid) {
        this.logid = logid;
    }

    public Long getTransactionid() {
        return transactionid;
    }

    public void setTransactionid(Long transactionid) {
        this.transactionid = transactionid;
    }

    public String getCreatedby() {
        return createdby;
    }

    public void setCreatedby(String createdby) {
        this.createdby = createdby;
    }

    public Long getLoggedinaccountid() {
        return loggedinaccountid;
    }

    public void setLoggedinaccountid(Long loggedinaccountid) {
        this.loggedinaccountid = loggedinaccountid;
    }
    
    public String getInstamojoresponse() {
		return instamojoresponse;
	}

	public void setInstamojoresponse(String instamojoresponse) {
		this.instamojoresponse = instamojoresponse;
	}

	public Date getCreateddate() {
        return createddate;
    }

    public void setCreateddate(Date createddate) {
        this.createddate = createddate;
    }

    public String getRegId() {
        return regId;
    }

    public void setRegId(String regId) {
        this.regId = regId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (logid != null ? logid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof LmTransactionLogs)) {
            return false;
        }
        LmTransactionLogs other = (LmTransactionLogs) object;
        if ((this.logid == null && other.logid != null) || (this.logid != null && !this.logid.equals(other.logid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.enggcell.entities.LmTransactionLogs[ logid=" + logid + " ]";
    }

}
