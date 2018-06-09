package com.enggcell.serviceImpl;


import com.enggcell.entities.CompanyRegistrations;
import com.enggcell.repositories.CompanyRegistrationsRepository;
import com.enggcell.services.CompanyRegistrationsService;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.context.annotation.Scope;

@Service
@Transactional
@Scope(value = "request")

public class CompanyRegistrationsServiceImpl implements CompanyRegistrationsService {

    @Resource
    private CompanyRegistrationsRepository companyRegistrationsRepository;

    @Override
    public CompanyRegistrations findOne(Long id) {
        return companyRegistrationsRepository.findOne(id);
    }

    @Override
    public void save(CompanyRegistrations registrations) {
    	companyRegistrationsRepository.save(registrations);
    }
    
    @Override
    public List<CompanyRegistrations> findAll(){
    	return companyRegistrationsRepository.findAll();
    }
    
    @Override
    public void delete(Long id){
    	companyRegistrationsRepository.delete(id);
    }
    
    @Override
    public List<CompanyRegistrations> findAllByCity(String city){
    	return companyRegistrationsRepository.findAllByCity(city);
    }
    
}
