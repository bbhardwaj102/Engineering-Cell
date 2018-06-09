package com.enggcell.serviceImpl;

import com.enggcell.entities.Registrations;
import com.enggcell.repositories.RegistrationsRepository;
import com.enggcell.services.RegistrationsService;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.context.annotation.Scope;

@Service
@Transactional
@Scope(value = "request")

public class RegistrationsServiceImpl implements RegistrationsService {

    @Resource
    private RegistrationsRepository registrationsRepository;

    @Override
    public Registrations findOne(Long id) {
        return registrationsRepository.findOne(id);
    }

    @Override
    public Registrations findByIdAndStatusIn(Long id, List<String> status) {
        return registrationsRepository.findByIdAndStatusIn(id, status);
    }

    @Override
    public Registrations findByRegidAndStatus(String id, String status) {
        return registrationsRepository.findByRegIdAndStatus(id, status);
    }

    @Override
    public List<Registrations> findAll(List<String> status) {
        return registrationsRepository.findByStatusIn(status);
    }

    @Override
    public void save(Registrations registrations) {
        registrationsRepository.save(registrations);
    }
    
    @Override
    public List<Registrations> findAll(){
    	return registrationsRepository.findAll();
    }
    
    @Override
    public void delete(Long id){
    	registrationsRepository.delete(id);
    }
    
    @Override
    public List<Registrations> findAllByCity(String city){
    	return registrationsRepository.findAllByCity(city);
    }
    
    @Override
    public List<Registrations> findAllByBranch(String branch){
    	return registrationsRepository.findAllByBranch(branch);
    }

	@Override
	public Registrations findAllByEmail(String email) {
		return registrationsRepository.findAllByEmail(email);
	}

	@Override
	public Registrations findAllByMobile(String mobile) {
		return registrationsRepository.findAllByMobile(mobile);
	}

	@Override
	public Registrations findAllByPanoraadhar(String panoraadhar) {
		return registrationsRepository.findAllByPanoraadhar(panoraadhar);
	}
}
