Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "#{ENV['FACEBOOK_APP_ID']}", "#{ENV['FACEBOOK_APP_SERCRET']}", :scope => 'email, user_friends, manage_pages, pages_show_list'
  # provider :google_oauth2, "#{ENV['GOOGLE_APP_ID']}", "#{ENV['GOOGLE_APP_SERCRET']}", scope: 'userinfo.profile,youtube,email', provider_ignores_state: true, prompt: :consent
  provider :twitter, "#{ENV['TWITTER_CONSUMER_KEY']}", "#{ENV['TWITTER_CONSUMER_SECRET']}"
  # provider :linkedin, "#{ENV['LINKEDIN_APP_ID']}", "#{ENV['LINKEDIN_APP_SERCRET']}"
  # provider :instagram, "#{ENV['INSTAGRAM_APP_ID']}", "#{ENV['INSTAGRAM_APP_SERCRET']}"
end