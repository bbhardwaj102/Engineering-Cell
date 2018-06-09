package com.enggcell.services;

import java.util.List;

import org.springframework.context.annotation.Scope;

import com.enggcell.entities.CompanyRegistrations;

@Scope(value = "request")

public interface CompanyRegistrationsService {

public CompanyRegistrations findOne(Long id);

/*public Registrations findByIdAndStatusIn(Long id, List<String> status);

public Registrations findByRegidAndStatus(String id,String status);*/

public void save(CompanyRegistrations registrations);

//List<CompanyRegistrations> findAll(List<String> status);

List<CompanyRegistrations> findAll();

public void delete(Long id);

List<CompanyRegistrations> findAllByCity(String city);

//List<CompanyRegistrations> findAllByBranch(String branch);

}
