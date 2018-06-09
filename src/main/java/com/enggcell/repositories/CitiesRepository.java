package com.enggcell.repositories;

import com.enggcell.entities.Cities;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
@Scope(value = "request")

public interface CitiesRepository extends JpaRepository<Cities, Long> {
	
	List<Cities> findAll();
    //List<Cities> findByStatusIn(List<String> status);

    //Cities findByIdAndStatusIn(Long id, List<String> status);

    //Cities findByRegIdAndStatus(String id, String status);
    
    List<Cities> findAllByCity(String city);
}
