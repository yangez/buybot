Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, ENV['SLACK_BOT_APP_ID'], ENV['SLACK_BOT_APP_SECRET'],
    scope: '', callback_path: '/auth/slack/callback',
    provider_ignores_state: true
end
