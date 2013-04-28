module MenuItemRepository
  extend ActiveSupport::Concern
  include UsefullScopes

  included do
    scope :web, -> { asc_by_position }
  end

end