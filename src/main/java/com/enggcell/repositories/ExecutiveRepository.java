package com.enggcell.repositories;



import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.enggcell.entities.Executive;

@Repository
@Scope(value = "request")

public interface ExecutiveRepository extends JpaRepository<Executive, Long> {
	
}
