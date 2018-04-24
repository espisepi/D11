
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

	//Lista de los periodicos que estan en modo publico para escribir un aviso 
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

	//Lista de los periodicos que tienen un aviso hecho por el agente logueado
	@RequestMapping(value = "/listNewspapersWithAdvertisement", method = RequestMethod.GET)
	public ModelAndView listNewspapersWithAdvertisement() {

		ModelAndView result;
		Collection<Newspaper> newspapers;

		newspapers = this.newspaperService.findAllNewspaperHavingAtLeastOneAdvertisement();

		result = new ModelAndView("newspaper/listForAdvertisement");
		result.addObject("newspapers", newspapers);
		result.addObject("showDelete", true);
		result.addObject("requestURI", "newspaper/agent/listNewspapersWithAdvertisement.do?d-16544-p=1");
		return result;
	}

	//Cogemos todos los peri�dicos a los que se les puede crear un aviso
	//y le restamos los que ya tienen un aviso hecho por el agente.
	@RequestMapping(value = "/listNewspapersWithCeroAdvertisement", method = RequestMethod.GET)
	public ModelAndView listNewspapersWithCeroAdvertisement() {

		ModelAndView result;
		Collection<Newspaper> newspapers;

		newspapers = this.newspaperService.findAllNewspaperToWriteAnAdvertisement();

		newspapers.removeAll(this.newspaperService.findAllNewspaperHavingAtLeastOneAdvertisement());

		result = new ModelAndView("newspaper/listForAdvertisement");
		result.addObject("newspapers", newspapers);
		result.addObject("showDelete", true);
		result.addObject("requestURI", "newspaper/agent/listNewspapersWithCeroAdvertisement.do?d-16544-p=1");
		return result;
	}

}
