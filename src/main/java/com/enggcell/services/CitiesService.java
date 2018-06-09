package com.enggcell.services;
import com.enggcell.entities.Cities;
import java.util.List;
import org.springframework.context.annotation.Scope;

@Scope(value = "request")

public interface CitiesService {

public Cities findOne(Long id);

public void save(Cities cities);

List<Cities> findAll();

public void delete(Long id);

List<Cities> findAllByCity(String city);


}
