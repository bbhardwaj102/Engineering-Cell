package com.enggcell.services;

import java.util.List;

import org.springframework.context.annotation.Scope;

import com.enggcell.entities.Executive;

@Scope(value = "request")

public interface ExecutiveService {

public Executive findOne(Long id);

public void save(Executive registrations);

List<Executive> findAll();

public void delete(Long id);

}
