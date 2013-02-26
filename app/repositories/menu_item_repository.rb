module MenuItemRepository
  extend ActiveSupport::Concern
  include UsefullScopes

  included do
    scope :web, -> { by_position }
  end

end