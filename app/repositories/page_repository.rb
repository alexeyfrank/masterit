module PageRepository
  extend ActiveSupport::Concern
  include UsefullScopes

  included do
    scope :web, -> { asc_by_title }
  end

end