package com.enggcell.repositories;



import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.enggcell.entities.CompanyRegistrations;

@Repository
@Scope(value = "request")

public interface CompanyRegistrationsRepository extends JpaRepository<CompanyRegistrations, Long> {

    /*List<CompanyRegistrations> findByStatusIn(List<String> status);

    CompanyRegistrations findByIdAndStatusIn(Long id, List<String> status);

    CompanyRegistrations findByRegIdAndStatus(String id, String status);
    List<Registrations> findAllByBranch(String branch);*/
	List<CompanyRegistrations> findAllByCity(String city);
}
