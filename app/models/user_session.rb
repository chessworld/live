class UserSession < Authlogic::Session::Base
  validate :check_if_suspended
  
  def check_if_suspended
    if attempted_record.suspend_until && attempted_record.suspend_until > Date.today
      errors.add :base, "Account has been suspended until #{attempted_record.suspend_until} due to inappropriate behaviour"
    end
  end
end