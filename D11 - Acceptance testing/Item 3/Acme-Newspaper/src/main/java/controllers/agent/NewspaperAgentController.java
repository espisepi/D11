
package controllers.agent;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.NewspaperService;
import controllers.AbstractController;
import domain.Newspaper;

@Controller
@RequestMapping(value = "/newspaper/agent")
public class NewspaperAgentController extends AbstractController {

	//Services--------------------------------------------

	@Autowired
	private NewspaperService	newspaperService;


	//Constructor--------------------------------------------------------

	public NewspaperAgentController() {
		super();
	}

	//Listing all the newspapers
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {

		ModelAndView result;
		Collection<Newspaper> newspapers;

		newspapers = this.newspaperService.findAllNewspaperToWriteAnAdvertisement();

		result = new ModelAndView("newspaper/list");
		result.addObject("newspapers", newspapers);
		result.addObject("showDelete", true);
		result.addObject("requestURI", "newspaper/agent/list.do?d-16544-p=1");
		return result;
	}

}