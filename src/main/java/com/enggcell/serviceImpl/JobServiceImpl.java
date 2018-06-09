package com.enggcell.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.context.annotation.Scope;

import com.enggcell.entities.Job;
import com.enggcell.repositories.JobRepository;
import com.enggcell.services.JobService;

@Service
@Transactional
@Scope(value = "request")

public class JobServiceImpl implements JobService {

    @Resource
    private JobRepository jobRepository;

    @Override
    public Job findOne(Long id) {
        return jobRepository.findOne(id);
    }

    @Override
    public void save(Job registrations) {
    	jobRepository.save(registrations);
    }
    
    @Override
    public List<Job> findAll(){
    	return jobRepository.findAll();
    }
    
    @Override
    public void delete(Long id){
    	jobRepository.delete(id);
    }
    
}
