package com.enggcell.repositories;

import com.enggcell.entities.Contact;
import org.springframework.context.annotation.Scope;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
@Scope(value = "request")

public interface ContactRepository extends JpaRepository<Contact, Long> {

}
