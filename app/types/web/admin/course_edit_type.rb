class Web::Admin::CourseEditType < Course
  include BasicType

  attr_accessible :state_event
end