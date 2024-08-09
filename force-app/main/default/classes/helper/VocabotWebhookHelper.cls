public with sharing class VocabotWebhookHelper {

    private static final String PROCESS_NAME = VocabotWebhookHelper.class.getName();
    private static LogHandler logger = new LogHandler();

    public static void createTelegramUser(UserWrapper user) {
        try {
            Telegram_User__c telegramUser = new Telegram_User__c();
            telegramUser.Id__c = user.id;
            telegramUser.Is_bot__c = user.is_bot;
            telegramUser.First_Name__c = user.first_name;
            telegramUser.Last_Name__c = user.last_name;
            telegramUser.Username__c = user.username;
            telegramUser.Language_Code__c = user.language_code;
            upsert telegramUser Id__c;
        } catch (Exception e) {
            logger.log(PROCESS_NAME, e.getMessage(), e.getStackTraceString());
        } finally {
            logger.save();
        }
    }

    public static Boolean shouldProceed(UpdateWrapper receivedUpdate) {
        if (receivedUpdate.message.chat.type.equals('private')) {
            return true;
        }

        Map<String, Bot_Command__mdt> commands = Bot_Command__mdt.getAll();
        String commandPostfix = Bot_Prefix__mdt.getInstance(Active_Bot_Name__c.getInstance().Bot_Name__c).Prefix__c;
        for (Bot_Command__mdt command : commands.values()) {
            if (command.Is_Active__c && receivedUpdate.message.text.startsWith(command.Command__c + commandPostfix)) {
                return true;
            }
        }
        return false;
    }
}