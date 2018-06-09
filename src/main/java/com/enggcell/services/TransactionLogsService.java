package com.enggcell.services;

import com.enggcell.entities.LmTransactionLogs;
import java.util.List;
import org.springframework.context.annotation.Scope;

@Scope(value = "request")
public interface TransactionLogsService {

    List<LmTransactionLogs> findAll(long accountid);

    LmTransactionLogs find(long accountid, long id);

    void save(LmTransactionLogs lmTransactionLogs);
}
