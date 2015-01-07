global class ScheduleUpdateAccountName implements Schedulable
{
    global void execute(SchedulableContext  sc)
    {
        BatchUpdateAccountName  b = new BatchUpdateAccountName();
        Database.executeBatch(b);
    }
}