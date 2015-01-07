/**
 * (c) Tony Scott. Licensed under a Creative Commons Attribution 3.0 Unported License.
 * 				   http://creativecommons.org/licenses/by/3.0/deed.en_US
 *
 * This software is provided as is, at your own risk and without warranty of any kind.
 *
 * Please visit my blog: http://meltedwires.com/ and 'like' if you've found this useful.
 *
 * Web Service class for Condition Sets
 */
global without sharing class ConditionSetWebService
{
	/**
	 * Web service method to retrieve the hidden buttons and associated metadata
	 *
	 * Arguments:	Id		SObject Id of the target object
	 *
	 * Returns:		String	JSON Serialized Response object.
	 */
	webservice static String getHiddenButtons(Id objectId)
	{
		// Get the key prefix of the object Id
		String keyPrefix = ((String)objectId).left(3);

		// Query the Condition Set based on the key prefix
		ConditionSet__c condSet;

		try
		{
			condSet = [Select Id, Name, SObjectAPIName__c, HideEditField__c, HideDeleteField__c, HideSubmitField__c, HideCloneField__c, HideOption__c,
											(Select CustomButtonAPIName__c, HideControlField__c From CustomConditions__r)
										From ConditionSet__c Where KeyPrefix__c = :keyPrefix];
		}
		catch(System.QueryException e)
		{
			throw new ServiceException('No Condition Set found for key: ' + keyPrefix);
		}

		// Build a query to obtain the state of the control fields
		String query = 'Select ';

		// Use a set to filter out any duplicate fiels names
		Set<String> fieldSet = new Set<String>();

		if (condSet.HideEditField__c != null && condSet.HideEditField__c != '')
		{
			fieldSet.add(condSet.HideEditField__c);
		}

		if (condSet.HideDeleteField__c != null && condSet.HideDeleteField__c != '')
		{
			fieldSet.add(condSet.HideDeleteField__c);
		}

		if (condSet.HideSubmitField__c != null && condSet.HideSubmitField__c != '')
		{
			fieldSet.add(condSet.HideSubmitField__c);
		}

		if (condSet.HideCloneField__c != null && condSet.HideCloneField__c != '')
		{
			fieldSet.add(condSet.HideCloneField__c);
		}

		for (CustomCondition__c cond : condSet.CustomConditions__r)
		{
			fieldSet.add(cond.HideControlField__c);
		}

		for (String f : fieldSet)
		{
			query += f + ',';
		}

		// Strip the trailing ,
		query = query.removeEnd(',');

		query += ' From ' + condSet.SObjectAPIName__c + ' Where Id = :objectId';

		// Query the row
		SObject row;

		try
		{
			row = Database.query(query);
		}
		catch(System.QueryException e)
		{
			throw new ServiceException('Now row found for object: ' + objectId);
			return null;
		}

		// Build a list of hidden button names from the results
		List<String> hiddenButtons = new List<String>();

		if (condSet.HideEditField__c != null && condSet.HideEditField__c != '')
		{
			Boolean hide = (Boolean)row.get(condSet.HideEditField__c);

			if (hide)
			{
				hiddenButtons.add('edit');
			}
		}

		if (condSet.HideDeleteField__c != null && condSet.HideDeleteField__c != '')
		{
			Boolean hide = (Boolean)row.get(condSet.HideDeleteField__c);

			if (hide)
			{
				hiddenButtons.add('delete');
			}
		}

		if (condSet.HideSubmitField__c != null && condSet.HideSubmitField__c != '')
		{
			Boolean hide = (Boolean)row.get(condSet.HideSubmitField__c);

			if (hide)
			{
				hiddenButtons.add('submit');
			}
		}

		if (condSet.HideCloneField__c != null && condSet.HideCloneField__c != '')
		{
			Boolean hide = (Boolean)row.get(condSet.HideCloneField__c);

			if (hide)
			{
				hiddenButtons.add('clone');
			}
		}

		for (CustomCondition__c cond : condSet.CustomConditions__r)
		{
			Boolean hide = (Boolean)row.get(cond.HideControlField__c);

			if (hide)
			{
				hiddenButtons.add(cond.CustomButtonAPIName__c.toLowerCase());
			}
		}

		// Return a serialized response object with the Hide Option and Hidden Buttons
		return JSON.serialize(new Response(condSet.HideOption__c, hiddenButtons));
	}

	/**
	 * Inner Response Class
	 */
	public class Response
	{
		public String HideOption {get; set;}
		public List<String> HiddenButtons {get; set;}

		public Response(String hideOption, List<String> hiddenButtons)
		{
			this.HideOption = hideOption;
			this.HiddenButtons = hiddenButtons;
		}
	}

	global class ServiceException extends Exception {}
}