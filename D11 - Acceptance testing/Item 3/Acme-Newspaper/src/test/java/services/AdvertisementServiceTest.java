
package services;

import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import utilities.AbstractTest;
import domain.Advertisement;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class AdvertisementServiceTest extends AbstractTest {

	// Supporting services ----------------------------------------------------

	@Autowired
	AdvertisementService	advertisementService;

	@PersistenceContext
	EntityManager			entityManager;


	//Caso de uso 5.1: List the advertisements that contain taboo words in its title.
	@Test
	public void driverList() {
		final Object testingData[][] = {

			{
				//Se listan los advertisement que tienen palabras taboo y se comprueba que el anuncio 5 contiene palabra tabu.
				"admin", "advertisement5", null
			}, {
				//Se listan los advertisement que tienen palabras taboo y el anuncio 2 no contiene palabra tabu
				"admin", "advertisement2", IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateListAndEdit((String) testingData[i][0], (String) testingData[i][1], (Class<?>) testingData[i][2]);
	}
	private void templateListAndEdit(final String username, final String advertisement, final Class<?> expected) {
		Collection<Advertisement> advertisements;
		Advertisement advertisementToCompare;
		Class<?> caught;

		caught = null;
		try {
			super.authenticate(username);
			advertisements = this.advertisementService.advertisementWithTabooWord();
			advertisementToCompare = this.advertisementService.findOne(this.getEntityId(advertisement));
			Assert.isTrue(advertisements.contains(advertisementToCompare));
		} catch (final Throwable oops) {
			caught = oops.getClass();
			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

		super.unauthenticate();
	}

	//Caso de uso 5.2. Remove an advertisement that he or she thinks is inappropriate.
	@Test
	public void driverDelete() {
		final Object testingData[][] = {

			{
				//Se borra un advertisement que esta en un periodico por parte del administrador
				"admin", "advertisement1", null
			}, {
				//Se borrar un advertisement por parte de un user
				"user1", "advertisement2", IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateDelete((String) testingData[i][0], (String) testingData[i][1], (Class<?>) testingData[i][2]);
	}
	private void templateDelete(final String username, final String advertisementId, final Class<?> expected) {
		Class<?> caught;
		Advertisement advertisementDelete;
		caught = null;
		try {
			super.authenticate(username);
			advertisementDelete = this.advertisementService.findOne(this.getEntityId(advertisementId));
			this.advertisementService.delete(advertisementDelete);

		} catch (final Throwable oops) {
			caught = oops.getClass();
			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

		super.unauthenticate();
	}
}
