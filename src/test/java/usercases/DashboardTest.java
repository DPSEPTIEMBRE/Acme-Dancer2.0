package usercases;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;
import javax.validation.ConstraintViolationException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import services.AdministratorService;
import utilities.AbstractTest;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class DashboardTest extends AbstractTest {

	//The SUT
	
	@Autowired
	private AdministratorService adminService;
	
	
	//Templates
	
	/*
	 * 9.1: An administrator must be able to display the new version statistics on the dashboard.
	 */
	
	public void template(final String username, final Class<?> expected) {
		Class<?> caught = null;

		try {
			this.authenticate(username);
				
			Assert.isTrue(username == "administrator");
			adminService.ratioDancerByCurricula();
			adminService.styleByOrderCourses();
			adminService.styleDancerTeach();
			adminService.avgFoldersPerActor();
			adminService.avgMailMessage();
			adminService.avgMailMessageSpamPerActor();
			adminService.avgBannerByAcademy();
			adminService.ratioAcademyBanner();

			this.unauthenticate();
		} catch (final Throwable oops) {

			caught = oops.getClass();

		}

		this.checkExceptions(expected, caught);
	}
	
	//Drivers
	
	@Test
	public void Driver() {

		final Object testingData[][] = {
					
			//Test #01: Correct authentication. Expected true.
			{"administrator", null},
				
			//Test #02: Attempt to access with an incorrect account. Expected false.
			{"academy1", IllegalArgumentException.class},
				
			//Test #03: Attempt to access by anonymous user. Expected false.
			{null, IllegalArgumentException.class}

		};
		for (int i = 0; i < testingData.length; i++)
			this.template((String) testingData[i][0], (Class<?>) testingData[i][1]);
	}
}
