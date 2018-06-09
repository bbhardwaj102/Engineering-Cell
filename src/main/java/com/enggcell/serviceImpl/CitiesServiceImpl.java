package com.enggcell.serviceImpl;

import com.enggcell.entities.Cities;
import com.enggcell.repositories.CitiesRepository;
import com.enggcell.services.CitiesService;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.context.annotation.Scope;

@Service
@Transactional
@Scope(value = "request")

public class CitiesServiceImpl implements CitiesService {

    @Resource
    private CitiesRepository citiesRepository;

    @Override
    public Cities findOne(Long id) {
        return citiesRepository.findOne(id);
    }

    @Override
    public void save(Cities cities) {
    	citiesRepository.save(cities);
    }
    
    @Override
    public List<Cities> findAll(){
    	return citiesRepository.findAll();
    }
    
    @Override
    public void delete(Long id){
    	citiesRepository.delete(id);
    }
    
    @Override
    public List<Cities> findAllByCity(String city){
    	return citiesRepository.findAllByCity(city);
    }
}
