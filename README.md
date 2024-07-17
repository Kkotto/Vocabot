# Vocabot
Salesforce &amp; Telegram Integration. Telegram bot for learning vocabulary.

# Bot setup

1. Create bot with https://t.me/BotFather.
2. Create global class with @RestResource(urlMapping = '/[your mapping]') annotation
3. Setup > Digital Experiences > Settings > Enable Digital Experiences
4. Setup > Digital Experiences > Settings > Create new site
5. Setup > Digital Experiences > All sites > Builder > Settings > General > Site Details > Public Access > Enable _Guest users can see and interact with the site without logging in_ > Publish
6. Setup > Digital Experiences > All sites > Builder > Settings > General > Site Details > Guest User Profile > Click on [Site Name] Profile > Enabled Apex Class Access > Edit > Add webhook class from step 1 > Save
7. Don't forget to add all necessary objects and classes accesses to guest user profile ([Site Name] Profile). This profile is only possible to find through the builder (step 6).
8. Setup > Digital Experiences > All sites > Workspaces > Administration > Settings > Activate. Save site URL
9. Test with Postman next POST request:
`https://[Site URL]/services/apexrest/[Webhook mapping]`. For instance, `https://test-dev-ed.develop.my.site.com/services/apexrest/testWebhook`.
10.  Set webhook - in any browser paste next line: `https://api.telegram.org/bot{API_KEY}/setWebhook?url={REST_RESOURCE_URL}`. REST_RESOURCE_URL is the url from step 9. For instance, `https://api.telegram.org/bot0000000000:AAAAAAAAAAAAAAAAAAAAAA/setWebhook?url={https://test-dev-ed.develop.my.site.com/services/apexrest/testWebhook}`.
11.  Test your bot.  

Guide source: https://www.sparkybit.com/post/telegram-integration-with-salesforce