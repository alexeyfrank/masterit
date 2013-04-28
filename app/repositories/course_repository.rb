module CourseRepository
  extend ActiveSupport::Concern
  include UsefullScopes

  included do
    scope :active, -> { where(state: :active) }
    scope :web, -> { asc_by_position.active }
    scope :admin, -> { asc_by_position }
  end

end