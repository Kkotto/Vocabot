@RestResource(urlMapping = '/vocabotWebhook')
global class VocabotWebhook {
    
    private static final String PROCCESS_NAME = VocabotWebhook.class.getName();

    private static LogHandler logger = new LogHandler();

    @HttpPost
    global static void receiveMessage() {
        try {
            String receivedData = RestContext.request.requestBody.toString().replaceFirst('from', 'user_from').replaceFirst('date', 'unix_datetime');
            UpdateWrapper message = (UpdateWrapper) JSON.deserialize(receivedData, UpdateWrapper.class);
            logger.log(PROCCESS_NAME, message);
        } catch (Exception e) {
            logger.log(PROCCESS_NAME, Consts.MESSAGE_ERROR_OCCURRED, e.getStackTraceString());
        } finally {
            logger.save();
        }
    }
}