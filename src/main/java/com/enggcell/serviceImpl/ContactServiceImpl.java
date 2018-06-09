package com.enggcell.serviceImpl;
import com.enggcell.entities.Contact;
import com.enggcell.repositories.ContactRepository;
import com.enggcell.services.ContactService;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.context.annotation.Scope;

@Service
@Transactional
@Scope(value = "request")

public class ContactServiceImpl implements ContactService {

    @Resource
    private ContactRepository contactRepository;

    @Override
    public void save(Contact contact) {
        contactRepository.save(contact);
    }


}
