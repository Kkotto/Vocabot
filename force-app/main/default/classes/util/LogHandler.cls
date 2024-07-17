public with sharing class LogHandler {
    
    private final String DEFAULT_VALUE = Consts.BLANK_VALUE;
    
    private List<Error_Log__c> logs;
    
    public LogHandler() {
        this.logs = new List<Error_Log__c>();
    }

    public LogHandler(String processName, Object message) {
        Error_Log__c logRecord = generateLog(processName, message.toString(), DEFAULT_VALUE);
        this.logs = new List<Error_Log__c>();
        this.logs.add(logRecord);
    }

    public LogHandler(String processName, Object message, String stackTrace) {
        Error_Log__c logRecord = generateLog(processName, message.toString(), stackTrace);
        this.logs = new List<Error_Log__c>();
        this.logs.add(logRecord);
    }

    private Error_Log__c generateLog(String processName, Object message, String stackTrace) {
        Error_Log__c logRecord = new Error_Log__c();
        logRecord = new Error_Log__c();
        logRecord.Message__c = message.toString();
        logRecord.Process_Name__c = processName;
        logRecord.Stack_Trace__c = stackTrace;
        logRecord.Timestamp__c = Datetime.now();
        return logRecord;
    }

    public void log(Object message) {
        Error_Log__c logRecord = generateLog(DEFAULT_VALUE, message.toString(), DEFAULT_VALUE);
        this.logs.add(logRecord);
    }

    public void log(String processName, Object message) {
        Error_Log__c logRecord = generateLog(processName, message.toString(), DEFAULT_VALUE);
        this.logs.add(logRecord);
    }

    public void log(String processName, Object message, String stackTrace) {
        Error_Log__c logRecord = generateLog(processName, message.toString(), stackTrace);
        this.logs.add(logRecord);
    }

    public void save() {
        if (!this.logs.isEmpty()) {
            Database.insert(this.logs, false);
        }
    }
}