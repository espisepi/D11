
package services;

import java.util.ArrayList;
import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.validation.Validator;

import repositories.VolumeRepository;
import domain.Newspaper;
import domain.User;
import domain.Volume;

@Service
@Transactional
public class VolumeService {

	@Autowired
	VolumeRepository	volumeRepository;

	@Autowired
	NewspaperService	newspaperService;

	@Autowired
	UserService			userService;

	@Autowired
	private Validator	validator;


	public VolumeService() {

	}
	// Simple CRUD methods ----------------------------------------------------
	//CREATE
	public Volume create() {
		final Volume result;
		User userPrincipal;
		Collection<Newspaper> newspaper;

		userPrincipal = this.userService.findByPrincipal();
		newspaper = new ArrayList<Newspaper>();

		result = new Volume();
		userPrincipal.getVolumes().add(result);

		return result;
	}

	//SAVE
	public Volume save(final Volume volume) {
		Volume result;

		Assert.notNull(volume);

		result = this.volumeRepository.save(volume);

		return result;
	}

	//DELETE
	//	public void delete(final Volume volume) {
	//
	//		Collection<Subscription> subscriptions;
	//
	//		subscriptions = this.subscriptionService.findSubscriptionByVolume(newspaper.getId());
	//
	//		Assert.notNull(newspaper);
	//		Assert.notNull(this.adminService.findByPrincipal());
	//		//Solo se pueden eliminar los newspaper publicos
	//		Assert.isTrue(newspaper.isOpen() || (newspaper.isOpen() == false && subscriptions.size() == 0), "Se pueden eliminar los periodicos publicos y privado que aún no tengas suscripciones");
	//
	//		this.newspaperRepository.delete(newspaper);
	//	}

	//other Method Utilities

	public Collection<Volume> myVolumes() {
		Collection<Volume> result;
		User user;
		user = this.userService.findByPrincipal();
		result = this.volumeRepository.myVolumes(user.getId());

		return result;

	}
}
