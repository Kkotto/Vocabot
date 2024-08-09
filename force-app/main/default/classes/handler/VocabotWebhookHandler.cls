public without sharing class VocabotWebhookHandler {

    public static final String PROCESS_NAME = VocabotWebhookHandler.class.getName();
    private static LogHandler logger = new LogHandler();

    public VocabotWebhookHandler(UpdateWrapper receivedUpdate) {
        try {
            if (VocabotWebhookHelper.shouldProcess(receivedUpdate)) {
                logger.log(PROCESS_NAME, 'yes should');
                handleUser(receivedUpdate.message.user_from);
            } else {
                logger.log(PROCESS_NAME, 'nop');
            }
       } catch (Exception e) {
            logger.log(PROCESS_NAME, e.getMessage(), e.getStackTraceString());
       } finally {
            logger.save();
       }

    }

    private void handleUser(UserWrapper user) {
        if ([SELECT Id FROM Telegram_User__c WHERE Id__c = :user.id].isEmpty()) {
            logger.log('um : ' + [SELECT Id FROM Telegram_User__c]);
            logger.log('wth: ' + user.id);
            VocabotWebhookHelper.createTelegramUser(user);
        }
    }
}