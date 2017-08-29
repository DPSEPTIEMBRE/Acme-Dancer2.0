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

import domain.Application;
import domain.Course;
import domain.Curricula;
import domain.RoleApplication;
import domain.StatusApplication;
import services.ApplicationService;
import services.CourseService;
import services.CurriculaService;
import utilities.AbstractTest;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class ApplicationTest extends AbstractTest {

	//The SUT
	
	@Autowired
	private ApplicationService	applicationService;

	@Autowired
	private CourseService		courseService;

	@Autowired
	private CurriculaService	curriculaService;
	
	
	//Templates
	
	/*
	 * 7.2: A dancer can apply for a course as teacher or student.
	 * 8.1: An academy can manage their applications, which means listing, accepting or rejecting them.
	 */
	protected void template(final String username, final Date createMoment, final StatusApplication statusApplication, final Course course, final RoleApplication role, final Curricula curricula, final Class<?> expected) {
		Class<?> caught = null;

		try {
			authenticate(username);
			Application application = applicationService.create();

			application.setCreateMoment(createMoment);
			application.setStatusApplication(statusApplication);
			application.setCourse(course);
			application.setRole(role);
			application.setCurricula(curricula);

			applicationService.save(application);
			applicationService.flush();

			unauthenticate();
		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		checkExceptions(expected, caught);
	}

	//Drivers

	//Test #01: Use case with several applications. Expected true.
	@Test
	public void driver() {
		StatusApplication status = new StatusApplication();
		status.setValue("PENDING");
		RoleApplication role = new RoleApplication();
		role.setRoleValue("TEACHER");

		Curricula curricula1 = curriculaService.findAll().iterator().next();
		Curricula curricula2 = curriculaService.findAll().iterator().next();
		Curricula curricula3 = curriculaService.findAll().iterator().next();

		Course course1 = courseService.findAll().iterator().next();
		Course course2 = courseService.findAll().iterator().next();
		Course course3 = courseService.findAll().iterator().next();

		template("dancer1", new Date(), status, course1, role, curricula1, null);
		template("dancer2", new Date(), status, course2, role, curricula2, null);
		template("dancer3", new Date(), status, course3, role, curricula3, null);

	}

	//Test #02: Applying as teacher a single time. Expected true.
	@Test
	public void positiveTest0() {
		StatusApplication status = new StatusApplication();
		status.setValue("PENDING");
		RoleApplication role = new RoleApplication();
		role.setRoleValue("TEACHER");

		Curricula curricula = curriculaService.findAll().iterator().next();

		Course course = courseService.findAll().iterator().next();

		template("dancer1", new Date(), status, course, role, curricula, null);

	}

	//Test #03: Applying as student a single time. Expected true.
	@Test
	public void positiveTest1() {
		StatusApplication status = new StatusApplication();
		status.setValue("PENDING");
		RoleApplication role = new RoleApplication();
		role.setRoleValue("STUDENT");

		Curricula curricula = curriculaService.findAll().iterator().next();

		Course course = courseService.findAll().iterator().next();

		template("dancer1", new Date(), status, course, role, curricula, null);

	}
	
	//Test #04: Accepting an application. Expected true.
	@Test
	public void positiveTest2() {

		Course course = courseService.findAll().iterator().next();
		StatusApplication status = new StatusApplication();
		status.setValue("ACCEPTED");

		Application application = applicationService.findAll().iterator().next();
		application.setStatusApplication(status);
		applicationService.save(application);
		List<Application> aplicationCourse = new ArrayList<Application>();
		aplicationCourse.add(application);
		course.setApplications(aplicationCourse);
		courseService.save(course);

	}
	
	//Test #05: Rejecting an application. Expected true.
	@Test
	public void positiveTest3() {

		Course course = courseService.findAll().iterator().next();
		StatusApplication status = new StatusApplication();
		status.setValue("REJECTED");

		Application application = applicationService.findAll().iterator().next();
		application.setStatusApplication(status);
		applicationService.save(application);
		List<Application> aplicationCourse = new ArrayList<Application>();
		aplicationCourse.add(application);
		course.setApplications(aplicationCourse);
		courseService.save(course);

	}

	//Test #06: Attempt to apply as a different role. Expected false.
	@Test
	public void negativeTest0() {
		StatusApplication status = new StatusApplication();
		status.setValue("PENDING");
		RoleApplication role = new RoleApplication();
		role.setRoleValue("ACME");

		Curricula curricula = curriculaService.findAll().iterator().next();

		Course course = courseService.findAll().iterator().next();

		template("dancer1", new Date(), status, course, role, curricula, ConstraintViolationException.class);

	}
	
	//Test #07: Attempt to apply to a nonexistent course. Expected false.
	@Test
	public void negativeTest1() {
		StatusApplication status = new StatusApplication();
		status.setValue("PENDING");
		RoleApplication role = new RoleApplication();
		role.setRoleValue("TEACHER");

		Curricula curricula = curriculaService.findAll().iterator().next();
		template("dancer1", new Date(), status, null, role, curricula, ConstraintViolationException.class);

	}

	//Test #08: Attempt to apply to a course with a non defined status. Expected false.
	@Test
	public void negativeTest2() {
		StatusApplication status = new StatusApplication();
		status.setValue("ACME");
		RoleApplication role = new RoleApplication();
		role.setRoleValue("TEACHER");

		Course course = courseService.findAll().iterator().next();
		Curricula curricula = curriculaService.findAll().iterator().next();

		template("dancer1", new Date(), status, course, role, curricula, ConstraintViolationException.class);

	}

	//Test #09: Attempt to apply to a course without a status. Expected false.
	@Test
	public void negativeTest3() {

		RoleApplication role = new RoleApplication();
		role.setRoleValue("TEACHER");

		Course course = courseService.findAll().iterator().next();
		Curricula curricula = curriculaService.findAll().iterator().next();

		template("dancer1", new Date(), null, course, role, curricula, ConstraintViolationException.class);

	}
}
