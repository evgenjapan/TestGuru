class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users

  def self.titles_by_category(category_title)
    joins(:category).where(categories: {title: category_title}).order('tests.title DESC').pluck('tests.title')
  end
end
