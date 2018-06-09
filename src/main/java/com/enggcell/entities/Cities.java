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
@Table(name = "cities")
//@FilterDef(name="filterByCityAndCompanyName", parameters={@ParamDef(name="city", type="string"),@ParamDef(name="companyName", type="string")})
@SequenceGenerator(name = "cities_seq", sequenceName = "cities_seq", allocationSize = 1)
@NamedQueries({
    @NamedQuery(name = "Cities.findAll", query = "SELECT r FROM Cities r")})
public class Cities implements Serializable{
	private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cities_seq")
    @Column(name = "id")
    private Long id;
    
    @Size(max = 2147483647)
    @Column(name = "city")
    private String city;
    
    
    @Size(max = 2147483647)
    @Column(name = "college")
    private String college;
    
    @Size(max = 2147483647)
    @Column(name = "address")
    private String address;

	@Size(max = 2147483647)
    @Column(name = "date")
    private String date;
	
	@Size(max = 2147483647)
    @Column(name = "time")
    private String time;
	
	@Size(max = 2147483647)
    @Column(name = "regPrice")
    private String regPrice;
	
	@Size(max = 2147483647)
    @Column(name = "availSeats")
    private String availSeats;
	
	@Size(max = 2147483647)
    @Column(name = "cityImage")
    private String cityImage;
    
	@Size(max = 2147483647)
    @Column(name = "townscriptLink")
    private String townscriptLink;
	
	@Size(max = 2147483647)
    @Column(name = "imageCity")
    private byte[] imageCity;
    
    public Cities(){}
    
    public Cities(Long id){
    	this.id = id;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	public String getTownscriptLink() {
		return townscriptLink;
	}

	public void setTownscriptLink(String townscriptLink) {
		this.townscriptLink = townscriptLink;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getRegPrice() {
		return regPrice;
	}

	public void setRegPrice(String regPrice) {
		this.regPrice = regPrice;
	}

	public String getAvailSeats() {
		return availSeats;
	}

	public void setAvailSeats(String availSeats) {
		this.availSeats = availSeats;
	}

	public String getCityImage() {
		return cityImage;
	}

	public void setCityImage(String cityImage) {
		this.cityImage = cityImage;
	}

	public byte[] getImageCity() {
		return imageCity;
	}

	public void setImageCity(byte[] imageCity) {
		this.imageCity = imageCity;
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
        if (!(object instanceof Cities)) {
            return false;
        }
        Cities other = (Cities) object;
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
