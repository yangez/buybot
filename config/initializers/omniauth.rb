Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, ENV['SLACK_LOGIN_APP_ID'], ENV['SLACK_LOGIN_APP_SECRET'],
    scope: 'identity.basic, identity.email, identity.avatar', name: :sign_in_with_slack
end
