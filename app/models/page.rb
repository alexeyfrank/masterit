class Page < ActiveRecord::Base
  include PageRepository

  attr_accessible :content, :title, :tags, :tag_list, :slug

  #belongs_to :author, class_name: :User

  #validates :author, presence: true
  validates :title, presence: true
  validates :slug, presence: true, slug: true

  acts_as_taggable_on :tags

  state_machine initial: :unpublished do
    state :published
    state :unpublished

    event :publish do
      transition [:unpublished] => :published
    end

    event :unpublish do
      transition [:published] => :unpublished
    end
  end

  def to_s
    title
  end

  def to_param
    slug
  end

end
