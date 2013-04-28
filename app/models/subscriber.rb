class Subscriber < ActiveRecord::Base
  include SubscriberRepository

  attr_accessible :email, :fio, :notify_about_center_events, :phone

  validates :email, presence: true, email: true
  validates :fio, presence: true
  validates :phone, presence: true
end
