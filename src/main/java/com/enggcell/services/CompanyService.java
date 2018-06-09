package com.enggcell.services;

import com.enggcell.entities.Companies;
import com.enggcell.entities.Registrations;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.data.domain.Sort;

@Scope(value = "request")

public interface CompanyService {

public Companies findOne(Long id);

public List<Companies> findAll();

public void save(Companies registrations);

public void delete(Long id);

public List<Companies> findAllByCity(String city);

//public List<Companies> findAll(Sort sort);


}

