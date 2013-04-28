module CourseRepository
  extend ActiveSupport::Concern
  include UsefullScopes

  included do
    scope :active, -> { where(state: :active) }
    scope :web, -> { asc_by(:position).active }
    scope :admin, -> { asc_by(:position) }
  end

end