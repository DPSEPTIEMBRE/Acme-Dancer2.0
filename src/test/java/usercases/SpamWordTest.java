package usercases;

import javax.transaction.Transactional;
import javax.validation.ConstraintViolationException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import domain.SpamWord;
import services.SpamWordService;
import utilities.AbstractTest;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class SpamWordTest extends AbstractTest {

	// System under test ------------------------------------------------------
	@Autowired
	private SpamWordService spamwordService;

	//Templates
	
	/*
	 * 10: The system must register spam words for the mail message filter.
	 */
	protected void template(final String username, final String name, final Class<?> expected) {
		Class<?> caught = null;

		try {
			authenticate(username);

			SpamWord spamword = spamwordService.create();
			spamword.setName(name);

			spamwordService.save(spamword);
			spamwordService.flush();

			unauthenticate();
		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		checkExceptions(expected, caught);
	}
	
	//Drivers

	//Test #01: Creation of spam word. Expected true.
	@Test
	public void positiveTest0() {

		template("administrator", "shit", null);

	}

	//Test #02: Creation of spam word. Expected true.
	@Test
	public void positiveTest1() {

		template("administrator", "fuck", null);

	}
	
	//Test #03: Attempt to create an empty spam word. Expected false.
	@Test
	public void negativeTest0() {

		template("administrator", "", ConstraintViolationException.class);

	}

	//Test #03: Attempt to create a null spam word. Expected false.
	@Test
	public void negativeTest1() {

		template("administrator", null, ConstraintViolationException.class);

	}
}
