class Web::Admin::MenuEditType < Menu
  include BasicType

  validates :name, presence: true
end