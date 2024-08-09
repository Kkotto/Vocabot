public without sharing class VocabotWebhookHandler {

    public final String PROCESS_NAME = VocabotWebhookHandler.class.getName();
    private LogHandler logger = new LogHandler();

    public void handleUpdate(UpdateWrapper receivedUpdate) {
        try {
            if (!VocabotWebhookHelper.shouldProceed(receivedUpdate)) {
                return;
            }

            handleUser(receivedUpdate);
        } catch (Exception e) {
            logger.log(PROCESS_NAME, e.getMessage(), e.getStackTraceString());
        } finally {
            logger.save();
        }
    }

    private void handleUser(UpdateWrapper receivedUpdate) {
        if ([SELECT Id FROM Telegram_User__c WHERE Id__c = :receivedUpdate.message.user_from.id].isEmpty()) {
            VocabotWebhookHelper.createTelegramUser(receivedUpdate.message.user_from);
        }
    }
}