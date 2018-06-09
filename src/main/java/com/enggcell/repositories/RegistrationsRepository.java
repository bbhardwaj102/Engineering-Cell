package com.enggcell.repositories;

import com.enggcell.entities.Companies;
import com.enggcell.entities.Registrations;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
@Scope(value = "request")

public interface RegistrationsRepository extends JpaRepository<Registrations, Long> {

    List<Registrations> findByStatusIn(List<String> status);

    Registrations findByIdAndStatusIn(Long id, List<String> status);

    Registrations findByRegIdAndStatus(String id, String status);
    
    List<Registrations> findAllByCity(String city);
    
    List<Registrations> findAllByBranch(String branch);
    
    Registrations findAllByEmail(String email);
    
    Registrations findAllByMobile(String mobile);
    
    Registrations findAllByPanoraadhar(String panoraadhar);
}
