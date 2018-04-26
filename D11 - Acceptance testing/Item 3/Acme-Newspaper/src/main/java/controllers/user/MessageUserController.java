package controllers.user;

import java.util.ArrayList;
import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.MessageFolderService;
import services.MessageService;
import controllers.AbstractController;
import domain.Actor;
import domain.Message;
import domain.MessageFolder;

@Controller
@RequestMapping("/message/user")
public class MessageUserController extends AbstractController{
	
	//	Services --------------------------------------------------------
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private ActorService actorService;
	
	@Autowired
	private MessageFolderService messageFolderService;
	
	//	Constructors
	
	public MessageUserController(){
		super();
	}
	
	//	Listing ---------------------------------------------------------
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam int messageFolderId) {

		ModelAndView result;
		Collection<Message> messages;
		Integer messageFolderId1 = messageFolderId;
		Actor actor;
		Collection<MessageFolder> messageFolders;

		actor = this.actorService.findPrincipal();
		messageFolders = this.messageFolderService.findMessageFolderByActor(actor.getId());
		Assert.isTrue(messageFolders.contains(this.messageFolderService.findOne(messageFolderId)));

		messages = this.messageService.findMessagesByMessageFolder(messageFolderId);

		result = new ModelAndView("message/list");
		result.addObject("messages", messages);
		result.addObject("messageFolderId1", messageFolderId1);
		result.addObject("requestURI", "message/user/list.do");

		return result;

	}
	
	@RequestMapping(value = "/send", method = RequestMethod.GET)
	public ModelAndView create() {

		ModelAndView result;

		Message message;
		message = this.messageService.create();

		result = this.createNewModelAndView(message);
		result.addObject("requestURI", "message/user/send.do");

		return result;

	}
	
	@RequestMapping(value = "/send", method = RequestMethod.POST, params = "send")
	public ModelAndView send(@ModelAttribute("m") @Valid Message m, BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors())
			result = this.createNewModelAndView(m);
		else
			try {
				MessageFolder folderToReturn = m.getMessageFolder();

				this.messageService.send(m);
				result = new ModelAndView("redirect:list.do?messageFolderId=" + folderToReturn.getId());
			} catch (Throwable oops) {

				result = this.createNewModelAndView(m, "message.commit.error");

			}
		return result;
	}
	
	//Change folder message
	@RequestMapping(value = "/changeFolder", method = RequestMethod.GET)
	public ModelAndView changeFolderMessage(@RequestParam int messageId) {

		ModelAndView result;
		Message message;
		Collection<MessageFolder> messageFolders;
		Actor principal;
		
		message = this.messageService.findOne(messageId);
		principal = this.actorService.findPrincipal();
		messageFolders = this.messageFolderService.findMessageFolderByActor(principal.getId());
		messageFolders.remove(message.getMessageFolder());
		
		Assert.notNull(message);

		result = new ModelAndView("message/changeFolder");
		result.addObject("folders", messageFolders);
		result.addObject("msg", message);
		
		return result;

	}
	
	@RequestMapping(value = "/changeFolder", method = RequestMethod.POST, params = "change")
	public ModelAndView send(@Valid Message m, BindingResult binding, @RequestParam int messageId) {
		ModelAndView result;
		Message message;
		Actor principal;
		
		message = this.messageService.findOne(messageId);
		principal = this.actorService.findPrincipal();
		
		if (binding.hasErrors())
			result = this.createNewModelAndViewChange(m);
		else
			try {
				this.messageService.saveMessageInFolder(principal, m.getMessageFolder().getName(), message);
				result = new ModelAndView("redirect:/messageFolder/user/list.do");
			} catch (Throwable oops) {

				result = this.createNewModelAndViewChange(m, "message.commit.error");

			}
		return result;
	}
	
	
	
	// Ancillary methods ------------------------------------------------------

	protected ModelAndView createNewModelAndView(Message m) {
		ModelAndView result;
		result = this.createNewModelAndView(m, null);
		return result;
	}

	protected ModelAndView createNewModelAndView(Message m, String message) {
		ModelAndView result;

		result = new ModelAndView("message/send");

		Actor actor = this.actorService.findPrincipal();
		Collection<Actor> actors = this.actorService.findAll();
		actors.remove(actor);

		result.addObject("actors", actors);
		String low = "LOW";
		String neutral = "NEUTRAL";
		String high = "HIGH";
		Collection<String> priorities = new ArrayList<String>();
		priorities.add(low);
		priorities.add(neutral);
		priorities.add(high);

		result.addObject("message", message);
		result.addObject("priorities", priorities);
		result.addObject("m", m);
		return result;
	}
	
	protected ModelAndView createNewModelAndViewChange(Message m) {
		ModelAndView result;
		result = this.createNewModelAndView(m, null);
		return result;
	}

	protected ModelAndView createNewModelAndViewChange(Message m, String message) {
		ModelAndView result;
		
		Collection<MessageFolder> messageFolders;
		Actor principal;
		
		principal = this.actorService.findPrincipal();
		messageFolders = this.messageFolderService.findMessageFolderByActor(principal.getId());
		messageFolders.remove(m.getMessageFolder());
		
		Assert.notNull(message);

		result = new ModelAndView("message/changeFolder");
		result.addObject("folders", messageFolders);
		result.addObject("msg", message);
		return result;
	}



}
