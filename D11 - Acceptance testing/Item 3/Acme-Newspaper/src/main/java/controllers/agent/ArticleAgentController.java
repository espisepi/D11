
package controllers.agent;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ArticleService;
import services.FollowUpService;
import controllers.AbstractController;
import domain.Article;
import domain.FollowUp;

@Controller
@RequestMapping("/article/agent")
public class ArticleAgentController extends AbstractController {

	// Services ---------------------------------------------------------------

	@Autowired
	private ArticleService	articleService;

	@Autowired
	private FollowUpService	followUpService;


	//Mostrar el resumen del artículo
	@RequestMapping(value = "/listSummary", method = RequestMethod.GET)
	public ModelAndView listSummary(@RequestParam final int articleId) {

		ModelAndView result;
		String summary;

		summary = this.articleService.findSummaryByArticleId(articleId);

		result = new ModelAndView("article/displaySummary");

		result.addObject("requestURI", "article/agent/listSummay.do");
		result.addObject("article", summary);

		return result;
	}

	//Mostrar los artículos del periódico que estamos mostrando

	// Display all article----------------------------------------------------------------

	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView displayArticle(@RequestParam final int articleId) {
		final ModelAndView result;
		Article article = new Article();
		Collection<FollowUp> followsUp;
		article = this.articleService.findOne(articleId);
		followsUp = this.followUpService.findFollowUpsByArticle(articleId);

		//El periódico debe de ser público
		Assert.isTrue(article.getNewspaper().isOpen() == true, "cannot commit this operation");

		//El artículo tiene que estar en modo final
		Assert.isTrue(article.isDraftMode() == false, "cannot commit this operation");

		result = new ModelAndView("article/display");
		result.addObject("article", article);
		result.addObject("followsUp", followsUp);
		result.addObject("requestURI", "article/agent/display.do");

		return result;
	}
}
