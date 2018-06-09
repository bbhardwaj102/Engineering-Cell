package com.enggcell.serviceImpl;


import com.enggcell.entities.Companies;
import com.enggcell.repositories.CompaniesRepository;
import com.enggcell.services.CompanyService;

import java.lang.annotation.Annotation;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.context.annotation.Scope;
import org.springframework.data.jpa.repository.JpaRepository;

@Service
@Transactional
@Scope(value = "request")

public class CompaniesServiceImpl implements CompanyService {

    @Resource
    private CompaniesRepository companiesRepository;

    @Override
    public Companies findOne(Long id) {
        return companiesRepository.findOne(id);
    }
    
    @Override
    public List<Companies> findAll(){
    	return companiesRepository.findAll();
    }

    @Override
    public void save(Companies registrations) {
    	companiesRepository.save(registrations);
    }
    
    @Override
    public void delete(Long id){
    	companiesRepository.delete(id);
    }
    //public List<Companies> findAll(sortByCity());>
    @Override
    public List<Companies> findAllByCity(String city){
    	return companiesRepository.findAllByCity(city);
    }
    
}
