global class ScheduleApexDemo implements Schedulable {
    
    global void execute(SchedulableContext sc){
        System.debug('In the execute method of schedule job');
    }

}