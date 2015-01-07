global class ScheduleUpdateReportsTo implements Schedulable
{
    global void execute(SchedulableContext  sc)
    {
        BatchUpdateReportsTo  b = new BatchUpdateReportsTo();
        Database.executeBatch(b);
    }
}