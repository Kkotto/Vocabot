public with sharing class MessageWrapper {
    public String message_id { get; set; }
    public String message_thread_id { get; set; }
    public UserWrapper user_from { get; set; }
    public ChatWrapper chat { get; set; }
}