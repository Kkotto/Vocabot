@RestResource(urlMapping = '/vocabotWebhook')
global class VocabotWebhook {
    
    private static LogHandler logger = new LogHandler();

    @HttpPost
    global static void receiveMessage() {
        logger.log('it worked!');
        logger.save();
    }
}