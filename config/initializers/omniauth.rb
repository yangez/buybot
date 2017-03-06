Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, ENV['SLACK_LOGIN_APP_ID'], ENV['SLACK_LOGIN_APP_SECRET'],
    scope: 'identity.basic,identity.email', callback_path: '/auth/slack/callback',
    provider_ignores_state: true
end
