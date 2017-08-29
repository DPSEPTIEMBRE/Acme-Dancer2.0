
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

import domain.Curricula;
import domain.CustomRecord;
import domain.EndorserRecord;
import domain.PersonalRecord;
import domain.StyleRecord;
import services.CurriculaService;
import services.CustomRecordService;
import services.EndorserRecordService;
import services.PersonalRecordService;
import services.StyleRecordService;
import utilities.AbstractTest;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class CurriculaTest extends AbstractTest {

	//The SUT
	
	@Autowired
	private CurriculaService		curriculaService;

	@Autowired
	private PersonalRecordService	personalRecordService;

	@Autowired
	private CustomRecordService		customRecordService;

	@Autowired
	private EndorserRecordService	endorserRecordService;

	@Autowired
	private StyleRecordService		styleRecordService;
	
	//Templates
	
	/*
	 * 7.1: A dancer must be able to manage his or her curricula: listing, creating, editing and deleting.
	 */
	protected void template(final String username, final PersonalRecord personalRecord, final List<CustomRecord> customRecord, final List<EndorserRecord> endorserRecord, List<StyleRecord> styleRecord,
			final String editing1, final String editing2, final Class<?> expected) {
		Class<?> caught = null;

		try {
			authenticate(username);
			
			Assert.isTrue(username == "dancer1" || username == "dancer2" || username == "dancer3");
			curriculaService.findAll();

			Curricula curricula = curriculaService.create();
			curricula.setPersonalRecord(personalRecord);
			curricula.setCustomRecord(customRecord);
			curricula.setEndorserRecord(endorserRecord);
			curricula.setStyleRecord(styleRecord);

			curriculaService.save(curricula);
			
			curricula.getPersonalRecord().setFullName(editing1);
			curricula.getPersonalRecord().setEmail(editing2);
			
			curriculaService.flush();

			unauthenticate();

		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		checkExceptions(expected, caught);
	}

	//Drivers

	//Test #01: Test with one personal record. Expected true.
	@Test
	public void positiveTest0() {
		PersonalRecord personalrecord = personalRecordService.clone(personalRecordService.findAll().iterator().next());

		template("dancer1", personalrecord, new ArrayList<CustomRecord>(), new ArrayList<EndorserRecord>(), new ArrayList<StyleRecord>(), "name", "mail@mail.com", null);

	}

	//Test #02: Test with one personal record and two custom records. Expected true.
	@Test
	public void positiveTest1() {
		PersonalRecord personalrecord = personalRecordService.clone(personalRecordService.findAll().iterator().next());
		List<CustomRecord> copyCustom = new ArrayList<CustomRecord>();

		copyCustom.add(customRecordService.clone(customRecordService.findAll().iterator().next()));
		copyCustom.add(customRecordService.clone(customRecordService.findAll().iterator().next()));
		template("dancer3", personalrecord, copyCustom, new ArrayList<EndorserRecord>(), new ArrayList<StyleRecord>(), "name", "mail@mail.com", null);

	}

	//Test #03: Test with one personal record and two endorser records. Expected true.

	@Test
	public void positiveTest2() {
		PersonalRecord personalrecord = personalRecordService.clone(personalRecordService.findAll().iterator().next());
		List<CustomRecord> copyCustom = new ArrayList<CustomRecord>();
		List<EndorserRecord> endorserRecordsCopy = new ArrayList<EndorserRecord>();

		copyCustom.add(customRecordService.clone(customRecordService.findAll().iterator().next()));
		copyCustom.add(customRecordService.clone(customRecordService.findAll().iterator().next()));

		endorserRecordsCopy.add(endorserRecordService.clone(endorserRecordService.findAll().iterator().next()));
		endorserRecordsCopy.add(endorserRecordService.clone(endorserRecordService.findAll().iterator().next()));
		template("dancer3", personalrecord, copyCustom, endorserRecordsCopy, new ArrayList<StyleRecord>(), "name", "mail@mail.com", null);

	}

	//Test #04: Test with records from all categories. Expected true.
	@Test
	public void positiveTest4() {
		PersonalRecord personalrecord = personalRecordService.clone(personalRecordService.findAll().iterator().next());
		List<CustomRecord> copyCustom = new ArrayList<CustomRecord>();
		List<EndorserRecord> endorserRecordsCopy = new ArrayList<EndorserRecord>();
		List<StyleRecord> styleRecords = new ArrayList<StyleRecord>();

		copyCustom.add(customRecordService.clone(customRecordService.findAll().iterator().next()));
		copyCustom.add(customRecordService.clone(customRecordService.findAll().iterator().next()));

		endorserRecordsCopy.add(endorserRecordService.clone(endorserRecordService.findAll().iterator().next()));
		endorserRecordsCopy.add(endorserRecordService.clone(endorserRecordService.findAll().iterator().next()));

		styleRecords.add(styleRecordService.clone(styleRecordService.findAll().iterator().next()));
		styleRecords.add(styleRecordService.clone(styleRecordService.findAll().iterator().next()));
		template("dancer3", personalrecord, copyCustom, endorserRecordsCopy, styleRecords, "name", "mail@mail.com", null);

	}

	//Test #05: Attempt to create a curriculum with no personal record. Expected false.
	@Test
	public void negativeTest0() {

		template("dancer3", null, new ArrayList<CustomRecord>(), new ArrayList<EndorserRecord>(), new ArrayList<StyleRecord>(), "name", "mail@mail.com", NullPointerException.class);

	}

	//Test #06: Attempt to create a null custom record. Expected false.
	@Test
	public void negativeTest1() {
		PersonalRecord personalrecord = personalRecordService.clone(personalRecordService.findAll().iterator().next());

		template("dancer2", personalrecord, null, new ArrayList<EndorserRecord>(), new ArrayList<StyleRecord>(), "name", "mail@mail.com", ConstraintViolationException.class);

	}

	//Test #07: Attempt to create a null endorser record. Expected false.
	@Test
	public void negativeTest2() {
		PersonalRecord personalrecord = personalRecordService.clone(personalRecordService.findAll().iterator().next());

		template("dancer1", personalrecord, new ArrayList<CustomRecord>(), null, new ArrayList<StyleRecord>(), "name", "mail@mail.com", ConstraintViolationException.class);

	}

	//Tetst #08: Attempt to create several curricula. Expected true.
	@Test
	public void driver() {
		PersonalRecord personalrecord1 = personalRecordService.clone(personalRecordService.findAll().iterator().next());
		PersonalRecord personalrecord2 = personalRecordService.clone(personalRecordService.findAll().iterator().next());
		PersonalRecord personalrecord3 = personalRecordService.clone(personalRecordService.findAll().iterator().next());
		template("dancer1", personalrecord1, new ArrayList<CustomRecord>(), new ArrayList<EndorserRecord>(), new ArrayList<StyleRecord>(), "name", "mail@mail.com", null);
		template("dancer2", personalrecord2, new ArrayList<CustomRecord>(), new ArrayList<EndorserRecord>(), new ArrayList<StyleRecord>(), "name", "mail@mail.com", null);
		template("dancer3", personalrecord3, new ArrayList<CustomRecord>(), new ArrayList<EndorserRecord>(), new ArrayList<StyleRecord>(), "name", "mail@mail.com", null);
	}
	
	//Test #09: Attempt to edit a personal record with a null value. Expected false.
	@Test
	public void negativeTest3() {
		PersonalRecord personalrecord = personalRecordService.clone(personalRecordService.findAll().iterator().next());

		template("dancer1", personalrecord, new ArrayList<CustomRecord>(), null, new ArrayList<StyleRecord>(), null, "mail@mail.com", ConstraintViolationException.class);

	}
	
	//Test #10: Attempt to edit a personal record with an erroneous value. Expected false.
	@Test
	public void negativeTest4() {
		PersonalRecord personalrecord = personalRecordService.clone(personalRecordService.findAll().iterator().next());

		template("dancer1", personalrecord, new ArrayList<CustomRecord>(), null, new ArrayList<StyleRecord>(), "name", "mail", ConstraintViolationException.class);

	}

}
