package com.enggcell.services;
import com.enggcell.entities.Registrations;

import java.util.List;

import org.springframework.context.annotation.Scope;

@Scope(value = "request")

public interface RegistrationsService {

public Registrations findOne(Long id);

public Registrations findByIdAndStatusIn(Long id, List<String> status);

public Registrations findByRegidAndStatus(String id,String status);

public void save(Registrations registrations);

List<Registrations> findAll(List<String> status);

List<Registrations> findAll();

public void delete(Long id);

List<Registrations> findAllByCity(String city);

List<Registrations> findAllByBranch(String branch);

Registrations findAllByEmail(String email);

Registrations findAllByMobile(String mobile);

Registrations findAllByPanoraadhar(String panoraadhar);

}
