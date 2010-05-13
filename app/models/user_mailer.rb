class UserMailer < ActionMailer::Base
  def password_reset_instructions user
    subject 'Password Reset Instructions'
    from    'Chess Kids Live'
    recipients user.email
    sent_on Time.now
    body  :password_reset_url => reset_password_user_path(user, :token => user.perishable_token, :only_path => false)
  end
end
