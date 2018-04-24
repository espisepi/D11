
package services;

import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.AdvertisementRepository;
import domain.Advertisement;
import domain.CreditCard;
import domain.Newspaper;

@Service
@Transactional
public class AdvertisementService {

	// Managed repository -----------------------------------------------------

	@Autowired
	AdvertisementRepository	advertisementRepository;

	// Supporting services ----------------------------------------------------

	@Autowired
	AgentService			agentService;

	@Autowired
	NewspaperService		newspaperService;


	// Constructors -----------------------------------------------------------

	public AdvertisementService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public Advertisement create() {
		Advertisement result;

		result = new Advertisement();

		return result;
	}

	public Advertisement save(final Advertisement advertisement) {

		Advertisement result;
		Assert.notNull(advertisement);

		Assert.isTrue(this.checkCreditCard(advertisement.getCreditCard()), "Invalid credit card");

		result = this.advertisementRepository.save(advertisement);
		return result;
	}

	public Advertisement findOne(final int advertisementId) {
		Assert.isTrue(advertisementId != 0);
		Advertisement result;
		result = this.advertisementRepository.findOne(advertisementId);

		return result;
	}

	public void delete(final Advertisement advertisement) {
		Assert.notNull(advertisement);

		Newspaper newspaper;

		if (this.newspaperService.findNewspaperByAdvertisement(advertisement) != null) {
			newspaper = this.newspaperService.findNewspaperByAdvertisement(advertisement);
			newspaper.getAdvertisements().remove(advertisement);
		}

		this.advertisementRepository.delete(advertisement);

	}

	//Other business methods--------------------------------------------------------------

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

	public void flush() {
		this.advertisementRepository.flush();
	}

}
