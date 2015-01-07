/**
 * (c) Tony Scott. Licensed under a Creative Commons Attribution 3.0 Unported License.
 * 				   http://creativecommons.org/licenses/by/3.0/deed.en_US
 *
 * This software is provided as is, at your own risk and without warranty of any kind.
 *
 * Please visit my blog: http://meltedwires.com/ and 'like' if you've found this useful.
 *
 * Trigger to populate the correct key prefix on insert/update
 */
trigger ConditionSetTrigger on ConditionSet__c (before insert, before update)
{
	// Store the SObject API Names in a Set to get a unique list
	// to minimise the number or describe calls we need to do.
	Set<String> apiNames = new Set<String>();

	for (SObject so : Trigger.new)
	{
		ConditionSet__c o = (ConditionSet__c)so;
		apiNames.add(o.SObjectAPIName__c);
	}

	// Map to hold API Names to Key Prefixes
	Map<String, String> prefixMap = new Map<String, String>();

	// Get the Key Prefixes for the SObject types via a describe
	for (String apiName : apiNames)
	{
		Type t = Type.forName(apiName);

		// We can't find a type so throw an exception
		if (t == null)
		{
			throw new TriggerException('Could not resolve SOBject type from:' + apiName);
		}

		// Instantiate the type to get its SOBjectType
		Object o = t.newInstance();
		Schema.SObjectType soType = ((SObject)o).getSObjectType();

		// Perform a describe on the Object type to get its Key Prefix
		Schema.DescribeSObjectResult d = soType.getDescribe();
		
		// Add it to the map
		prefixMap.put(apiName, d.getKeyPrefix());
	}

	// Populate the key prefix
	for (SObject so : Trigger.new)
	{
		ConditionSet__c o = (ConditionSet__c)so;
		
		String keyPrefix = prefixMap.get(o.SObjectAPIName__c);
		o.KeyPrefix__c = keyPrefix;
	}

	public class TriggerException extends Exception {}
}