# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Quizroom::Application.initialize!

ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "not_done_yet.herokuapp.com",
  authentication: "plain",
  enable_starttls_auto: true,
  user_name: "quizroom1@gmail.com",
  password: "gschool0"
}