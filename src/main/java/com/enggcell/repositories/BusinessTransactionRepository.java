package com.enggcell.repositories;

import com.enggcell.entities.LmBusinessTransactions;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BusinessTransactionRepository extends JpaRepository<LmBusinessTransactions, Long> {

    LmBusinessTransactions findTopByEncaccountidAndEnctransactionidAndStatusIn(String encbusinessid, String enctransactionid, List<String> status);

}
