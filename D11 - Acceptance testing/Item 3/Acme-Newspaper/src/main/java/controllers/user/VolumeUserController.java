
package controllers.user;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.NewspaperService;
import services.UserService;
import services.VolumeService;
import controllers.AbstractController;
import domain.Newspaper;
import domain.User;
import domain.Volume;

@Controller
@RequestMapping("/volume/user")
public class VolumeUserController extends AbstractController {

	// Services ---------------------------------------------------------------
	@Autowired
	private NewspaperService	newspaperService;

	@Autowired
	private UserService			userService;

	@Autowired
	private VolumeService		volumeService;


	//List my volumen-----------------------------------------------------------

	@RequestMapping(value = "/mylist", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Volume> volumes;
		volumes = this.volumeService.myVolumes();
		result = new ModelAndView("volume/mylist");
		result.addObject("volumes", volumes);
		result.addObject("requestURI", "volume/user/mylist.do");
		return result;

	}
	//Creation----------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		Volume volume;

		volume = this.volumeService.create();

		result = this.createEditModelAndView(volume);
		return result;
	}

	//Edition--------------------------------------------------------------------------------

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int volumeId) {
		ModelAndView result;
		Volume volume;
		User user;

		user = this.userService.findByPrincipal();
		volume = this.volumeService.findOne(volumeId);
		Assert.isTrue(user.getVolumes().contains(volume), "Cannot commit this operation, because it's illegal");
		Assert.notNull(volume);
		result = this.createEditModelAndView(volume);
		return result;
	}

	// Save -----------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(Volume volume, final BindingResult bindingResult) {
		ModelAndView result;

		volume = this.volumeService.reconstruct(volume, bindingResult);
		if (bindingResult.hasErrors())
			result = this.createEditModelAndView(volume);
		else
			try {
				this.volumeService.save(volume);
				result = new ModelAndView("redirect:mylist.do");
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(volume, "volume.commit.error");
			}
		return result;
	}
	public ModelAndView createEditModelAndView(final Volume volume) {

		Assert.notNull(volume);
		ModelAndView result;
		result = this.createEditModelAndView(volume, null);
		return result;
	}

	public ModelAndView createEditModelAndView(final Volume volume, final String messageCode) {
		assert volume != null;

		ModelAndView result;
		Collection<Newspaper> newspapers;
		newspapers = this.newspaperService.findNewspapersCreatedByUser();
		result = new ModelAndView("volume/edit");
		result.addObject("volume", volume);
		result.addObject("newspapers", newspapers);
		result.addObject("message", messageCode);
		return result;

	}
}
