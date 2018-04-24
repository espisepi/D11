package services;

import java.util.Collection;
import java.util.Iterator;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.MessageFolderRepository;
import domain.Actor;
import domain.MessageFolder;

@Service
@Transactional
public class MessageFolderService {
	
	// Managed repository -----------------------------------------------------
	@Autowired
	private MessageFolderRepository messageFolderRepository;
	
	// Supporting services ----------------------------------------------------
	
	@Autowired
	private ActorService actorService;
	
	@Autowired
	private Validator	validator;
	
	// Constructors -----------------------------------------------------------
	public MessageFolderService(){
		super();
	}
	
	// Simple CRUD methods ----------------------------------------------------
	
	public MessageFolder create(){
		
		MessageFolder result;
		Actor actor;
		
		actor = this.actorService.findPrincipal();
		
		result = new MessageFolder();
		result.setActor(actor);
		result.setModifiable(true);
		
		return result;
	
	}
	
	public MessageFolder findOne(int messageFolderId){
		
		Assert.isTrue(messageFolderId != 0);
		
		MessageFolder result;
		Actor principal;
		
		principal = this.actorService.findPrincipal();
		
		result = this.messageFolderRepository.findOne(messageFolderId);
		
		Assert.isTrue(principal.equals(result.getActor()));
		
		return result;
		
	}
	
	public Collection<MessageFolder> findAll(){
		
		Collection<MessageFolder> result;
		
		result = this.messageFolderRepository.findAll();
		
		return result;
		
	}
	
	public MessageFolder save(MessageFolder messageFolder){
		
		Assert.notNull(messageFolder);
		
		MessageFolder result;
		Iterator<MessageFolder> it;
		Actor principal;
		
		it = this.findAll().iterator();
		principal = this.actorService.findPrincipal();
		
		while (it.hasNext())
			Assert.isTrue(messageFolder.getName() != it.next().getName());
		
		if(messageFolder.getId() != 0)
			Assert.isTrue(messageFolder.isModifiable() == true, "This message folder doesn't edit");
			Assert.isTrue(messageFolder.getActor() == principal);
		
		result = this.messageFolderRepository.save(messageFolder);
		
		return result;
		
	}
	
	public void delete(MessageFolder messageFolder){
		
		Actor principal;
		
		principal = this.actorService.findPrincipal();
		
		Assert.isNull(messageFolder);
		Assert.isTrue(messageFolder.getId() != 0);
		Assert.isTrue(messageFolder.isModifiable() == true, "This is a default folder so it can not be deleted");
		Assert.isTrue(messageFolder.getActor().equals(principal));
		
		this.messageFolderRepository.delete(messageFolder);
	}
	
	
	public void flush(){
		this.messageFolderRepository.flush();
	}
	
	public MessageFolder reconstruct(MessageFolder messageFolder, BindingResult bindingResult){
		MessageFolder result;
		MessageFolder messageFolderBD;
		if (messageFolder.getId() == 0) {
			messageFolder.setModifiable(true);
			
			result = messageFolder;
		} else {
			messageFolderBD = this.messageFolderRepository.findOne(messageFolder.getId());
			messageFolder.setId(messageFolderBD.getId());
			messageFolder.setVersion(messageFolderBD.getVersion());
			messageFolder.setModifiable(messageFolderBD.isModifiable());
		
			result = messageFolder;
		}
		this.validator.validate(result, bindingResult);
		return result;
	}

}
