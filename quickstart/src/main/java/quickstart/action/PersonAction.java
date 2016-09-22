package quickstart.action;

import java.util.List;

import quickstart.model.Person;
import quickstart.service.PersonService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
//import com.opensymphony.xwork2.Preparable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;

public class PersonAction implements ModelDriven<Person> { //Preparable,

    private PersonService service;
   
	 private List<Person> persons;
    private Person person;
    private Integer id;

	public PersonAction() {    
		System.out.println();
	}
    public PersonAction(PersonService _service) {
    	this.service = _service;
    }
    
	public PersonService getService() {
		return service;
	}
	//
	@Required
   @Autowired(required = true)
	public void setService(PersonService service) {
		this.service = service;
	}//*/

    public String execute() {
        this.persons = service.findAll();
        return Action.SUCCESS;
    }

    public String save() {
		 System.out.println("ACTION person =" + this.person);
		 System.out.println("service is NULL =" + (this.service==null?"Si":"No"));
        this.service.save(person);
        //this.person = new Person();
        return execute();
    }

    public String remove() {
        service.remove(id);
        return execute();
    }

    public List<Person> getPersons() {
        return persons;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void prepare() throws Exception {
        if (id != null)
            person = service.find(id);
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

	@Override
	public Person getModel() {
		//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
		return this.person;
	}
}
