package quickstart.service;

import java.util.List;
import org.springframework.stereotype.Service;

import quickstart.model.Person;

@Service
public interface PersonService {
    public List<Person> findAll();

    public void save(Person person);

    public void remove(int id);

    public Person find(int id);
}
