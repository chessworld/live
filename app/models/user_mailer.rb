class UserMailer < ActionMailer::Base
  def password_reset_instructions user
    subject 'Password Reset Instructions'
    from    'Chess Kids Live'
    recipients user.email
    sent_on Time.now
    body  :password_reset_url => reset_password_user_path(user, :token => user.perishable_token, :only_path => false)
  end

  def activation_instructions(user)
    subject       "Activation Instructions"
    from          "mailer@chesskids.com.au"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => activate_url(user.perishable_token)
  end

  def welcome(user)
    subject       "Welcome to the site!"
    from          "mailer@chesskids.com.au"
    recipients    user.email
    sent_on       Time.now
    body          :root_url => root_url
  end
end
