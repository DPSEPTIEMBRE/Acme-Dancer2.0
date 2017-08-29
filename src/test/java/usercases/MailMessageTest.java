package usercases;

import java.util.Date;

import javax.transaction.Transactional;
import javax.validation.ConstraintViolationException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import domain.Actor;
import domain.Dancer;
import domain.Folder;
import domain.MailMessage;
import domain.Priority;
import services.DancerService;
import services.FolderService;
import services.MailMessageService;
import utilities.AbstractTest;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class MailMessageTest extends AbstractTest {

	// System under test ------------------------------------------------------
	@Autowired
	private MailMessageService	mailmessageService;
	
	@Autowired
	private DancerService		dancerService;
	
	@Autowired
	private FolderService folderService;

	
	//Templates

	/*
	 * 11.1: An authenticated actor can exchange messages with other actors.
	 */
	protected void template(final String username, final Date sent, final String subject, final String body, final Priority priority, final Actor sender, final Actor recipient, final Class<?> expected) {
		Class<?> caught = null;

		try {
			authenticate(username);

			Assert.notNull(username);
			MailMessage mailmessage = mailmessageService.create();
			mailmessage.setSent(sent);
			mailmessage.setSubject(subject);
			mailmessage.setBody(body);
			mailmessage.setPriority(priority);
			mailmessage.setSender(sender);
			mailmessage.setRecipient(recipient);

			mailmessageService.save(mailmessage);
			mailmessageService.flush();

			unauthenticate();
		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		checkExceptions(expected, caught);
	}
	
	/*
	 * 11.3: An actor can manage his or her messages, such as moving them and deleting them.
	 */
	public void manageTemplate(final String username, final Integer id, final Class<?> expected) {
		Class<?> caught = null;

		try {
			this.authenticate(username);
			
			Assert.notNull(username);
			MailMessage m = mailmessageService.create();
			Folder f = folderService.findOne(id);
			mailmessageService.moveTo(m, f);
			mailmessageService.flush();

			this.unauthenticate();
		} catch (final Throwable oops) {

			caught = oops.getClass();

		}

		this.checkExceptions(expected, caught);
	}
	
	//Drivers
	
	//Test #01: Correct message sent. Expected true.
	@Test
	public void positiveTest0() {

		Priority priority = new Priority();
		priority.setValue("NEUTRAL");

		Dancer dancer = dancerService.findAll().iterator().next();

		for (Dancer e : dancerService.findAll()) {
			if (e.getUserAccount().getUsername().equals("dancer2")) {
				dancer = e;
				break;
			}
		}

		template("dancer2", new Date(), "subject", "body", priority, dancer, dancer, null);

	}
	
	//Test #02: Correct message sent. Expected true.
	@Test
	public void positiveTest1() {

		Priority priority = new Priority();
		priority.setValue("LOW");

		Dancer dancer = dancerService.findAll().iterator().next();

		for (Dancer e : dancerService.findAll()) {
			if (e.getUserAccount().getUsername().equals("dancer2")) {
				dancer = e;
				break;
			}
		}

		template("dancer2", new Date(), "subject0", "body sample body", priority, dancer, dancer, null);

	}
	
	//Test #03: Attempt to create a message without a sender. Expected false.
	@Test
	public void negativeTest0() {

		Priority priority = new Priority();
		priority.setValue("LOW");

		Dancer dancer = dancerService.findAll().iterator().next();

		for (Dancer e : dancerService.findAll()) {
			if (e.getUserAccount().getUsername().equals("dancer2")) {
				dancer = e;
				break;
			}
		}

		template("dancer2", new Date(), "subject0", "body sample body", priority, null, dancer, ConstraintViolationException.class);

	}

	//Test #04: Attempt to create a message without a date. Expected false.
	@Test
	public void negativeTest1() {

		Priority priority = new Priority();
		priority.setValue("LOW");

		Dancer dancer = dancerService.findAll().iterator().next();

		for (Dancer e : dancerService.findAll()) {
			if (e.getUserAccount().getUsername().equals("dancer2")) {
				dancer = e;
				break;
			}
		}

		template("dancer2", null, "subject0", "body sample body", priority, dancer, dancer, ConstraintViolationException.class);

	}
	
	//Test #05: Attempt to send a message to a nonexistent receiver. Expected false.
	@Test
	public void negativeTest2() {
		try {
			mailmessageService.send("hello", "body sample", "LOW", "falseMail@false.com");
		} catch (Exception ex) {
			checkExceptions(IllegalArgumentException.class, ex.getClass());
		}
	}
	
	@Test
	public void manageDriver() {

		final Object testingData[][] = {
					
			//Test #01: . Expected true.
			{"dancer1", 310, null},
				
			//Test #02: . Expected false.
			{null, 310, IllegalArgumentException.class},
				
			//Test #03: . Expected false.
			{"dancer1", null, IllegalArgumentException.class}

		};
		for (int i = 0; i < testingData.length; i++)
			this.manageTemplate((String) testingData[i][0], (Integer) testingData[i][1], (Class<?>) testingData[i][2]);
	}
}
