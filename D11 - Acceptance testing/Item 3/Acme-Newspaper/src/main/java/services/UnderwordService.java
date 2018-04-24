
package services;

import java.util.Calendar;
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

@Service
@Transactional
public class UnderwordService {

	@Autowired
	UnderwriteRepository	underwriteRepository;

	@Autowired
	NewspaperService		newspaperService;

	@Autowired
	CustomerService			customerService;

	@Autowired
	private Validator		validator;


	public UnderwordService() {
	}
	// Simple CRUD methods ----------------------------------------------------

	//CREATE
	public Subscription create(final int newspaperId) {
		Subscription result;
		Customer customerPrincipal;
		Newspaper newspaper;

		newspaper = this.newspaperService.findOne(newspaperId);
		Assert.isTrue(!newspaper.isOpen(), "the newspaper must be private");
		customerPrincipal = this.customerService.findByPrincipal();
		result = new Subscription();
		result.setCustomer(customerPrincipal);
		result.setNewspaper(newspaper);

		return result;
	}

	//SAVE
	public Underwrite save(final Underwrite underwrite) {
		Customer customerPrincipal;
		Underwrite result;

		Assert.notNull(underwrite);
		customerPrincipal = this.customerService.findByPrincipal();
		//TODO comprobar que el cliente esta subscrito o no al volumen 
		//TODO el customer asignar al unedrwirte??
		//TODO subscribirse a un volumen significa subscribirsea todos sus periodicos.
		Assert.isTrue(this.checkCreditCard(underwrite.getCreditCard()), "Invalid credit card");
		result = this.underwriteRepository.save(underwrite);
		return result;
	}

	public Underwrite reconstruct(final Underwrite underwrite, final BindingResult binding) {
		Underwrite result;
		final Customer customerPrincipal;
		if (underwrite.getId() == 0) {

			customerPrincipal = this.customerService.findByPrincipal();
			customerPrincipal.getUnderwrites().add(underwrite);
			result = underwrite;
		} else {
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
