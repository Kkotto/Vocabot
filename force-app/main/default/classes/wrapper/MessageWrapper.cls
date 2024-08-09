public with sharing class MessageWrapper {
    public String message_id { get; set; }
    public String message_thread_id { get; set; }
    public UserWrapper user_from { get; set; }
    public ChatWrapper sender_chat { get; set; }
    public String unix_datetime { get; set; }
    public ChatWrapper chat { get; set; }
    public MessageWrapper reply_to_message { get; set; }
    public String edit_date { get; set; }
    public String text { get; set; }
}