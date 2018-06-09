/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.enggcell.entities;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;

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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author parentsgift
 */
@Entity
@Table(name = "companyregistrations")
@SequenceGenerator(name = "companyregistrations_seq", sequenceName = "companyregistrations_seq", allocationSize = 1)
@NamedQueries({
    @NamedQuery(name = "CompanyRegistrations.findAll", query = "SELECT r FROM CompanyRegistrations r")})
public class CompanyRegistrations implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "companyregistrations_seq")
    @Column(name = "id")
    private Long id;
    @Size(max = 2147483647)
    @Column(name = "companyName")
    private String companyName;
    @Size(max = 2147483647)
    @Column(name = "contactPersonName")
    private String contactPersonName;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    
    @Size(max = 2147483647)
    @Column(name = "personDesignation")
    private String personDesignation;
    @Size(max = 2147483647)
    @Column(name = "companyAddress")
    private String companyAddress;
	@Size(max = 2147483647)
    @Column(name = "companyPhone")
    private String companyPhone;
	@Size(max = 2147483647)
    @Column(name = "personMobile")
    private String personMobile;
    @Size(max = 2147483647)
    @Column(name = "fax")
    private String fax;
    
    @Size(max = 2147483647)
    @Column(name = "email")
    private String email;
    @Size(max = 2147483647)
    @Column(name = "jobDetails")
    private Object[] jobDetails;
    
    @Size(max = 2147483647)
    @Column(name = "approxPos")
    private String approxPos;
    
    @Size(max = 2147483647)
    @Column(name = "dateOfInter")
    private String dateOfInter;
    
    @Size(max = 2147483647)
    @Column(name = "city")
    private String city;
    
    @Size(max = 2147483647)
    @Column(name = "eligibility")
    private String eligibility;
    
    @Size(max = 2147483647)
    @Column(name = "criteria")
    private String criteria;
    
    @Size(max = 2147483647)
    @Column(name = "selectionProcess")
    private String selectionProcess;
    
    @Size(max = 2147483647)
    @Column(name = "executives")
    private Object[] executives;
    
    @Size(max = 2147483647)
    @Column(name = "regDate")
    private String regDate;
    
    @Size(max = 2147483647)
    @Column(name = "regId")
    private String regId;
    
    

    public CompanyRegistrations() {
    }

    public CompanyRegistrations(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getContactPersonName() {
		return contactPersonName;
	}

	public void setContactPersonName(String contactPersonName) {
		this.contactPersonName = contactPersonName;
	}

	public String getPersonDesignation() {
		return personDesignation;
	}

	public void setPersonDesignation(String personDesignation) {
		this.personDesignation = personDesignation;
	}

	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

	public String getCompanyPhone() {
		return companyPhone;
	}

	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}

	public String getPersonMobile() {
		return personMobile;
	}

	public void setPersonMobile(String personMobile) {
		this.personMobile = personMobile;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public String getApproxPos() {
		return approxPos;
	}

	public void setApproxPos(String approxPos) {
		this.approxPos = approxPos;
	}
	
	public String getCity() {
		return city;
	}
	
	public String getEligibility() {
		return eligibility;
	}

	public void setEligibility(String eligibility) {
		this.eligibility = eligibility;
	}

	public String getCriteria() {
		return criteria;
	}

	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}
	
	public String getSelectionProcess() {
		return selectionProcess;
	}

	public void setSelectionProcess(String selectionProcess) {
		this.selectionProcess = selectionProcess;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDateOfInter() {
		return dateOfInter;
	}

	public void setDateOfInter(String dateOfInter) {
		this.dateOfInter = dateOfInter;
	}

	public Object[] getJobDetails() {
		return jobDetails;
	}

	public void setJobDetails(Object[] jobDetails) {
		this.jobDetails = jobDetails;
	}

	public Object[] getExecutives() {
		return executives;
	}

	public void setExecutives(Object[] executives) {
		this.executives = executives;
	}
	
	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CompanyRegistrations)) {
            return false;
        }
        CompanyRegistrations other = (CompanyRegistrations) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.enggcell.entities.Registrations[ id=" + id + " ]";
    }
    
}
