package com.enggcell.services;
import com.enggcell.entities.Contact;
import org.springframework.context.annotation.Scope;

@Scope(value = "request")

public interface ContactService {

public void save(Contact contact);

}
