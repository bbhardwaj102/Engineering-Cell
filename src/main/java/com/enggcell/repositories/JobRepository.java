package com.enggcell.repositories;


import com.enggcell.entities.Job;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
@Scope(value = "request")

public interface JobRepository extends JpaRepository<Job, Long> {
	
}
