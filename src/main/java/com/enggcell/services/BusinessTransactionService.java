package com.enggcell.services;

import com.enggcell.entities.LmBusinessTransactions;
import java.util.List;
import org.springframework.context.annotation.Scope;

@Scope(value = "request")
public interface BusinessTransactionService {

    void save(LmBusinessTransactions businessTransactions);

    LmBusinessTransactions find(String encbusinessid, String enctransactionid, List<String> status);

}
