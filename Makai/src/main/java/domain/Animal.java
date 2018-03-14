
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class Animal extends DomainEntity {

	// Constructors ----------------------------------------------------------
	public Animal() {
		super();
	}


	// Attributes -------------------------------------------------------------
	private String	name;
	private String	chipNumber;
	private Integer	age;
	private Sex		sex;
	private Byte[]	picture;


	@NotBlank
	public String getName() {
		return this.name;
	}
	public void setName(final String name) {
		this.name = name;
	}

	public String getChipNumber() {
		return this.chipNumber;
	}
	public void setChipNumber(final String chipNumber) {
		this.chipNumber = chipNumber;
	}

	@Min(0)
	public Integer getAge() {
		return this.age;
	}
	public void setAge(final Integer age) {
		this.age = age;
	}

	@NotNull
	public Sex getSex() {
		return this.sex;
	}
	public void setSex(final Sex sex) {
		this.sex = sex;
	}

	public Byte[] getPicture() {
		return this.picture;
	}
	public void setPicture(final Byte[] picture) {
		this.picture = picture;
	}


	// Relationships ----------------------------------------------------------
	private AnimalShelter		animalShelter;
	private Customer			customer;
	private Collection<Breed>	breeds;


	@Valid
	@NotNull
	@ManyToOne(optional = true)
	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(final Customer customer) {
		this.customer = customer;
	}

	@Valid
	@NotNull
	@ManyToOne(optional = true)
	public AnimalShelter getAnimalShelter() {
		return this.animalShelter;
	}

	public void setAnimalShelter(final AnimalShelter animalShelter) {
		this.animalShelter = animalShelter;
	}

	@Valid
	@NotNull
	@ManyToMany()
	public Collection<Breed> getBreeds() {
		return this.breeds;
	}

	public void setBreeds(final Collection<Breed> breeds) {
		this.breeds = breeds;
	}

}