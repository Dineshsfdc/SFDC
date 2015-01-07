/**
 * (c) Tony Scott. Licensed under a Creative Commons Attribution 3.0 Unported License.
 * 				   http://creativecommons.org/licenses/by/3.0/deed.en_US
 *
 * This software is provided as is, at your own risk and without warranty of any kind.
 *
 * Please visit my blog: http://meltedwires.com/ and 'like' if you've found this useful.
 *
 * Unit Tests.
 */
@isTest
private class ConditionSetTests
{
	static testMethod void testTrigger()
	{
		// Create a Condition Set over the Account object
		ConditionSet__c cSet = new ConditionSet__c(
			SObjectAPIName__c = 'Account'
		);

		insert cSet;

		// Assert that the key prefix has been populated
		cSet = [Select Id, Name, KeyPrefix__c from ConditionSet__c Where Id = :cSet.Id];
		System.assertEquals('001', cSet.KeyPrefix__c);
	}

	static testMethod void testWebService()
	{
		// Create a Condition Set over the Contact object and bind the Hide fields to the DoNotCall checkbox
		ConditionSet__c cSet = new ConditionSet__c(
			SObjectAPIName__c = 'Contact',
			HideCloneField__c = 'DoNotCall',
			HideDeleteField__c = 'DoNotCall',
			HideEditField__c = 'DoNotCall',
			HideSubmitField__c = 'DoNotCall',
			HideOption__c = 'Hide'
		);

		insert cSet;

		// Create a contact with the DoNotCall check box selected
		{
			Contact c = new Contact(
				LastName = 'test',
				DoNotCall = true
			);

			insert c;

			// Call the web service and assert the results
			String responseString = ConditionSetWebService.getHiddenButtons(c.Id);

			ConditionSetWebService.Response response = (ConditionSetWebService.Response)JSON.deserialize(responseString, ConditionSetWebService.Response.class);

			System.assertEquals('Hide', response.HideOption);
			System.assertEquals(4, response.HiddenButtons.size());
		}

		// Create a contact without the DoNotCall check box selected
		{
			Contact c = new Contact(
				LastName = 'test2'
			);

			insert c;

			// Call the web service and assert the results
			String responseString = ConditionSetWebService.getHiddenButtons(c.Id);

			ConditionSetWebService.Response response = (ConditionSetWebService.Response)JSON.deserialize(responseString, ConditionSetWebService.Response.class);

			System.assertEquals('Hide', response.HideOption);
			System.assertEquals(0, response.HiddenButtons.size());
		}
	}
}