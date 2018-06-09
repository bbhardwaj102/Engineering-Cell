package com.enggcell.repositories;


import com.enggcell.entities.Companies;
import com.enggcell.entities.Registrations;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
@Scope(value = "request")

public interface CompaniesRepository extends JpaRepository<Companies, Long> {
	List<Companies> findAll();
	List<Companies> findAllByCity(String city);
}
