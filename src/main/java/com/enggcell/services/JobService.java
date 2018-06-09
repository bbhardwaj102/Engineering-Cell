package com.enggcell.services;

import java.util.List;

import org.springframework.context.annotation.Scope;

import com.enggcell.entities.Job;

@Scope(value = "request")

public interface JobService {

public Job findOne(Long id);

public void save(Job registrations);

List<Job> findAll();

public void delete(Long id);

}
