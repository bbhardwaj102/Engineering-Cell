package com.enggcell.repositories;

import com.enggcell.entities.LmTransactionLogs;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TransactionLogsRepository extends JpaRepository<LmTransactionLogs, Long> {

    List<LmTransactionLogs> findByLoggedinaccountid(long accountid);

    LmTransactionLogs findTopByLoggedinaccountidAndLogid(long accountid, long id);
}
