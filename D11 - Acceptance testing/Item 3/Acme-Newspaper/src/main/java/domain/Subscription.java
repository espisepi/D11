
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

@Entity
@Access(AccessType.PROPERTY)
@Table(indexes = {
	@Index(columnList = "customer_id,subscribible_id")
})
public class Subscription extends DomainEntity {

	// Attributes -------------------------------------------------------------------

	private CreditCard	creditCard;


	@Valid
	public CreditCard getCreditCard() {
		return this.creditCard;
	}

	public void setCreditCard(final CreditCard creditCard) {
		this.creditCard = creditCard;
	}


	//Relationships------------------------------------------------------------------

	private Subscribible	subscribible;
	private Customer		customer;


	@Valid
	@NotNull
	@ManyToOne(optional = false)
	public Subscribible getSubscribible() {
		return this.subscribible;
	}

	public void setSubscribible(final Subscribible subscribible) {
		this.subscribible = subscribible;
	}

	@ManyToOne(optional = false)
	@Valid
	@NotNull
	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(final Customer customer) {
		this.customer = customer;
	}

}
