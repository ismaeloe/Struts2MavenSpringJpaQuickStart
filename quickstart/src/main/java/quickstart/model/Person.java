package quickstart.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
public class Person implements Serializable {

    private static final long serialVersionUID = 1340848518092982304L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

	// Nullable = true gives in result LEFT JOIN
	@NotNull(message="Favor de Capturar el Nombre")
	@Size(min=5 ,max=45 ,message = "El Nombre debe ser de 5 a 45 Caracteres")
	@Column(nullable = false,length=45)
    private String firstName;
    private String lastName;


    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

	@Override
	public String toString() {
		return "Person{" + "id=" + id + ", lastName=" + lastName + ", firstName=" + firstName + '}';
	}
	 
}
