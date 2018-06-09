package com.enggcell.serviceImpl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.context.annotation.Scope;

import com.enggcell.entities.Executive;
import com.enggcell.repositories.ExecutiveRepository;
import com.enggcell.services.ExecutiveService;

@Service
@Transactional
@Scope(value = "request")

public class ExecutiveServiceImpl implements ExecutiveService {

    @Resource
    private ExecutiveRepository executiveRepository;

    @Override
    public Executive findOne(Long id) {
        return executiveRepository.findOne(id);
    }

    @Override
    public void save(Executive registrations) {
    	executiveRepository.save(registrations);
    }
    
    @Override
    public List<Executive> findAll(){
    	return executiveRepository.findAll();
    }
    
    @Override
    public void delete(Long id){
    	executiveRepository.delete(id);
    }
    
}
