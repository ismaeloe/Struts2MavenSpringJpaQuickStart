package quickstart;

import static org.junit.Assert.*;

import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.RollbackException;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.eclipse.persistence.exceptions.DatabaseException;
//import org.hibernate.exception.ConstraintViolationException;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;

//import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import quickstart.model.Person;
import quickstart.service.PersonServiceImpl;

public class TestQuickStart {

	private static EntityManagerFactory EMF;
	private static EntityManager EM;
	Person person;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		EMF = Persistence.createEntityManagerFactory("TESTpunit");
		EM = EMF.createEntityManager();
		
		this.person = new Person();
		this.person.setFirstName("NAME 1");
		this.person.setLastName("Last1");
	}

	@After
	public void tearDown() throws Exception {
		if (EM != null) {
			EM.clear();
			EM.close();
		}
		if (EMF != null) {
			EMF.close();
		}
		if (this.person != null) {
			this.person = null;
		}
	}

	@Test
	public void PersonCreate()
	{
		System.out.println("PersonCreate()");
		try{
			//ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
			//Validator validator = factory.getValidator();
			//validator.validate(this.person, null);
			
			EM.getTransaction().begin();
			
			PersonServiceImpl 	facade = new PersonServiceImpl();
								facade.setEntityManager(EM);

			this.person.setId(8);
			//this.person.setFirstName(null);
			this.person.setFirstName("123456789 123456789 123456789 1234"); // 123456789 123456789

			facade.save(person);
			
			EM.getTransaction().commit();
			
			assertNotNull("Person IS NULL", this.person);
			assertNotNull("Person.Id IS NULL", this.person.getId());
			
		}catch(ConstraintViolationException ex) { //INSERT.PERSIST
			
			System.out.println(ex.getClass().getSimpleName()+ "." + ex.getMessage());
			
            ConstraintViolation<?> violation = ex.getConstraintViolations().iterator().next();
            System.err.println("violation.getPropertyPath() =" + violation.getPropertyPath().toString()) ;
            System.err.println("violation.getConstraintDescriptor().getAnnotation().annotationType() =" + violation.getConstraintDescriptor().getAnnotation().annotationType()) ;
			//final Set<ConstraintViolation<?>> errors = ex.getConstraintViolations();
            System.err.println("violation.getMessage() =" + violation.getMessage()) ;
            fail( violation.getMessage() );

		}catch(RollbackException rex) {			//UPDATE.MERGE

			System.out.println(rex.getClass().getSimpleName()+ "." + rex.getMessage());
			
			Object 	obj =rex.getCause();
			if (	obj instanceof ConstraintViolationException)
			{
				ConstraintViolationException ex = ((ConstraintViolationException)obj); //.getConstraintViolations().iterator().next();
	            ConstraintViolation<?> violation = ex.getConstraintViolations().iterator().next();	            
	            System.err.println("violation.getPropertyPath() =" + violation.getPropertyPath().toString()) ;
	            System.err.println("violation.getConstraintDescriptor().getAnnotation().annotationType() =" + violation.getConstraintDescriptor().getAnnotation().annotationType()) ;
				//final Set<ConstraintViolation<?>> errors = ex.getConstraintViolations();
	            System.err.println("violation.getMessage() =" + violation.getMessage()) ;
	            fail( violation.getMessage() );
			}
            fail( rex.getMessage() );
		}catch(DatabaseException ex) {
			//internal MySQLIntegrityConstraintViolationException: Column 'IdReligion' cannot be null
			//Internal Exception: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column 'firstName' at row 1
			System.out.println(ex.getClass().getSimpleName()+ "." + ex.getMessage());
            fail( ex.getMessage() );
		}catch(Exception ex){
			//EM.getTransaction().rollback();
			//ex.printStackTrace();
			System.out.println(ex.getClass().getSimpleName()+ "." + ex.getMessage());
			assertTrue(ex.getMessage() ,false);
		}finally{
			System.out.println("Person =" + this.person);	
		}		
	}

	//@Test
	@Ignore
	public void PersonFind()
	{
		//fail("Not yet implemented");
		System.out.println("PersonFind()");
		try{
		
			PersonServiceImpl facade = new PersonServiceImpl();
			
			//EM.getTransaction().begin();			
						facade.setEntityManager(EM);
			this.person=facade.find(2);
			//EM.getTransaction().commit();
			
			assertNotNull("Person IS NULL", this.person);
			assertNotNull("Person.Id IS NULL", this.person.getId());
			
		}catch(DatabaseException ex) {
			//internal MySQLIntegrityConstraintViolationException 
			System.out.println(ex.getClass().getSimpleName()+ "." + ex.getMessage());
			assertTrue(ex.getMessage() ,false);
		}catch(Exception ex){
			//EM.getTransaction().rollback();
			//ex.printStackTrace();
			System.out.println(ex.getClass().getSimpleName()+ "." + ex.getMessage());
			assertTrue(ex.getMessage() ,false);
		}finally{
			System.out.println("Person =" + this.person);	
		}		
	}

}
