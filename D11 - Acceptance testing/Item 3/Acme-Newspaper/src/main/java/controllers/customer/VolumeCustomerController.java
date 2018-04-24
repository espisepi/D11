
package controllers.customer;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.NewspaperService;
import services.UserService;
import services.VolumeService;
import controllers.AbstractController;
import domain.Volume;

@Controller
@RequestMapping("/volume/customer")
public class VolumeCustomerController extends AbstractController {

	// Services ---------------------------------------------------------------
	@Autowired
	private NewspaperService	newspaperService;

	@Autowired
	private UserService			userService;

	@Autowired
	private VolumeService		volumeService;


	//List volumen con los periodicos abiertos y publicados -----------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Volume> volumes;
		//TODO realizar query con los volumenes a mostrar
		//volumes = this.volumeService.myVolumes();
		result = new ModelAndView("volume/list");
		//result.addObject("volumes", volumes);
		result.addObject("requestURI", "volume/customer/list.do");
		return result;

	}

}
