class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.validate_email_field = false
  end
  
  validates_length_of :email, :within => 6..100
  validates_format_of :email, :with => Authlogic::Regex.email,
    :message => I18n.t('error_messages.email_invalid', :default => 'should look like an email address.')
end
