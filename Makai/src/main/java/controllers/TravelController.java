
package controllers;

import java.io.IOException;
import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.TravelService;
import domain.Travel;
import forms.TravelForm;

@Controller
@RequestMapping("/travel")
public class TravelController extends AbstractController {

	//Related services
	@Autowired
	private TravelService	travelService;


	//Constructor
	public TravelController() {
		super();
	}

	//Register
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		final TravelForm travelForm = new TravelForm();
		result = this.createModelAndView(travelForm);

		return result;
	}

	//Save register
	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView create(@Valid final TravelForm travelForm, final BindingResult binding) throws IOException {
		ModelAndView result;
		final Travel travel;
		if (binding.hasErrors())
			result = this.createModelAndView(travelForm);
		else
			try {
				travel = this.travelService.reconstruct(travelForm);
				this.travelService.save(travel);
				result = new ModelAndView("redirect:/welcome/index.do");

			} catch (final Throwable oops) {

				result = this.createModelAndView(travelForm, "travel.commit.error");

			}
		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView edit(@RequestParam final int travelId) {
		ModelAndView result;
		Travel travel;

		travel = this.travelService.findOne(travelId);
		try {
			this.travelService.delete(travel);
			result = new ModelAndView("redirect:create.do");
		} catch (final Throwable oops) {
			result = new ModelAndView("redirect:list.do");
		}

		return result;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam final int travelId) {
		ModelAndView result;
		Travel travel;

		travel = this.travelService.findOne(travelId);
		try {
			this.travelService.delete(travel);
			result = new ModelAndView("redirect:list.do");
		} catch (final Throwable oops) {
			result = new ModelAndView("redirect:list.do");
		}

		return result;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		final Collection<Travel> travels;
		travels = this.travelService.findAll();
		result = new ModelAndView("travel/list");
		result.addObject("travels", travels);
		result.addObject("requestURI", "travel/list.do");

		return result;
	}

	// Ancillary methods

	protected ModelAndView createModelAndView(final TravelForm travelForm) {
		final ModelAndView result = this.createModelAndView(travelForm, null);
		return result;
	}

	protected ModelAndView createModelAndView(final TravelForm travelForm, final String message) {
		final ModelAndView result = new ModelAndView("travel/create");
		result.addObject("travelForm", travelForm);
		result.addObject("RequestURI", "travel/create.do");
		result.addObject("errorMessage", message);

		return result;
	}

}
