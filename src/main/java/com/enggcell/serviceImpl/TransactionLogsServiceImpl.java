package com.enggcell.serviceImpl;

import com.enggcell.entities.LmTransactionLogs;
import com.enggcell.repositories.TransactionLogsRepository;
import com.enggcell.services.TransactionLogsService;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TransactionLogsServiceImpl implements TransactionLogsService {

    @Resource
    private TransactionLogsRepository transactionlogsRepository;

    @Override
    public List<LmTransactionLogs> findAll(long accountid) {
        return transactionlogsRepository.findByLoggedinaccountid(accountid);
    }

    @Override
    public LmTransactionLogs find(long accountid, long id) {
        return transactionlogsRepository.findTopByLoggedinaccountidAndLogid(accountid, id);
    }

    @Override
    public void save(LmTransactionLogs lmTransactionLogs) {
        if (lmTransactionLogs.getLogid()== null) {
            lmTransactionLogs.setCreateddate(new Date());
        }
        transactionlogsRepository.save(lmTransactionLogs);
    }
}
