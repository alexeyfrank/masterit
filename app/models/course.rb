class Course < ActiveRecord::Base
  include CourseRepository

  attr_accessible :content, :position, :preview, :title

  validates :title, presence: true, length: { maximum: 255 }

  mount_uploader :preview, CoursePreviewUploader

  state_machine initial: :inactive do
    state :inactive
    state :active

    event :activate do
      transition [:inactive] => :active
    end

    event :deactivate do
      transition [:active] => :inactive
    end
  end
end
