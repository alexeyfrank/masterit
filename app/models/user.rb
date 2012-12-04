class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :first_name, :last_name, :password

  validates :email, :presence => true, :uniqueness => true, :email => true
end
