class UserMailer < ActionMailer::Base
  FROM = "Chess Kids Online <info@chesskids.com.au>"
  
  def password_reset_instructions user
    from UserMailer::FROM
    subject 'Password Reset Instructions'
    recipients user.email
    sent_on Time.now
    body  :password_reset_url => reset_password_user_path(user, :token => user.perishable_token, :only_path => false)
  end

  def activation_instructions(user)
    from UserMailer::FROM
    subject       "Activation Instructions"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => activate_url(user.perishable_token)
  end

  def welcome(user)
    from UserMailer::FROM
    subject       "Welcome to the site!"
    recipients    user.email
    sent_on       Time.now
    body          :root_url => root_url
  end
end
