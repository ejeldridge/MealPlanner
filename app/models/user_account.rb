class UserAccount < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password_hash, :salt, :session, :session_expire
  belongs_to :schedule

end
