@RestResource(urlMapping = '/vocabotWebhook')
global class VocabotWebhook {
    
    private static final String PROCCESS = VocabotWebhook.class.getName();

    private static LogHandler logger = new LogHandler();

    @HttpPost
    global static void receiveMessage() {
        try {
            String receivedData = RestContext.request.requestBody.toString();
            TelegramUpdateMessageWrapper message = (TelegramUpdateMessageWrapper) JSON.deserialize(receivedData, TelegramUpdateMessageWrapper.class);
            logger.log(PROCCESS, message);
        } catch (Exception e) {
            logger.log(PROCCESS, Consts.MESSAGE_ERROR_OCCURRED, e.getStackTraceString());
        } finally {
            logger.save();
        }
    }
}