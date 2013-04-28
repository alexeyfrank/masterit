class Web::Admin::SubscriberEditType < Subscriber
  include BasicType

  validates :email, presence: true, email: true
  validates :fio, presence: true
  validates :phone, presence: true

end