public with sharing class VocabotWebhookHandler {

    public static final String PROCESS_NAME = VocabotWebhookHandler.class.getName();
    private static LogHandler logger = new LogHandler();

    public VocabotWebhookHandler(UpdateWrapper receivedUpdate) {
        try {
            handleUser(receivedUpdate.message.user_from);
       } catch (Exception e) {
            logger.log(PROCESS_NAME, e.getMessage(), e.getStackTraceString());
       } finally {
            logger.save();
       }

    }

    private void handleUser(UserWrapper user) {
        if (![SELECT Id FROM Telegram_User__c WHERE Id__c = :user.id].isEmpty()) {
            return;
        }
        VocabotWebhookHelper.createTelegramUser(user);
    }
}