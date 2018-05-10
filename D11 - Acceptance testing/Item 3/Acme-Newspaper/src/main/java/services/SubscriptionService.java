
package services;

import java.util.Calendar;
import java.util.Collection;
import java.util.GregorianCalendar;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.SubscriptionRepository;
import domain.CreditCard;
import domain.Customer;
import domain.Newspaper;
import domain.Subscribible;
import domain.Subscription;

@Service
@Transactional
public class SubscriptionService {

	// Managed repository -----------------------------------------------------

	@Autowired
	SubscriptionRepository	subscriptionRepository;

	// Supporting services ----------------------------------------------------

	@Autowired
	CustomerService			customerService;

	@Autowired
	NewspaperService		newspaperService;

	@Autowired
	VolumeService			volumeService;

	//Importar la que pertenece a Spring
	@Autowired
	private Validator		validator;


	// Constructors -----------------------------------------------------------

	public SubscriptionService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	//CREATE
	public Subscription create(final int subscribibleId) {
		Subscription result;
		Customer customerPrincipal;
		Newspaper newspaper;

		newspaper = this.newspaperService.findOne(newspaperId);

		Assert.isTrue(!newspaper.isOpen(), "the subscribible must be private");
		customerPrincipal = this.customerService.findByPrincipal();
		result = new Subscription();
		result.setCustomer(customerPrincipal);
		result.setSubscribible(newspaper);

		return result;
	}

	public Subscription create(final int subscribibleId, final Customer customer) {
		Subscription result;
		Subscribible subscribible;

		subscribible = this.newspaperService.findOne(subscribibleId);
		Assert.isTrue(!newspaper.isOpen(), "the subscribible must be private");
		result = new Subscription();
		result.setCustomer(customer);
		result.setSubscribible(subscribible);

		return result;
	}

	//SAVE
	public Subscription save(final Subscription subscription) {
		Customer customerPrincipal;
		Subscription result;

		Assert.notNull(subscription);
		customerPrincipal = this.customerService.findByPrincipal();
		Assert.isTrue(!customerPrincipal.getSubcriptions().contains(subscription), "el cliente ya esta subscrito a este periodico");
		Assert.isTrue(subscription.getCustomer().equals(customerPrincipal), "El cliente de la subscripcion debe ser el mismo que el logueado");
		Assert.isTrue(!subscription.getSubscribible().isOpen(), "solo se pueden subscribir a los periodicos privados");
		Assert.notNull(subscription.getSubscribible().getPublicationDate(), "solo se pueden subscribir a los periodicos publicados");
		Assert.isTrue(this.checkCreditCard(subscription.getCreditCard()), "Invalid credit card");

		result = this.subscriptionRepository.save(subscription);
		return result;
	}

	public Subscription save(final Subscription subscription, final Customer customer) {
		Subscription result;

		Assert.notNull(subscription);
		Assert.isTrue(!customer.getSubcriptions().contains(subscription), "el cliente ya esta subscrito a este periodico");
		Assert.isTrue(subscription.getCustomer().equals(customer), "El cliente de la subscripcion debe ser el mismo que el logueado");
		Assert.isTrue(!subscription.getSubscribible().isOpen(), "solo se pueden subscribir a los periodicos privados");
		Assert.notNull(subscription.getSubscribible().getPublicationDate(), "solo se pueden subscribir a los periodicos publicados");
		Assert.isTrue(this.checkCreditCard(subscription.getCreditCard()), "Invalid credit card");

		result = this.subscriptionRepository.save(subscription);
		return result;
	}

	public void flush() {
		this.subscriptionRepository.flush();
	}

	// Other business methods -------------------------------------------------

	public Subscription reconstruct(final Subscription subscription, final BindingResult binding) {
		Subscription result;
		final Customer customerPrincipal;
		if (subscription.getId() == 0) {

			Assert.isTrue(!subscription.getSubscribible().isOpen(), "the subscribible must be private");
			customerPrincipal = this.customerService.findByPrincipal();
			subscription.setCustomer(customerPrincipal);

			result = subscription;
		} else {
			Assert.notNull(null, "a subscription can not be modified");
			result = subscription;
		}
		this.validator.validate(result, binding);
		return result;
	}

	public Subscription reconstruct(final Subscription subscription) {
		Subscription result;
		final Customer customerPrincipal;
		if (subscription.getId() == 0) {

			Assert.isTrue(!subscription.getSubscribible().isOpen(), "the subscribible must be private");
			customerPrincipal = this.customerService.findByPrincipal();
			subscription.setCustomer(customerPrincipal);

			result = subscription;
		} else {
			Assert.notNull(null, "a subscription can not be modified");
			result = subscription;
		}
		//recontruct sin validaciones, estas ya las hace underwrite
		return result;
	}

	public Subscription reconstruct(final Subscription subscription, final Customer customer) {
		Subscription result;
		if (subscription.getId() == 0) {

			Assert.isTrue(!subscription.getSubscribible().isOpen(), "the subscribible must be private");
			subscription.setCustomer(customer);

			result = subscription;
		} else {
			Assert.notNull(null, "a subscription can not be modified");
			result = subscription;
		}
		//recontruct sin validaciones, estas ya las hace underwrite
		return result;
	}

	public Collection<Subscription> findSubscriptionBySubscribible(final int subscribibleId) {

		Collection<Subscription> result;

		result = this.subscriptionRepository.findSubscriptionBySubscribible(subscribibleId);

		return result;
	}

	public boolean checkCreditCard(final CreditCard creditCard) {
		boolean res;
		Calendar calendar;
		int actualYear;
		int actualMonth;

		res = false;
		calendar = new GregorianCalendar();
		actualYear = calendar.get(Calendar.YEAR);
		actualMonth = (calendar.get(Calendar.MONTH) + 1);
		actualYear = actualYear % 100;
		actualMonth = actualMonth % 100;
		if (creditCard.getExpirationYear() != null)
			if (Integer.parseInt(creditCard.getExpirationYear()) > actualYear)
				res = true;
			else if (Integer.parseInt(creditCard.getExpirationYear()) == actualYear && Integer.parseInt(creditCard.getExpirationMonth()) > calendar.get(Calendar.MONTH) + 1)
				res = true;
			else if (Integer.parseInt(creditCard.getExpirationYear()) == actualYear && Integer.parseInt(creditCard.getExpirationMonth()) == actualMonth)
				res = false;
		return res;
	}

}
