package usercases;

import javax.transaction.Transactional;
import javax.validation.ConstraintViolationException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import domain.Academy;
import domain.Banner;
import services.AcademyService;
import services.BannerService;
import utilities.AbstractTest;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class BannerTest extends AbstractTest {

	//The SUT
	
	@Autowired
	private BannerService	bannerService;

	@Autowired
	private AcademyService	academyService;

	
	//Templates
	
	/*
	 * 14.1: An academy can manage their banners: listing, creating, editing and deleting them.
	 */
	protected void template(final String username, final String url, final Academy academy, final Class<?> expected) {
		Class<?> caught = null;

		try {
			authenticate(username);
			
			Assert.isTrue(username == "academy1" || username == "academy2" || username == "academy3");
			Banner banner = bannerService.create();

			banner.setAcademy(academy);
			banner.setUrl(url);
			bannerService.save(banner);
			bannerService.flush();

			unauthenticate();

		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		checkExceptions(expected, caught);
	}

	//Drivers
	
	//Test #01: Creation of a banner. Expected true.
	@Test
	public void testPositive0() {

		Academy academy = academyService.findAll().iterator().next();

		for (Academy e : academyService.findAll()) {
			if (e.getUserAccount().getUsername().equals("academy1")) {
				academy = e;
				break;
			}
		}

		template("academy1", "https://www.hola.com/", academy, null);

	}

	//Test #02: Creation of a banner. Expected true.
	@Test
	public void testPositive1() {

		Academy academy = academyService.findAll().iterator().next();

		for (Academy e : academyService.findAll()) {
			if (e.getUserAccount().getUsername().equals("academy2")) {
				academy = e;
				break;
			}
		}

		template("academy2", "https://www.hola.com/", academy, null);

	}

	//Test #03: Attempt to create a banner without academy. Expected false.
	@Test
	public void testNegative0() {

		template("academy2", "https://www.hola.com/", null, ConstraintViolationException.class);

	}

	//Test #04: Attempt to create a banner with an erroneous URL. Expected false.
	@Test
	public void testNegative1() {
		Academy academy = academyService.findAll().iterator().next();
		for (Academy e : academyService.findAll()) {
			if (e.getUserAccount().getUsername().equals("academy2")) {
				academy = e;
				break;
			}
		}

		template("academy2", "hola", academy, ConstraintViolationException.class);

	}
}
