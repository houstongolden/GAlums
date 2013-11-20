# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Galums::Application.initialize!

# SendGrid configuration with Heroku
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['app19265108@heroku.com'],
  :password       => ENV['4fyzkaov'],
  :domain         => 'galums.herokuapp.com',
  :enable_starttls_auto => true
}
