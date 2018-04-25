package services;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Admin;
import domain.MessageFolder;

import utilities.AbstractTest;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class MessageFolderServiceTest extends AbstractTest {
	
	// Supporting services ----------------------------------------------------
	
	@Autowired
	private MessageFolderService messageFolderService;
	
	@Autowired
	private AdminService adminService;
	
	@PersistenceContext
	EntityManager			entityManager;
	
	//13.2. Manage his or her message folder, except for the system folder (create)
	@Test
	public void driveCreateMessageFolder() {
		
		final Object testingData[][] = {
			//Admin edit name, positive case
			{
				"admin", "Prueba", null 
			}
			
		};

		for (int i = 0; i < testingData.length; i++)
			this.templateCreateMessageFolder((String) testingData[i][0], (String) testingData[i][1], (Class<?>) testingData[i][2]);
		
	}
	
	public void templateCreateMessageFolder(final String username, final String name, final Class<?> expected) {

		Class<?> caught;
		MessageFolder result;

		caught = null;
		

		try {
			super.authenticate(username);
			result = this.messageFolderService.create();
			result.setName("Prueba");
			this.messageFolderService.save(result);
			this.messageFolderService.flush();
		} catch (final Throwable oops) {
			caught = oops.getClass();
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

	}
	
	@Test
	public void driveCreateDefaultMessageFolderAdministrator() {

		final Object testingData[][] = {
			//it shows that admin have some default message folder
			{
				"admin", "admin", "adminTest", "surnameTest", null, null, "prueba@gmail.com", null

			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.templateCreateDefaultMessageFolder((String) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2], (String) testingData[i][3], (String) testingData[i][4], (String) testingData[i][5], (String) testingData[i][6],
				(Class<?>) testingData[i][7]);

	}
	
	public void templateCreateDefaultMessageFolder(String username, String password, String name, String surname, String postalAddress, String phone, String email, final Class<?> expected) {

		Class<?> caught;
		Admin admin;

		caught = null;
		

		try {
			super.authenticate(null);
			admin = this.adminService.create();
			admin.getUserAccount().setUsername(username);
			admin.getUserAccount().setPassword(password);
			admin.setName(name);
			admin.setSurname(surname);
			admin.setPostalAddress(postalAddress);
			admin.setPhone(phone);
			admin.setEmail(email);
			this.adminService.save(admin);
			this.messageFolderService.flush();
			Assert.isTrue(this.messageFolderService.createDefaultMessageFolder(admin).size()==4);
		} catch (final Throwable oops) {
			caught = oops.getClass();
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

	}

}
