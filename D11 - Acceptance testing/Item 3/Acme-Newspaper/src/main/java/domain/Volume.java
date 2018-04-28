
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class Volume extends DomainEntity {

	// Attributes -------------------------------------------------------------

	private String	title;
	private String	description;
	private String	year;


	@NotBlank
	public String getTitle() {
		return this.title;
	}

	public void setTitle(final String title) {
		this.title = title;
	}

	@NotBlank
	public String getDescription() {
		return this.description;
	}

	public void setDescription(final String description) {
		this.description = description;
	}

	@Pattern(regexp = "^\\d{2}$")
	public String getYear() {
		return this.year;
	}

	public void setYear(final String year) {
		this.year = year;
	}


	//Relationships-------------------------------------------------------------

	private Collection<Newspaper>	newspapers;


	@ManyToMany(mappedBy = "volumes")
	@Valid
	@NotNull
	public Collection<Newspaper> getNewspapers() {
		return this.newspapers;
	}

	public void setNewspapers(final Collection<Newspaper> newspapers) {
		this.newspapers = newspapers;
	}

}
