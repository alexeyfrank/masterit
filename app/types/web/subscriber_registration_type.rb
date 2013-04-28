class Web::SubscriberRegistrationType < Subscriber
  include BasicType

  attr_accessible :processing_personal_data

  validates :email, presence: true, email: true
  validates :fio, presence: true
  validates :phone, presence: true
  validates :processing_personal_data, acceptance: true

end