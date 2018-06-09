package com.enggcell.serviceImpl;

import com.enggcell.entities.LmBusinessTransactions;
import com.enggcell.repositories.BusinessTransactionRepository;
import com.enggcell.services.BusinessTransactionService;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BusinessTransactionServiceImpl implements BusinessTransactionService {
    
    @Resource
    private BusinessTransactionRepository businessTransactionRepository;
    
    @Override
    public void save(LmBusinessTransactions businessTransactions) {
        businessTransactions.setTransactiondate(new Date());
        businessTransactionRepository.save(businessTransactions);
    }
    
    @Override
    public LmBusinessTransactions find(String encbusinessid, String enctransactionid, List<String> status) {
        return businessTransactionRepository.findTopByEncaccountidAndEnctransactionidAndStatusIn(encbusinessid, enctransactionid, status);
    }
    
}
