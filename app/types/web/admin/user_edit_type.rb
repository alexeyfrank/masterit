class Web::Admin::UserEditType < User
  include BasicType

  attr_accessible :password_confirmation

  validates :first_name,  presence: true
  validates :last_name,  presence: true
  validates :password, confirmation: true

end