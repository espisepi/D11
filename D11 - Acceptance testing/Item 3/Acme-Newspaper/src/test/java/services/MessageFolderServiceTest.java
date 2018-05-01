package services;

import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import utilities.AbstractTest;
import domain.Agent;
import domain.MessageFolder;

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
	private AgentService agentService;
	
	@PersistenceContext
	EntityManager			entityManager;
	
	//13.2. Manage his or her message folder, except for the system folder (create)
	@Test
	public void driveCreateMessageFolder() {
		
		final Object testingData[][] = {
			//Admin create message folder, positive case
			{
				"admin", "Prueba", null 
			},
			// User create message folder with null name, negative case
			{
				"user1", null, javax.validation.ConstraintViolationException.class
			},
			// Agent create message folder with blank name, negative case
			{
				"agent1", "", javax.validation.ConstraintViolationException.class
			},
			//Customer create message folder but it exits, negative case
			{
				"customer1", "In box", java.lang.IllegalArgumentException.class
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
			result.setName(name);
			this.messageFolderService.saveToPrincipal(result);
			this.messageFolderService.flush();
		} catch (final Throwable oops) {
			caught = oops.getClass();
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

	}
	
	//13.2. Manage his or her message folder, except for the system folder (edit)
	@Test
	public void driveEditMessageFolder() {
		
		final Object testingData[][] = {
//			//Admin edit message folder, positive case
//			{
//				"admin", "Folder1", "Prueba1", null
//			},
			// User try edit a default folder, negative case
			{
				"admin", "TrashBoxAdmin", "Prueba", java.lang.IllegalArgumentException.class
			}
			
		};

		for (int i = 0; i < testingData.length; i++)
			this.templateEditMessageFolder((String) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2], (Class<?>) testingData[i][3]);
		
	}
	
	public void templateEditMessageFolder(final String username, final String nameOld, final String name, final Class<?> expected) {

		Class<?> caught;
		MessageFolder result;

		caught = null;
		

		try {
			super.authenticate(username);
			result = this.messageFolderService.findOne(super.getEntityId(nameOld));
			result.setName(name);
			this.messageFolderService.saveToPrincipal(result);
			this.messageFolderService.flush();
		} catch (final Throwable oops) {
			caught = oops.getClass();
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

	}
	
	//13.2. Manage his or her message folder, except for the system folder (create)
	@Test
	public void driveDeleteMessageFolder() {
		
		final Object testingData[][] = {
			//Admin delete message folder, positive case
			{
				"admin", "Folder1", null
			},
			//Customer don't delete default folder, negative case
			{
				"customer1", "InBoxCustomer1", java.lang.IllegalArgumentException.class
			}
			
		};

		for (int i = 0; i < testingData.length; i++)
			this.templateDeleteMessageFolder((String) testingData[i][0], (String) testingData[i][1], (Class<?>) testingData[i][2]);
		
	}
	
	public void templateDeleteMessageFolder(final String username, final String name, final Class<?> expected) {

		Class<?> caught;
		MessageFolder result;

		caught = null;
		

		try {
			super.authenticate(username);
			result = this.messageFolderService.findOne(super.getEntityId(name));
			this.messageFolderService.delete(result);
			this.messageFolderService.flush();
		} catch (final Throwable oops) {
			caught = oops.getClass();
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

	}
	
	//12. Every actor has system folders
	@Test
	public void driveCreateDefaultMessageFolderAdministrator() {

		final Object testingData[][] = {
			//it shows that admin have some default message folder
			{
				"agent", "agent", "agentTest", "surnameTest", null, null, "prueba@gmail.com", null

			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.templateCreateDefaultMessageFolder((String) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2], (String) testingData[i][3], (String) testingData[i][4], (String) testingData[i][5], (String) testingData[i][6],
				(Class<?>) testingData[i][7]);

	}
	
	public void templateCreateDefaultMessageFolder(String username, String password, String name, String surname, String postalAddress, String phone, String email, final Class<?> expected) {

		Class<?> caught;
		Agent agent;
		Collection<MessageFolder> messageFolders;
		Agent agentSaved;
		

		caught = null;
		

		try {
			super.authenticate(null);
			agent = this.agentService.create();
			agent.getUserAccount().setUsername(username);
			agent.getUserAccount().setPassword(password);
			agent.setName(name);
			agent.setSurname(surname);
			agent.setPostalAddress(postalAddress);
			agent.setPhone(phone);
			agent.setEmail(email);
			agentSaved = this.agentService.save(agent);
			messageFolders = this.messageFolderService.findMessageFolderByActor(agentSaved.getId());
			this.agentService.flush();
			Assert.isTrue(messageFolders.size()==5);
		} catch (final Throwable oops) {
			caught = oops.getClass();
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

	}

}
