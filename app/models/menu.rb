class Menu < ActiveRecord::Base
  include MenuRepository

  attr_accessible :description, :name

  has_many :menu_items

  def to_s
    name
  end
end
