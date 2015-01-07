global class ScheduleUpdateAddress2 implements Schedulable
{
    global void execute(SchedulableContext  sc)
    {
        BatchUpdateAddress2  b = new BatchUpdateAddress2();
        Database.executeBatch(b);
    }
}