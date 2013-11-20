Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, ENV['MgS2gnYPRwGnYl1irWJDHQ'], ENV['y4p1j3Fs8IJ5AbqI2hLs0o90860HawkOJDUXoZp1I']
end