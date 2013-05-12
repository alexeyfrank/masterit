class Subscriber < ActiveRecord::Base
  include SubscriberRepository

  attr_accessible :email, :fio, :notify_about_center_events, :phone, :course_id

  validates :email, presence: true, email: true
  validates :fio, presence: true
  validates :phone, presence: true

  belongs_to :course
end
