class Menu < ActiveRecord::Base
  include MenuRepository

  attr_accessible :description, :name

  has_many :items, class_name: 'Menu::Item', extend: [ Extensions::MenuExtension ]

  def to_s
    name
  end
end
