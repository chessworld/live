class User < ActiveRecord::Base
  acts_as_authentic
  
  def self.find_by_login_or_email login
    find_by_login(login) || find_by_email(login)
  end
end
