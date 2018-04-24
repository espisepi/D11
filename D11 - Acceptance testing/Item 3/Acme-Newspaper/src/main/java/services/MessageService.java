package services;

import java.util.Collection;
import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.validation.Validator;

import repositories.MessageRepository;
import domain.Actor;
import domain.Message;
import domain.MessageFolder;

@Service
@Transactional
public class MessageService {
	
	// Managed repository -----------------------------------------------------
	@Autowired
	private MessageRepository messageRepository;
	

	// Supporting services ----------------------------------------------------
	
	@Autowired
	private MessageFolderService messageFolderService;
	
	@Autowired
	private ActorService actorService;
	
	@Autowired
	private Validator	validator;
	
	// Constructors -----------------------------------------------------------
	
	public MessageService(){
		super();
	}
	
	// Simple CRUD methods ----------------------------------------------------
	
	public Message create() {
		Actor sender;
		Message result;
		MessageFolder messageFolder;
		
		sender = this.actorService.findPrincipal();
		result = new Message();
		result.setMoment(new Date());
		result.setSender(sender);
		messageFolder = this.messageFolderService.findMessageFolderByNameAndActor("Out box", sender.getId());
		result.setMessageFolder(messageFolder);
		
		return result;
	}
	
	public Collection<Message> findAll() {
		Collection<Message> result;
		result = this.messageRepository.findAll();
		return result;

	}
	
	public Message findOne(int messageId) {
		
		Assert.notNull(messageId);
		Assert.isTrue(messageId != 0);
		
		Message result;
		Actor principal;
		Actor sender;
		Actor recipient;
		Collection<MessageFolder> messageFolders;
		
		principal = this.actorService.findPrincipal();
		messageFolders = this.messageFolderService.findMessageFolderByActor(principal.getId());
		result = this.messageRepository.findOne(messageId);
		sender = result.getSender();
		recipient = result.getRecipient();
		
		
		Assert.isTrue((principal.equals(sender) || principal.equals(recipient)) && messageFolders.equals(result.getMessageFolder()));
		
		return result;
		
		
	}
	
	public void delete(Message message){
		Assert.notNull(message);
		Assert.isTrue(message.getId() != 0);
		
		Actor principal;
		Actor sender;
		Actor recipient;
		Collection<MessageFolder> messageFolders;
		MessageFolder messageFolder;
		
		principal = this.actorService.findPrincipal();
		messageFolders = this.messageFolderService.findMessageFolderByActor(principal.getId());
		sender = message.getSender();
		recipient = message.getRecipient();
		messageFolder = this.messageFolderService.findMessageFolderByNameAndActor("Trash box", principal.getId());
		
		Assert.isTrue((principal.equals(sender) || principal.equals(recipient)) && messageFolders.equals(message.getMessageFolder()));
		
		if(message.getMessageFolder().getName().equals("Trash box"))
			
			this.messageRepository.delete(message);
		
		else
		
			message.setMessageFolder(messageFolder);
			
	}
	
	
	
	//Other method-------------------------------------------------------------
	
	public Collection<Message> findMessagesByMessageFolder(int messageFolderId){
		
		Collection<Message> result;
		
		result = this.messageRepository.findMessagesByMessageFolder(messageFolderId);
		
		return result;
	}
	
	

}
