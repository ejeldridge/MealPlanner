class UserAccount < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password_hash, :salt, :session, :session_expire, :user_name
  has_many :schedules, :dependent => :destroy

  validates :email, :uniqueness => true

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true


end
