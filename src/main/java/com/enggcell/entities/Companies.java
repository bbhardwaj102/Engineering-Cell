package com.enggcell.entities;


import java.io.Serializable;

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
import javax.ws.rs.Path;

import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;

@Entity
@Table(name = "companies")
//@FilterDef(name="filterByCityAndCompanyName", parameters={@ParamDef(name="city", type="string"),@ParamDef(name="companyName", type="string")})
@SequenceGenerator(name = "companies_seq", sequenceName = "companies_seq", allocationSize = 1)
@NamedQueries({
    @NamedQuery(name = "Companies.findAll", query = "SELECT r FROM Companies r")})
public class Companies implements Serializable{
	private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "companies_seq")
    @Column(name = "id")
    private Long id;
    
    @Size(max = 2147483647)
    @Column(name = "companyName")
    private String companyName;
    
    @Size(max = 2147483647)
    @Column(name = "city")
    private String city;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    
    @Size(max = 2147483647)
    @Column(name = "qualification")
    private String qualification;
    
    @Size(max = 2147483647)
    @Column(name = "profile")
    private String profile;

	@Size(max = 2147483647)
    @Column(name = "ctc")
    private String ctc;
    
	@Size(max = 2147483647)
    @Column(name = "criteria")
    private String criteria;
    
    @Size(max = 2147483647)
    @Column(name = "selectionProcess")
    private String selectionProcess;
    
    @Size(max = 2147483647)
    @Column(name = "dateOfCampus")
    private String dateOfCampus;
    
    @Size(max = 2147483647)
    @Column(name = "eligibility")
    private String eligibility;
    
    public Companies(){}
    
    public Companies(Long id){
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

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getCtc() {
		return ctc;
	}

	public void setCtc(String ctc) {
		this.ctc = ctc;
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

	public String getDateOfCampus() {
		return dateOfCampus;
	}

	public void setDateOfCampus(String dateOfCampus) {
		this.dateOfCampus = dateOfCampus;
	}

	public String getEligibility() {
		return eligibility;
	}

	public void setEligibility(String eligibility) {
		this.eligibility = eligibility;
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
        if (!(object instanceof Companies)) {
            return false;
        }
        Companies other = (Companies) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.enggcell.entities.Companies[ id=" + id + " ]";
    }
}
