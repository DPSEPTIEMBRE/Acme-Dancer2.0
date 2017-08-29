package usercases;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;
import javax.validation.ConstraintViolationException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import domain.Dancer;
import domain.Folder;
import domain.MailMessage;
import services.DancerService;
import services.FolderService;
import utilities.AbstractTest;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class FolderTest extends AbstractTest {

	// System under test ------------------------------------------------------
	@Autowired
	private FolderService	folderService;
	@Autowired
	private DancerService	dancerService;

	
	//Templates
	
	/*
	 * 11.2: All actors can manage their folders: list, create, edit and delete them.
	 */
	protected void template(final String username, final String folderName, final List<MailMessage> messages, final Class<?> expected) {
		Class<?> caught = null;

		try {
			authenticate(username);
			
			Assert.notNull(username);
			folderService.findAll();

			Folder folder = folderService.create();
			folder.setFolderName(folderName);
			folder.setMessages(messages);

			Dancer dancer = dancerService.findAll().iterator().next();

			for (Dancer e : dancerService.findAll()) {
				if (e.getUserAccount().getUsername().equals("dancer2")) {
					dancer = e;
					break;
				}
			}

			dancer.getFolders().add(folderService.save(folder));
			folderService.flush();

			dancerService.saveEditing(dancer);

			unauthenticate();
		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		checkExceptions(expected, caught);
	}
	
	//Drivers

	//Test #01: Correct management of a folder. Expected true.
	@Test
	public void positiveTest0() {

		List<MailMessage> messages = new ArrayList<MailMessage>();
		template("dancer2", "folderName_2", messages, null);

	}

	//Test #02: Creation of default folders. Expected true.
	@Test
	public void positiveTest1() {

		Assert.isTrue(folderService.createDefaultFolders().size() == 4);
	}

	//Test #03: Attempt to change a default folder's name. Expected false.
	@Test
	public void negativeTest0() {

		Dancer dancer = dancerService.findAll().iterator().next();

		for (Dancer e : dancerService.findAll()) {
			if (e.getUserAccount().getUsername().equals("dancer2")) {
				dancer = e;
				break;
			}
		}

		Folder folder = dancer.getFolders().iterator().next();

		folder.setFolderName("inbox");

		try {
			folderService.saveCreate(folder);
		} catch (Exception e) {
			checkExceptions(IllegalArgumentException.class, e.getClass());
		}

	}
	
	//Test #04: Attempt to create a folder without name. Expected false.
	@Test
	public void negativeTest1() {

		List<MailMessage> messages = new ArrayList<MailMessage>();
		template("dancer2", "", messages, ConstraintViolationException.class);

	}
	
	//Test #05: Attempt to create a null folder. Expected false.
	@Test
	public void negativeTest2() {

		List<MailMessage> messages = new ArrayList<MailMessage>();
		template("dancer2", null, messages, ConstraintViolationException.class);

	}
}
