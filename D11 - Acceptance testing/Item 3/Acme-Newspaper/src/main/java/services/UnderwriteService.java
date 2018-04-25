
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

import repositories.UnderwriteRepository;
import domain.CreditCard;
import domain.Customer;
import domain.Newspaper;
import domain.Subscription;
import domain.Underwrite;
import domain.Volume;

@Service
@Transactional
public class UnderwriteService {

	@Autowired
	UnderwriteRepository	underwriteRepository;

	@Autowired
	VolumeService			volumeService;

	@Autowired
	CustomerService			customerService;

	@Autowired
	SubscriptionService		subscriptionService;

	@Autowired
	NewspaperService		newspaperService;

	@Autowired
	private Validator		validator;


	public UnderwriteService() {
	}
	// Simple CRUD methods ----------------------------------------------------

	//CREATE
	public Underwrite create(final int volumeId) {
		Underwrite result;
		Volume volume;

		volume = this.volumeService.findOne(volumeId);
		result = new Underwrite();
		result.setVolume(volume);

		return result;
	}

	//SAVE
	public Underwrite save(final Underwrite underwrite, BindingResult binding) {
		Customer customerPrincipal;
		Underwrite result;
		Subscription subcripcion;
		Assert.notNull(underwrite);
		customerPrincipal = this.customerService.findByPrincipal();
		Assert.isTrue(!this.volumeService.volumesWithUnderwriteOneCustomer().contains(underwrite.getVolume()), "this subcription al ready exits");

		//newspapaer a las que ahi que susbcribirse
		Collection<Newspaper> newspapersnewsupcription;
		newspapersnewsupcription = underwrite.getVolume().getNewspapers();
		//newspapaer a las que ya estoy subscrito
		Collection<Newspaper> newspapersubcripto;
		newspapersubcripto = this.newspaperService.findNewspapersSubscribedByCustomerId(customerPrincipal.getId());
		//TODO subscribirse a un volumen significa subscribirsea todos sus periodicos.
		newspapersnewsupcription.removeAll(newspapersubcripto);

		Assert.isTrue(this.checkCreditCard(underwrite.getCreditCard()), "Invalid credit card");
		result = this.underwriteRepository.save(underwrite);
		customerPrincipal.getUnderwrites().add(result);
		//Me subscribo a los periodicos
		for (Newspaper n : newspapersnewsupcription) {
			subcripcion = this.subscriptionService.create(n.getId());
			subcripcion.setCreditCard(underwrite.getCreditCard());
			subcripcion.setCustomer(customerPrincipal);
			this.subscriptionService.reconstruct(subcripcion, binding);
			this.subscriptionService.save(subcripcion);
		}
		return result;
	}
	public Underwrite reconstruct(final Underwrite underwrite, final BindingResult binding) {
		Underwrite result;
		if (underwrite.getId() == 0)
			result = underwrite;
		else {
			Assert.notNull(null, "a subscription can not be modified");
			result = underwrite;
		}
		this.validator.validate(result, binding);
		return result;
	}
	//Other method

	public boolean checkCreditCard(final CreditCard creditCard) {
		boolean res;
		Calendar calendar;
		int actualYear;

		res = false;
		calendar = new GregorianCalendar();
		actualYear = calendar.get(Calendar.YEAR);
		actualYear = actualYear % 100;
		if (creditCard.getExpirationYear() != null)
			if (Integer.parseInt(creditCard.getExpirationYear()) > actualYear)
				res = true;
			else if (Integer.parseInt(creditCard.getExpirationYear()) == actualYear && Integer.parseInt(creditCard.getExpirationMonth()) >= calendar.get(Calendar.MONTH))
				res = true;
		return res;
	}
}
