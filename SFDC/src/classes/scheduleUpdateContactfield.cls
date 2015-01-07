global class scheduleUpdateContactfield implements Schedulable
{
    global void execute(SchedulableContext sc)
    {
        UpdateContactfield  b = new UpdateContactfield();
        Database.executeBatch(b);
    }
}