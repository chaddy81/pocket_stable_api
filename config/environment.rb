# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ServerApi::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.gmail.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['GMAIL_USERNAME'],
  :password       => ENV['GMAIL_PASSWORD'],
  :domain         => 'gmail.com',
  :enable_starttls_auto => true
}
